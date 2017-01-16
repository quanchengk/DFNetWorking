//
//  CLIResponse.h
//  
//
//  Created by 全程恺 on 16/12/5.
//  Copyright © 2016年 xmisp. All rights reserved.
//  处理回参

#import <Foundation/Foundation.h>
#import "CLIRequest.h"

@interface CLIHttpValid : NSObject

//验证请求体有效性
+ (void)isValidRequest:(CLIRequestObject *)requestObj
               success:(void (^)(NSDictionary *params))success
               failure:(void (^)(NSError *error))failure;

//验证回参有效性
+ (void)isValidResponse:(id)responseObj
                   task:(NSURLSessionDataTask *)dataTask
                success:(void (^)(void))success
                failure:(void (^)(NSError *error))failure;

@end
