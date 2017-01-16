//
//  DFRequest.h
//  
//
//  Created by 全程恺 on 16/12/5.
//  Copyright © 2016年 xmisp. All rights reserved.
//  请求类

#import <Foundation/Foundation.h>
#import "DFRequestObject.h"
#import "AFNetworking.h"

@interface DFRequest : NSObject

@property (nonatomic, retain) NSURLSessionDataTask *dataTask;
@property (nonatomic, assign, readonly) DFRequestState state;
@property (nonatomic, weak) id <DFRequestDelegate>   completeDelegate; //具体处理请求完成的对象
@property (nonatomic, retain) DFRequestObject          *requestObj;
@property (nonatomic, retain, readonly) id              responseObj;
@property (nonatomic, retain) AFHTTPSessionManager  *manager;

- (void)loadData;
- (void)cancel;

@end
