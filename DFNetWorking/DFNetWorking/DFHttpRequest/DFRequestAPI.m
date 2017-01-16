//
//  DFRequestAPI.m
//  DFckNetApp
//
//  Created by 全程恺 on 16/12/13.
//  Copyright © 2016年 xmisp. All rights reserved.
//

#import "DFRequestAPI.h"

@implementation DFRequestAPI

+ (void)requestModel:(id)requestParams
        successBlock:(DFRequestSuccessBlock)success
        failureBlock:(DFRequestFailureBlock)failure {
    
    DFRequestObject *requestObj = [DFRequestObject requestWithUrlString:kPostURL requestParams:requestParams bodyBlock:nil progressBlock:nil successBlock:success failureBlock:failure];
    
    //发起接口调用
    [[DFHttpManager sharedInstance] addRequestObject:requestObj];
}

@end
