//
//  DFRequestObject.m
//  
//
//  Created by 全程恺 on 16/12/6.
//  Copyright © 2016年 xmisp. All rights reserved.
//

#import "DFRequestObject.h"
#import "DFRequestModel.h"

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
        requestObj.needSerialized = YES;
        
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
    
//    NSAssert(_requestDictionary || _requestModel, @"请求参数不能为空");
    
    NSMutableDictionary *returnParams;
    
    if (_requestDictionary && [_requestDictionary isKindOfClass:[NSDictionary class]]) {
        
        if (![_requestDictionary isKindOfClass:[NSMutableDictionary class]]) {
            
            returnParams = [NSMutableDictionary dictionaryWithDictionary:_requestDictionary];
        }
        else
            returnParams = (NSMutableDictionary *)_requestDictionary;
    }
    else if (_requestModel) {
        
        returnParams = [NSMutableDictionary dictionaryWithDictionary:[_requestModel mj_keyValues]];
    }
    
//    NSAssert(returnParams.allValues.count, @"请求参数有误");
    
    [returnParams removeObjectForKey:@"checksum"];
    
    if (self.needSerialized) {
        
        NSString *serializedStr = [self serializeParams:returnParams];
        [returnParams setObject:serializedStr forKey:@"checksum"];
    }
    
    return [returnParams copy];
}

// params排序、拼接、MD5加密
- (NSString *)serializeParams:(NSDictionary *)params {
    
    NSArray *sortedKeys = [[params allKeys] sortedArrayUsingSelector:@selector(compare:)];
    NSMutableArray *parts = [NSMutableArray array];
    
    for (NSString *key in sortedKeys) {
        
        NSString *encodedKey = key;
        NSString *encodedValue = params[key];
        NSString *part = [NSString stringWithFormat:@"%@=%@",encodedKey, encodedValue];
        [parts addObject: part];
    }
    
    NSString *queryString = [parts componentsJoinedByString:@"&"];
    queryString = [NSString stringWithFormat:@"%@%@", queryString, kAppClientAPIKey];
    queryString = [queryString MD5];
    return queryString;
}

- (void)dealloc {
    
    _bodyBlock = nil;
    _successBlock = nil;
    _failureBlock = nil;
    _progressBlock = nil;
}

@end
