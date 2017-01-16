//
//  CLIRequest.m
//  
//
//  Created by 全程恺 on 16/12/5.
//  Copyright © 2016年 xmisp. All rights reserved.
//

#import "CLIRequest.h"
#import "CLILogerManager.h"

@interface CLIRequest ()

@property (copy, nonatomic) NSString *URLString;
@end

@implementation CLIRequest
#pragma mark - load request

// 请求
- (void)loadData
{
    _state = CLIRequestStateLoading;
    
    if (_requestObj.serializerType == CLIRequestSerializerTypeJSON) {
        
        self.manager.requestSerializer = [AFJSONRequestSerializer serializer];
    }else if (_requestObj.serializerType == CLIRequestSerializerTypeString) {
        
        self.manager.requestSerializer = [AFJSONRequestSerializer serializer];
        self.manager.responseSerializer = [AFJSONResponseSerializer serializerWithReadingOptions:NSJSONReadingAllowFragments];
    }
    else {
        
        self.manager.responseSerializer = [AFHTTPResponseSerializer serializer];//响应
        self.manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/plain", @"text/javascript", @"text/json", @"text/html", nil];
    }
    
    NSString *URLString = _requestObj.URLString;
    if (![URLString hasPrefix:@"http"] ) {
        
        URLString = [NSString stringWithFormat:@"%@%@", [CLIRequestConfigure new].baseURL, _requestObj.URLString];
    }
    
    if (_requestObj.requestMethod == CLIRequestMethodGET) {
        
        self.dataTask = [self.manager GET:URLString parameters:_requestObj.params progress:_requestObj.progressBlock success:^(NSURLSessionDataTask * task, id responseObject) {
            
            [self requestDidResponse:responseObject error:nil];
        } failure:^(NSURLSessionDataTask * task, NSError * error) {
            
            [self requestDidResponse:nil error:error];
        }];
    }else if (_requestObj.requestMethod == CLIRequestMethodPOST) {
        
        self.dataTask = [self.manager POST:URLString parameters:_requestObj.params progress:_requestObj.progressBlock  success:^(NSURLSessionDataTask * task, id responseObject) {
            
            [self requestDidResponse:responseObject error:nil];
        } failure:^(NSURLSessionDataTask * task, NSError * error) {
            
            [self requestDidResponse:nil error:error];
        }];
    }else if (_requestObj.requestMethod == CLIRequestMethodHEAD) {
        
        self.dataTask = [self.manager HEAD:URLString parameters:_requestObj.params success:^(NSURLSessionDataTask * task) {
            
            [self requestDidResponse:nil error:nil];
        } failure:^(NSURLSessionDataTask * task, NSError * error) {
            
            [self requestDidResponse:nil error:error];
        }];
    }else if (_requestObj.requestMethod == CLIRequestMethodPUT) {
        
        self.dataTask = [self.manager PUT:URLString parameters:_requestObj.params success:^(NSURLSessionDataTask * task, id responseObject) {
            
            [self requestDidResponse:responseObject error:nil];
        } failure:^(NSURLSessionDataTask * task, NSError * error) {
            
            [self requestDidResponse:nil error:error];
        }];
    }else if (_requestObj.requestMethod == CLIRequestMethodPATCH) {
        
        self.dataTask = [self.manager PATCH:URLString parameters:_requestObj.params success:^(NSURLSessionDataTask * task, id responseObject) {
            
            [self requestDidResponse:responseObject error:nil];
        } failure:^(NSURLSessionDataTask * task, NSError * error) {
            
            [self requestDidResponse:nil error:error];
        }];
    }else if (_requestObj.requestMethod == CLIRequestMethodUploadData) {
        
        self.dataTask = [self.manager POST:URLString parameters:_requestObj.params constructingBodyWithBlock:_requestObj.bodyBlock progress:_requestObj.progressBlock success:^(NSURLSessionDataTask * task, id responseObject) {
            
            [self requestDidResponse:responseObject error:nil];
        } failure:^(NSURLSessionDataTask * task, NSError * error) {
            
            [self requestDidResponse:nil error:error];
        }];
    }
}

- (void)requestDidResponse:(id)responseObject error:(NSError *)error {
    
    
    if (error && self.completeDelegate && [self.completeDelegate respondsToSelector:@selector(requestDidFailRequest:error:)]) {
        
        CLILog(@"请求失败\n%@", error.localizedDescription);
        _state = CLIRequestStateError;
        [self.completeDelegate requestDidFailRequest:self error:error];
    }
    else if (self.completeDelegate && [self.completeDelegate respondsToSelector:@selector(requestDidFinishRequest:task:)]) {
        
        _responseObj = [self objectToJson:responseObject];
        NSString *postStr = [NSString stringWithJsonValue:self.requestObj.params];
        
        CLILog(@"请求成功\n%@\n<==:\n%@\n==>:\n%@\n", self.URLString, postStr, _responseObj);
        _state = CLIRequestStateFinish;
        [self.completeDelegate requestDidFinishRequest:self task:_dataTask];
    }
    
    [[CLILogerManager sharedCLILogerManager] updateSelector:self.URLString request:self.requestObj.params response:[self objectToJson:responseObject] error:error];
}

- (NSString *)URLString {
    
    NSString *URLString = _requestObj.URLString;
    if (![URLString hasPrefix:@"http"] ) {
        
        URLString = [NSString stringWithFormat:@"%@%@", [CLIRequestConfigure new].baseURL, _requestObj.URLString];
    }
    
    return URLString;
}

- (NSDictionary *)objectToJson:(id)obj {
    
    if ([obj isKindOfClass:[NSDictionary class]]) {
        
        return obj;
    }
    else if ([obj isKindOfClass:[NSData class]]) {
        
        NSData *resData = obj;
        NSError *err;
        
        NSDictionary *jsonValue = [NSJSONSerialization JSONObjectWithData:resData options:NSJSONReadingMutableContainers error:&err];
        
        return jsonValue;
    }
    return nil;
}

// 取消
- (void)cancel
{
    [_dataTask cancel];
    _completeDelegate = nil;
    _state = CLIRequestStateCancle;
}

- (void)dealloc
{
    [self cancel];
}
@end
