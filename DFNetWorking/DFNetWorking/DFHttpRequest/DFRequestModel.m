//
//  DFRequestModel.m
//  
//
//  Created by 全程恺 on 16/12/6.
//  Copyright © 2016年 xmisp. All rights reserved.
//

#import "DFRequestModel.h"

@implementation DFRequestModel

+ (NSDictionary *)mj_replacedKeyFromPropertyName {
    
    return @{@"userId": @"user_id",
             @"tokenCode": @"token_code"};
}

@end
