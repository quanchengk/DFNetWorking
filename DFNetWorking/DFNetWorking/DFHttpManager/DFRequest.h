//
//  CLIRequest.h
//  
//
//  Created by 全程恺 on 16/12/5.
//  Copyright © 2016年 xmisp. All rights reserved.
//  请求类

#import <Foundation/Foundation.h>
#import "CLIRequestObject.h"
#import "AFNetworking.h"

@interface CLIRequest : NSObject

@property (nonatomic, retain) NSURLSessionDataTask *dataTask;
@property (nonatomic, assign, readonly) CLIRequestState state;
@property (nonatomic, weak) id <CLIRequestDelegate>   completeDelegate; //具体处理请求完成的对象
@property (nonatomic, retain) CLIRequestObject          *requestObj;
@property (nonatomic, retain, readonly) id              responseObj;
@property (nonatomic, retain) AFHTTPSessionManager  *manager;

- (void)loadData;
- (void)cancel;

@end
