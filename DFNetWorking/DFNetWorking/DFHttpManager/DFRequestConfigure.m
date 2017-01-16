//
//  DFRequestConfigure.m
//  
//
//  Created by mingwei on 9/29/16.
//  Copyright © 2016 xmisp. All rights reserved.
//

#import "DFRequestConfigure.h"

@implementation DFRequestConfigure

- (instancetype)init {
    
    if (self = [super init]) {
        
        _baseURL = kBaseURL;
        _timeoutInterval = 30;
    }
    
    return self;
}

@end
