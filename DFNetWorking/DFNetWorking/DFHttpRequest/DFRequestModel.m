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
             @"DFentId": @"DFent_id",
             @"tokenCode": @"token_code"};
}

- (NSString *)userId {
    
    if (_userId.length) {
        
        return _userId;
    }
    return [[LoginModel new] user_id];
}

- (NSString *)tokenCode {
    
    if (_tokenCode.length) {
        
        return _tokenCode;
    }
    return [[LoginModel new] token];
}

- (NSString *)DFentId {
    
    return kAppDFentID;
}

@end
