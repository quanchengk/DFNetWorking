//
//  DFResponse.m
//  
//
//  Created by 全程恺 on 16/12/5.
//  Copyright © 2016年 xmisp. All rights reserved.
//  负责解析的类

#import "DFHttpValid.h"

@implementation DFHttpValid

+ (void)isValidRequest:(DFRequestObject *)requestObj
               success:(void (^)(NSDictionary *))success
               failure:(void (^)(NSError *))failure {
    
#warning 验证请求结构是否合法
    NSDictionary *oriParams = requestObj.params;
    success(oriParams);
}

+ (void)isValidResponse:(id)responseObj
                   task:(NSURLSessionDataTask *)dataTask
                success:(void (^)(void))success
                failure:(void (^)(NSError *))failure
{
    NSError *error = nil;
    if (!responseObj) {
        error = [NSError errorWithDomain:@"response is nil" code: -1 userInfo:nil];
        failure(error);
        return;
    }
    
    NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse*)dataTask.response;
    NSInteger responseStatusCode = [httpResponse statusCode];
    
    // StatusCode 1xx消息 2xx成功 3xx重定向 4xx客户端错误 5xx服务器错误
    NSMutableDictionary *userInfo = [NSMutableDictionary dictionary];
    if (responseStatusCode < 200 || responseStatusCode > 299) {
        [userInfo setObject:@"invalid http request" forKey:NSLocalizedDescriptionKey];
        error = [NSError errorWithDomain:@"invalid http request" code:responseStatusCode userInfo:userInfo];
        NSLog(@"%@ %s",error, __func__);
        failure(error);
    }
    else
    {
        NSInteger responseCode = [responseObj[@"code"] integerValue];
        
#warning 分析回参是否请求成功，如果请求成功了，再把数据返回给调用者
        if (responseCode == 200) {
            
            success();
        }
        else
        {
            failure(error);
        }
    }
}

@end
