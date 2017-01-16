//
//  CLIHttpManager.h
//  ClickNetApp
//
//  Created by mingwei on 9/29/16.
//  Copyright © 2016 xmisp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CLIRequest.h"

@interface CLIHttpManager : NSObject

+ (CLIHttpManager *)sharedInstance;

- (CLIRequest *)addRequestObject:(CLIRequestObject *)requestObj;

- (void)cancelRequest:(CLIRequest *)request;

@end
