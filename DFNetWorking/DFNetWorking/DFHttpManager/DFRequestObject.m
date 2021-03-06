//
//  DFRequestObject.m
//  
//
//  Created by 全程恺 on 16/12/6.
//  Copyright © 2016年 xmisp. All rights reserved.
//

#import "DFRequestObject.h"

@interface DFRequestObject ()

#pragma mark - 必填
@property (nonatomic, strong) NSString      *URLString;

@property (nonatomic, copy) DFRequestSuccessBlock successBlock;
@property (nonatomic, copy) DFRequestFailureBlock failureBlock;
@property (nonatomic, copy) DFRequestProgressBlock progressBlock;
@property (nonatomic, copy) DFRequestBodyBlock bodyBlock;


@end

@implementation DFRequestObject

+ (DFRequestObject *)requestWithUrlString:(NSString *)urlString
                             requestParams:(id)requestParams
                                 bodyBlock:(DFRequestBodyBlock)body
                             progressBlock:(DFRequestProgressBlock)progress
                              successBlock:(DFRequestSuccessBlock)success
                              failureBlock:(DFRequestFailureBlock)failure {
    
    DFRequestObject *requestObj = [DFRequestObject new];
    if (requestObj) {
        
        //公共属性
        requestObj.URLString = urlString;
        requestObj.progressBlock = progress;
        requestObj.bodyBlock = body;
        requestObj.successBlock = success;
        requestObj.failureBlock = failure;
        requestObj.serializerType = DFRequestSerializerTypeHTTP;
        requestObj.requestMethod = DFRequestMethodPOST;
        
        //私有属性
        if ([requestParams isKindOfClass:[NSDictionary class]]) {
            
            requestObj.requestDictionary = requestParams;
        }
        else
            requestObj.requestModel = requestParams;
    }
    
    return requestObj;
}

- (id)params {
    
#warning 可以把入参全部转成字典类型，便于序列化或验证参数
    NSMutableDictionary *returnParams;
    
    if (_requestDictionary && [_requestDictionary isKindOfClass:[NSDictionary class]]) {
        
        if (![_requestDictionary isKindOfClass:[NSMutableDictionary class]]) {
            
            returnParams = [NSMutableDictionary dictionaryWithDictionary:_requestDictionary];
        }
        else
            returnParams = (NSMutableDictionary *)_requestDictionary;
    }
    else if ([_requestModel isKindOfClass:[DFRequestModel class]]) {
        
        returnParams = [NSMutableDictionary dictionaryWithDictionary:[_requestModel mj_keyValues]];
    }
    
    NSAssert(returnParams, @"参数类型错误");
    
    return [returnParams copy];
}

- (void)dealloc {
    
    _bodyBlock = nil;
    _successBlock = nil;
    _failureBlock = nil;
    _progressBlock = nil;
}

@end
