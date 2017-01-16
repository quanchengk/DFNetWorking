//
//  DFRequest.m
//  
//
//  Created by 全程恺 on 16/12/5.
//  Copyright © 2016年 xmisp. All rights reserved.
//

#import "DFRequest.h"

@interface DFRequest ()

@property (copy, nonatomic) NSString *URLString;
@end

@implementation DFRequest
#pragma mark - load request

// 请求
- (void)loadData
{
    _state = DFRequestStateLoading;
    
    if (_requestObj.serializerType == DFRequestSerializerTypeJSON) {
        
        self.manager.requestSerializer = [AFJSONRequestSerializer serializer];
    }else if (_requestObj.serializerType == DFRequestSerializerTypeString) {
        
        self.manager.requestSerializer = [AFJSONRequestSerializer serializer];
        self.manager.responseSerializer = [AFJSONResponseSerializer serializerWithReadingOptions:NSJSONReadingAllowFragments];
    }
    else {
        
        self.manager.responseSerializer = [AFHTTPResponseSerializer serializer];//响应
        self.manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/plain", @"text/javascript", @"text/json", @"text/html", nil];
    }
    
    NSString *URLString = _requestObj.URLString;
    if (![URLString hasPrefix:@"http"] ) {
        
        URLString = [NSString stringWithFormat:@"%@%@", [DFRequestConfigure new].baseURL, _requestObj.URLString];
    }
    
    if (_requestObj.requestMethod == DFRequestMethodGET) {
        
        self.dataTask = [self.manager GET:URLString parameters:_requestObj.params progress:_requestObj.progressBlock success:^(NSURLSessionDataTask * task, id responseObject) {
            
            [self requestDidResponse:responseObject error:nil];
        } failure:^(NSURLSessionDataTask * task, NSError * error) {
            
            [self requestDidResponse:nil error:error];
        }];
    }else if (_requestObj.requestMethod == DFRequestMethodPOST) {
        
        self.dataTask = [self.manager POST:URLString parameters:_requestObj.params progress:_requestObj.progressBlock  success:^(NSURLSessionDataTask * task, id responseObject) {
            
            [self requestDidResponse:responseObject error:nil];
        } failure:^(NSURLSessionDataTask * task, NSError * error) {
            
            [self requestDidResponse:nil error:error];
        }];
    }else if (_requestObj.requestMethod == DFRequestMethodHEAD) {
        
        self.dataTask = [self.manager HEAD:URLString parameters:_requestObj.params success:^(NSURLSessionDataTask * task) {
            
            [self requestDidResponse:nil error:nil];
        } failure:^(NSURLSessionDataTask * task, NSError * error) {
            
            [self requestDidResponse:nil error:error];
        }];
    }else if (_requestObj.requestMethod == DFRequestMethodPUT) {
        
        self.dataTask = [self.manager PUT:URLString parameters:_requestObj.params success:^(NSURLSessionDataTask * task, id responseObject) {
            
            [self requestDidResponse:responseObject error:nil];
        } failure:^(NSURLSessionDataTask * task, NSError * error) {
            
            [self requestDidResponse:nil error:error];
        }];
    }else if (_requestObj.requestMethod == DFRequestMethodPATCH) {
        
        self.dataTask = [self.manager PATCH:URLString parameters:_requestObj.params success:^(NSURLSessionDataTask * task, id responseObject) {
            
            [self requestDidResponse:responseObject error:nil];
        } failure:^(NSURLSessionDataTask * task, NSError * error) {
            
            [self requestDidResponse:nil error:error];
        }];
    }else if (_requestObj.requestMethod == DFRequestMethodUploadData) {
        
        self.dataTask = [self.manager POST:URLString parameters:_requestObj.params constructingBodyWithBlock:_requestObj.bodyBlock progress:_requestObj.progressBlock success:^(NSURLSessionDataTask * task, id responseObject) {
            
            [self requestDidResponse:responseObject error:nil];
        } failure:^(NSURLSessionDataTask * task, NSError * error) {
            
            [self requestDidResponse:nil error:error];
        }];
    }
}

- (void)requestDidResponse:(id)responseObject error:(NSError *)error {
    
    
    if (error && self.completeDelegate && [self.completeDelegate respondsToSelector:@selector(requestDidFailRequest:error:)]) {
        
        NSLog(@"请求失败\n%@ %s", error.localizedDescription, __func__);
        _state = DFRequestStateError;
        [self.completeDelegate requestDidFailRequest:self error:error];
    }
    else if (self.completeDelegate && [self.completeDelegate respondsToSelector:@selector(requestDidFinishRequest:task:)]) {
        
        _responseObj = [self objectToJson:responseObject];
        NSString *postStr = [self stringWithJsonValue:self.requestObj.params];
        
        NSLog(@"请求成功\n%@\n<==:\n%@\n==>:\n%@\n %s", self.URLString, postStr, _responseObj, __func__);
        _state = DFRequestStateFinish;
        [self.completeDelegate requestDidFinishRequest:self task:_dataTask];
    }
}

- (NSString *)URLString {
    
    NSString *URLString = _requestObj.URLString;
    if (![URLString hasPrefix:@"http"] ) {
        
        URLString = [NSString stringWithFormat:@"%@%@", [DFRequestConfigure new].baseURL, _requestObj.URLString];
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
    _state = DFRequestStateCancle;
}

- (void)dealloc
{
    [self cancel];
}

- (NSString *)stringWithJsonValue:(id)obj
{
    if (!obj) {
        
        return @"";
    }
    else if ([obj isKindOfClass:[NSString class]]) {
        
        return obj;
    }
    NSError *error = nil;
    NSData *jsondata = [NSJSONSerialization dataWithJSONObject:obj options:NSJSONWritingPrettyPrinted error:&error];
    if(error){
        return obj;
    }
    NSString *str = [[NSString alloc]initWithData:jsondata encoding:NSUTF8StringEncoding];
    
    return str ? str : obj;
}

@end
