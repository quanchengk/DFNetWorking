//
//  DFRequestConfigure.m
//  
//
//  Created by 全程恺 on 9/29/16.
//  Copyright © 2016 xmisp. All rights reserved.
//

#import "DFRequestConfigure.h"

@implementation DFRequestConfigure

- (instancetype)init {
    
    if (self = [super init]) {
        
#warning 设置初始化数据，例如请求的域名，超时时间
        _baseURL = @"";
        _timeoutInterval = 30;
    }
    
    return self;
}

@end
