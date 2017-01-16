//
//  DFRequestAPI.h
//  
//
//  Created by 全程恺 on 16/12/13.
//  Copyright © 2016年 xmisp. All rights reserved.
//  抽离网络请求过程，用于单元测试共用

#import <Foundation/Foundation.h>
#import "DFRequestModel.h"
#import "DFHttpManager.h"

@interface DFRequestAPI : NSObject

+ (void)requestModel:(id)requestParams
        successBlock:(DFRequestSuccessBlock)success
        failureBlock:(DFRequestFailureBlock)failure;

@end
