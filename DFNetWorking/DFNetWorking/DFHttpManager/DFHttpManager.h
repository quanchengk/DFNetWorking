//
//  DFHttpManager.h
//  
//
//  Created by 全程恺 on 9/29/16.
//  Copyright © 2016 xmisp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DFRequest.h"

@interface DFHttpManager : NSObject

+ (DFHttpManager *)sharedInstance;

- (DFRequest *)addRequestObject:(DFRequestObject *)requestObj;

- (void)cancelRequest:(DFRequest *)request;

@end
