//
//  DFRequestConfigure.h
//  
//
//  Created by mingwei on 9/29/16.
//  Copyright © 2016 xmisp. All rights reserved.
//  保存基础配置、参数、枚举定义

#import <Foundation/Foundation.h>
#import "DFRequestURLInfoConfig.h"

typedef NS_ENUM(NSUInteger, DFRequestMethod) {
    DFRequestMethodPOST,
    DFRequestMethodGET,
    DFRequestMethodHEAD,
    DFRequestMethodPUT,
    DFRequestMethodDELETE,
    DFRequestMethodPATCH,
    DFRequestMethodUploadData,
};

typedef NS_ENUM(NSInteger , DFRequestSerializerType) {
    DFRequestSerializerTypeHTTP,
    DFRequestSerializerTypeJSON,
    DFRequestSerializerTypeString
};

typedef NS_ENUM(NSUInteger, DFRequestState) {
    DFRequestStateReady,
    DFRequestStateLoading,
    DFRequestStateCancle,
    DFRequestStateFinish,
    DFRequestStateError
};

@protocol AFMultipartFormData; // need import afnetwork
@protocol DFRequestDelegate;

@class DFRequest;
typedef void (^DFRequestProgressBlock)(NSProgress * progress); //上传图片进度回调
typedef void (^DFRequestBodyBlock)(id <AFMultipartFormData> formData); //回调上传图片的结构体
typedef void (^DFRequestSuccessBlock)(DFRequest *request, id responseObject); //成功回调
typedef void (^DFRequestFailureBlock)(DFRequest *request, NSError *error);    //失败回调

@protocol DFRequestDelegate <NSObject>

@optional

- (void)requestDidFinishRequest:(DFRequest *)request task:(NSURLSessionDataTask *)task;
- (void)requestDidFailRequest:(DFRequest *)request error:(NSError *)error;

@end

//公共部分的配置
@interface DFRequestConfigure : NSObject

@property (nonatomic, strong) NSString *baseURL; // baseURL 如果为空，则为全局baseURL
@property (nonatomic, assign) NSURLRequestCachePolicy cachePolicy; // 请求缓存策略
@property (nonatomic, assign) NSTimeInterval timeoutInterval; // 请求的连接超时时间，默认为30秒
@property (nonatomic, retain) NSDictionary *headerFieldValues;  //请求表头可为空

@end
