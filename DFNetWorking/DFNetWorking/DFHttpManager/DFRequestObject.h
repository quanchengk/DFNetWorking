//
//  DFRequestObject.h
//  ClickNetApp
//
//  Created by 全程恺 on 16/12/6.
//  Copyright © 2016年 xmisp. All rights reserved.
//  请求的对象，可配置

#import <Foundation/Foundation.h>
#import "DFRequestConfigure.h"

@interface DFRequestObject : NSObject


/**
 请求体初始化

 @param urlString         请求的URLString 或者 URL path，可以是http开头
 @param requestParams      对象传参，对象如果不继承DFRequestModel，则没有checksum字段，requestModel和requestDictionary必传其一
 @param body              回调上传图片的结构体
 @param progress          进度条回调
 @param success           成功回调
 @param failure           失败回调

 @return 请求体，交给DFHttpManager使用
 */
+ (DFRequestObject *)requestWithUrlString:(NSString *)urlString
                             requestParams:(id)requestParams
                                 bodyBlock:(DFRequestBodyBlock)body
                             progressBlock:(DFRequestProgressBlock)progress
                              successBlock:(DFRequestSuccessBlock)success
                              failureBlock:(DFRequestFailureBlock)failure;

@property (nonatomic, strong, readonly) NSString      *URLString;
@property (nonatomic, strong, readonly) id params;
@property (nonatomic, copy, readonly) DFRequestSuccessBlock successBlock;
@property (nonatomic, copy, readonly) DFRequestFailureBlock failureBlock;
@property (nonatomic, copy, readonly) DFRequestProgressBlock progressBlock;
@property (nonatomic, copy, readonly) DFRequestBodyBlock bodyBlock;

@property (nonatomic, strong) NSDictionary  *requestDictionary; //不推荐自己调用
@property (nonatomic, strong) NSObject      *requestModel;  //不推荐自己调用


/**
 是否需要..=..&..=..序列化，默认yes
 */
@property (nonatomic, assign) BOOL needSerialized;
/**
 请求方法 默认post
 */
@property (nonatomic, assign) DFRequestMethod requestMethod;

/**
 设置数据解析格式 默认 http
 */
@property (nonatomic, assign) DFRequestSerializerType serializerType;

- (NSString *)serializeParams:(NSDictionary *)params;

@end
