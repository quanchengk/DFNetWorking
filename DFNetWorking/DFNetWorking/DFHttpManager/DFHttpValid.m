//
//  CLIResponse.m
//  
//
//  Created by 全程恺 on 16/12/5.
//  Copyright © 2016年 xmisp. All rights reserved.
//  负责解析的类

#import "CLIHttpValid.h"

@implementation CLIHttpValid

+ (void)isValidRequest:(CLIRequestObject *)requestObj
               success:(void (^)(NSDictionary *))success
               failure:(void (^)(NSError *))failure {
    
    //如果token为空字符串，则主动进入登录页面
    NSDictionary *oriParams = requestObj.params;
    NSString *token = oriParams[@"token_code"];
    if (!token) {
        token = oriParams[@"token"];
    }
    
    //如果userID为空字符串，则主动进入登录页面
    NSString *userID = oriParams[@"user_id"];
    
    if ((token && [token length] == 0) ||
        (userID && [userID length] == 0)) {
        
        [LoginModel loginCompletion:^(BOOL res) {
            
            if (res) {
                
                NSMutableDictionary *params = [NSMutableDictionary dictionaryWithDictionary:oriParams];
                NSString *token_code = params[@"token_code"];
                NSString *token = params[@"token"];
                NSString *userID = params[@"user_id"];
                LoginModel *model = [LoginModel new];
                if (token_code) {
                    [params setValue:model.token forKey:@"token_code"];
                }
                if (token) {
                    [params setValue:model.token forKey:@"token"];
                }
                if (userID) {
                    [params setValue:model.user_id forKey:@"user_id"];
                }
                
                [params removeObjectForKey:@"checksum"];
                requestObj.requestDictionary = params;
                success(requestObj.params);
            }
            else {
                
                //取消登录的情况下，走返回上一层的方法
                //                UITabBarController *tabbar = [CLIHelper getTopViewController];
                //                CLINavigationController *nav = tabbar.viewControllers[tabbar.selectedIndex];
                //                [nav popViewControllerAnimated:YES];
                
                NSError *error = [NSError errorWithDomain:@"未登录" code:CLITipsCodeTokenUnused userInfo:nil];
                failure(error);
            }
        }];
    }
    else {
        
        success(oriParams);
    }
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
        CLILog(@"%@",error);
        failure(error);
    }
    else
    {
        NSInteger responseCode = [responseObj[@"code"] integerValue];
        
        if (responseCode == CLITipsCodeSuccess || responseCode == 1) {
            
            success();
        }
        else if (responseCode == CLITipsCodeTokenUnused)
        {
            error = [NSError errorWithDomain:responseObj[@"msg"] code:[responseObj[@"code"] integerValue] userInfo:userInfo];
            
            [LoginModel removeData];
            [LoginModel loginCompletion:nil];
            failure(error);
        }
        else {
            
            [userInfo setObject:responseObj[@"msg"] forKey:NSLocalizedDescriptionKey];
            error = [NSError errorWithDomain:responseObj[@"msg"] code:[responseObj[@"code"] integerValue] userInfo:userInfo];
            
            failure(error);
        }
    }
}

@end
