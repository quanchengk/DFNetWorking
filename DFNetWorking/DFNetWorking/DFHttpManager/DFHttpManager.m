//
//  DFHttpManager.m
//
//
//  Created by 全程恺 on 9/29/16.
//  Copyright © 2016 xmisp. All rights reserved.
//

#import "DFHttpManager.h"
#import "DFHttpValid.h"

@interface DFHttpManager () <DFRequestDelegate>

@property (nonatomic, retain) AFHTTPSessionManager  *manager;

@end

@implementation DFHttpManager

static DFHttpManager *sharedInstance = nil;
+ (DFHttpManager *)sharedInstance {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
        
        DFRequestConfigure *requestConfig = [DFRequestConfigure new];
        
        AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
        
        manager.requestSerializer.cachePolicy = [requestConfig cachePolicy];
        manager.requestSerializer.timeoutInterval = [requestConfig timeoutInterval];
        
        NSDictionary *headerFieldValue = [requestConfig headerFieldValues];
        [headerFieldValue enumerateKeysAndObjectsUsingBlock:^(id key, id value, BOOL * stop) {
            if ([key isKindOfClass:[NSString class]] && [value isKindOfClass:[NSString class]]) {
                [manager.requestSerializer setValue:value forHTTPHeaderField:key];
            }
        }];
        
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

- (DFRequest *)addRequestObject:(DFRequestObject *)requestObj {
    
    DFRequest *request = [DFRequest new];
    request.manager = self.manager;
    request.completeDelegate = self;
    request.requestObj = requestObj;
    
    [DFHttpValid isValidRequest:requestObj success:^(NSDictionary *params) {
        
        request.requestObj.requestDictionary = params;
        [request loadData];
    } failure:^(NSError *error) {
        
        [request cancel];
    }];
    
    return request;
}

- (void)cancelRequest:(DFRequest *)request {
    
    if (request.state == DFRequestStateCancle) {
        
        return;
    }
    for (NSURLSessionDataTask *task in self.manager.operationQueue.operations) {
        
        if ([task isEqual:request.dataTask]) {
            
            [task cancel];
        }
    }
}

- (void)requestDidFinishRequest:(DFRequest *)request task:(NSURLSessionDataTask *)task {
    
    if ([request.requestObj.URLString containsString:@"例外"]) {
#warning 如果需要写不用验证的请求结果，在这里直接返回
        id response = request.responseObj;
        request.requestObj.successBlock(request, response);
    }else {
        
#warning 这里可以过滤掉冗余的数据结构，如果成功就把拆解后的request.responseObj结构返回出去，数据验证失败的话把失败的原因回调出去
        [DFHttpValid isValidResponse:request.responseObj task:task success:^{
            
            request.requestObj.successBlock(request, request.responseObj);
            
        } failure:^(NSError *error) {
            
            [self requestDidFailRequest:request error:error];
        }];
        
    }
    
}

- (void)requestDidFailRequest:(DFRequest *)request error:(NSError *)error {
    
    if (error.code) {
        
#warning 请求错误，或数据解析错误，可以按需求给出相应错误
    }
    
    if (request.requestObj.failureBlock) {
        
        request.requestObj.failureBlock(request, error);
    }
}

@end
