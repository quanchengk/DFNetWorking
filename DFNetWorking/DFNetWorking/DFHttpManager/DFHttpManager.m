//
//  DFHttpManager.m
//  ClickNetApp
//
//  Created by 全程恺 on 9/29/16.
//  Copyright © 2016 xmisp. All rights reserved.
//

#import "DFHttpManager.h"
#import "CLIHttpValid.h"

@interface DFHttpManager () <CLIRequestDelegate>

@property (nonatomic, retain) AFHTTPSessionManager  *manager;

//发起的请求控制器，接收到反馈内容的时候，用于判断当前控制器还是不是发起的控制器（展示错误提示的时候要用）。
@property (nonatomic, strong) id nowController;
@property (nonatomic, strong) id preController;

@end

@implementation DFHttpManager

static DFHttpManager *sharedInstance = nil;
+ (DFHttpManager *)sharedInstance {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
        
        CLIRequestConfigure *requestConfig = [CLIRequestConfigure new];
        
        AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
        
        manager.requestSerializer.cachePolicy = [requestConfig cachePolicy];
        manager.requestSerializer.timeoutInterval = [requestConfig timeoutInterval];
        
        NSDictionary *headerFieldValue = [requestConfig headerFieldValues];
        [headerFieldValue enumerateKeysAndObjectsUsingBlock:^(id key, id value, BOOL * stop) {
            if ([key isKindOfClass:[NSString class]] && [value isKindOfClass:[NSString class]]) {
                [manager.requestSerializer setValue:value forHTTPHeaderField:key];
            }
        }];
        
        //        manager.completionQueue = [self completeQueue];
        sharedInstance.manager = manager;
    });
    return sharedInstance;
}

+ (dispatch_queue_t)completeQueue {
    static dispatch_queue_t completeQueue = NULL;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        completeQueue = dispatch_queue_create("com.DFHttpManager.completeQueue", DISPATCH_QUEUE_SERIAL);
        dispatch_set_target_queue(completeQueue, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0));
    });
    return completeQueue;
}

- (CLIRequest *)addRequestObject:(CLIRequestObject *)requestObj {
    
    CLIRequest *request = [CLIRequest new];
    request.manager = self.manager;
    request.completeDelegate = self;
    request.requestObj = requestObj;
    
    [CLIHttpValid isValidRequest:requestObj success:^(NSDictionary *params) {
        
        _preController = self.nowController;
        request.requestObj.requestDictionary = params;
        [request loadData];
    } failure:^(NSError *error) {
        
        [request cancel];
    }];
    
    return request;
}

- (void)cancelRequest:(CLIRequest *)request {
    
    if (request.state == CLIRequestStateCancle) {
        
        return;
    }
    for (NSURLSessionDataTask *task in self.manager.operationQueue.operations) {
        
        if ([task isEqual:request.dataTask]) {
            
            [task cancel];
        }
    }
}

- (void)requestDidFinishRequest:(CLIRequest *)request task:(NSURLSessionDataTask *)task {
    
    if ([request.requestObj.URLString containsString:@"api.weixin.qq.com"] || [request.requestObj.URLString containsString:@"api.weibo.com"] ) {
        id response = request.responseObj;
        request.requestObj.successBlock(request, response);
    }else {
        [CLIHttpValid isValidResponse:request.responseObj task:task success:^{
            
            id response = request.responseObj[@"data"][@"result"];
            
            if (!request) {
                
                response = request.responseObj[@"data"];
            }
            if (!response) {
                
                response = request.responseObj[@"result"];
            }
            if (!response) {
                
                response = request.responseObj;
            }
            request.requestObj.successBlock(request, response);
            
        } failure:^(NSError *error) {
            
            [self requestDidFailRequest:request error:error];
        }];
        
    }
    
}

- (void)requestDidFailRequest:(CLIRequest *)request error:(NSError *)error {
    
    if (error.code) {
        
        UIViewController *vc = self.nowController;
        
        if (error.code == CLITipsCodeTokenUnused) {
            
            [CLIStoreLoadingView showFailureMessage:[NSString getTipsWithCode:error.code]];
        }
        else if ([vc respondsToSelector:@selector(shouldHideServerError)] && [vc performSelector:@selector(shouldHideServerError)]) {
            
            //隐藏错误提示
            CLIStoreLoadingView *loadingView = [CLIStoreLoadingView sharedCLIStoreLoadingView];
            [loadingView remove];
        }
        else if ([vc isEqual:self.preController]) {
            
            [CLIStoreLoadingView showFailureMessage:[NSString getTipsWithCode:error.code pre:nil placeTip:error.domain]];
        }
        else {
            
            CLIStoreLoadingView *loadingView = [CLIStoreLoadingView sharedCLIStoreLoadingView];
            [loadingView remove];
        }
    }
    
    if (request.requestObj.failureBlock) {
        
        request.requestObj.failureBlock(request, error);
    }
}

- (id)nowController {
    
    id topObj = [CLIHelper getTopViewController];
    UIViewController *vc;
    if ([topObj isKindOfClass:[UITabBarController class]]) {
        
        UITabBarController *tabbar = topObj;
        UINavigationController *nav = tabbar.viewControllers[tabbar.selectedIndex];
        vc = nav.topViewController;
    }
    else if ([topObj isKindOfClass:[UINavigationController class]]) {
        
        vc = ((UINavigationController *)topObj).topViewController;
    }
    else {
        
        vc = topObj;
    }
    
    return vc;
}

@end
