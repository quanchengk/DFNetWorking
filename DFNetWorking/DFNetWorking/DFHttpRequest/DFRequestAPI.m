//
//  DFRequestAPI.m
//  DFckNetApp
//
//  Created by 全程恺 on 16/12/13.
//  Copyright © 2016年 xmisp. All rights reserved.
//

#import "DFRequestAPI.h"
#import "MiPushSDK.h"

@implementation DFRequestAPI

#pragma mark - 会员接口

+ (void)requestAccountBindAccount:(id)requestParams
                     successBlock:(DFRequestSuccessBlock)success
                     failureBlock:(DFRequestFailureBlock)failure {
    
    DFRequestObject *requestObj = [DFRequestObject requestWithUrlString:kBindAccountURL requestParams:requestParams bodyBlock:nil progressBlock:nil successBlock:success failureBlock:failure];
    
    [[DFHttpManager sharedInstance] addRequestObject:requestObj];
}

+ (void)requestAccountBindAccountWithoutPassword:(id)requestParams
                                    successBlock:(DFRequestSuccessBlock)success
                                    failureBlock:(DFRequestFailureBlock)failure {
    
    DFRequestObject *requestObj = [DFRequestObject requestWithUrlString:kWithoutPswBindURL requestParams:requestParams bodyBlock:nil progressBlock:nil successBlock:success failureBlock:failure];
    
    [[DFHttpManager sharedInstance] addRequestObject:requestObj];
}

+ (void)requestAccountBindCheck:(id)requestParams
                   successBlock:(DFRequestSuccessBlock)success
                   failureBlock:(DFRequestFailureBlock)failure {
    
    DFRequestObject *requestObj = [DFRequestObject requestWithUrlString:kCheckBindAccountURL requestParams:requestParams bodyBlock:nil progressBlock:nil successBlock:success failureBlock:failure];
    
    [[DFHttpManager sharedInstance] addRequestObject:requestObj];
}

+ (void)requestAccountResetPassword:(id)requestParams
                       successBlock:(DFRequestSuccessBlock)success
                       failureBlock:(DFRequestFailureBlock)failure {
    
    DFRequestObject *requestObj = [DFRequestObject requestWithUrlString:kResetPswURL requestParams:requestParams bodyBlock:nil progressBlock:nil successBlock:success failureBlock:failure];
    
    [[DFHttpManager sharedInstance] addRequestObject:requestObj];
}

+ (void)requestAccountFeekback:(id)requestParams
                  successBlock:(DFRequestSuccessBlock)success
                  failureBlock:(DFRequestFailureBlock)failure {
    
    DFRequestObject *requestObj = [DFRequestObject requestWithUrlString:kFeedBackUrl requestParams:requestParams bodyBlock:nil progressBlock:nil successBlock:success failureBlock:failure];
    
    [[DFHttpManager sharedInstance] addRequestObject:requestObj];
}

+ (void)requestAccountModifyCardInfo:(id)requestParams
                        successBlock:(DFRequestSuccessBlock)success
                        failureBlock:(DFRequestFailureBlock)failure {
    
    DFRequestObject *requestObj = [DFRequestObject requestWithUrlString:kUserModifyCardInfo requestParams:requestParams bodyBlock:nil progressBlock:nil successBlock:success failureBlock:failure];
    
    [[DFHttpManager sharedInstance] addRequestObject:requestObj];
}

+ (void)requestAccountModifyCompanyInfo:(id)requestParams
                           successBlock:(DFRequestSuccessBlock)success
                           failureBlock:(DFRequestFailureBlock)failure {
    
    DFRequestObject *requestObj = [DFRequestObject requestWithUrlString:kUserModifyCompanyInfo requestParams:requestParams bodyBlock:nil progressBlock:nil successBlock:success failureBlock:failure];
    
    [[DFHttpManager sharedInstance] addRequestObject:requestObj];
}
+ (void)requestAccountSendMessage:(id)requestParams
                     successBlock:(DFRequestSuccessBlock)success
                     failureBlock:(DFRequestFailureBlock)failure {
    
    DFRequestObject *requestObj = [DFRequestObject requestWithUrlString:kSendMsgURL requestParams:requestParams bodyBlock:nil progressBlock:nil successBlock:success failureBlock:failure];
    
    [[DFHttpManager sharedInstance] addRequestObject:requestObj];
}

+ (void)requestAccountSendEmail:(id)requestParams
                   successBlock:(DFRequestSuccessBlock)success
                   failureBlock:(DFRequestFailureBlock)failure {
    
    DFRequestObject *requestObj = [DFRequestObject requestWithUrlString:kSendEmailURL requestParams:requestParams bodyBlock:nil progressBlock:nil successBlock:success failureBlock:failure];
    
    [[DFHttpManager sharedInstance] addRequestObject:requestObj];
}

+ (void)requestAccountCheckMessage:(id)requestParams
                      successBlock:(DFRequestSuccessBlock)success
                      failureBlock:(DFRequestFailureBlock)failure {
    
    DFRequestObject *requestObj = [DFRequestObject requestWithUrlString:kCheckMsgURL requestParams:requestParams bodyBlock:nil progressBlock:nil successBlock:success failureBlock:failure];
    
    [[DFHttpManager sharedInstance] addRequestObject:requestObj];
}

+ (void)requestAccountCheckEmail:(id)requestParams
                    successBlock:(DFRequestSuccessBlock)success
                    failureBlock:(DFRequestFailureBlock)failure {
    
    DFRequestObject *requestObj = [DFRequestObject requestWithUrlString:kCheckMailURL requestParams:requestParams bodyBlock:nil progressBlock:nil successBlock:success failureBlock:failure];
    
    [[DFHttpManager sharedInstance] addRequestObject:requestObj];
}

+ (void)requestAccountLogin:(id)requestParams
               successBlock:(DFRequestSuccessBlock)success
               failureBlock:(DFRequestFailureBlock)failure {
    
    DFRequestObject *requestObj = [DFRequestObject requestWithUrlString:kLoginURL requestParams:requestParams bodyBlock:nil progressBlock:nil successBlock:^(DFRequest *request, id responseObject) {
        
        if (success) {
            success(request, responseObject);
        }
        [MiPushSDK setAlias:[LoginModel new].user_id];
    } failureBlock:failure];
    
    [[DFHttpManager sharedInstance] addRequestObject:requestObj];
}

+ (void)requestAccountLoginThird:(id)requestParams
                    successBlock:(DFRequestSuccessBlock)success
                    failureBlock:(DFRequestFailureBlock)failure {
    
    DFRequestObject *requestObj = [DFRequestObject requestWithUrlString:kThirdLoginURL requestParams:requestParams bodyBlock:nil progressBlock:nil successBlock:^(DFRequest *request, id responseObject) {
        
        if (success) {
            success(request, responseObject);
        }
        [MiPushSDK setAlias:[LoginModel new].user_id];
    } failureBlock:failure];
    
    [[DFHttpManager sharedInstance] addRequestObject:requestObj];
}

+ (void)requestAccountLoginThirdWeChat:(id)requestParams
                          successBlock:(DFRequestSuccessBlock)success
                          failureBlock:(DFRequestFailureBlock)failure {
    
    DFRequestObject *requestObj = [DFRequestObject requestWithUrlString:kThirdLoginWeChat requestParams:requestParams bodyBlock:nil progressBlock:nil successBlock:success failureBlock:failure];
    requestObj.needSerialized = NO;
    [[DFHttpManager sharedInstance] addRequestObject:requestObj];
}

+ (void)requestAccountInfoFromWeChat:(id)requestParams
                        successBlock:(DFRequestSuccessBlock)success
                        failureBlock:(DFRequestFailureBlock)failure {
    
    DFRequestObject *requestObj = [DFRequestObject requestWithUrlString:kThirdInfoWeChat requestParams:requestParams bodyBlock:nil progressBlock:nil successBlock:success failureBlock:failure];
    requestObj.needSerialized = NO;
    [[DFHttpManager sharedInstance] addRequestObject:requestObj];
}

+ (void)requestAccountLoginThirdWebo:(id)requestParams
                        successBlock:(DFRequestSuccessBlock)success
                        failureBlock:(DFRequestFailureBlock)failure {
    
    NSMutableString *url = [NSMutableString stringWithFormat:@"%@?", kThirdLoginWebo];
    NSArray *allKeys = [requestParams allKeys];
    NSMutableArray *resultParams = [NSMutableArray array];
    for (NSString *key in allKeys) {
        
        [resultParams addObject:[NSString stringWithFormat:@"%@=%@", key, requestParams[key]]];
    }
    [url appendString:[resultParams componentsJoinedByString:@"&"]];
    DFRequestObject *requestObj = [DFRequestObject requestWithUrlString:url requestParams:nil bodyBlock:nil progressBlock:nil successBlock:success failureBlock:failure];
    requestObj.needSerialized = NO;
    requestObj.requestMethod = DFRequestMethodGET;
    [[DFHttpManager sharedInstance] addRequestObject:requestObj];
}

+ (void)requestAccountOrder:(id)requestParams
               successBlock:(DFRequestSuccessBlock)success
               failureBlock:(DFRequestFailureBlock)failure {
    
    DFRequestObject *requestObj = [DFRequestObject requestWithUrlString:kUserOrder requestParams:requestParams bodyBlock:nil progressBlock:nil successBlock:success failureBlock:failure];
    
    [[DFHttpManager sharedInstance] addRequestObject:requestObj];
}

+ (void)requestAccountUnbind:(id)requestParams
                successBlock:(DFRequestSuccessBlock)success
                failureBlock:(DFRequestFailureBlock)failure {
    
    DFRequestObject *requestObj = [DFRequestObject requestWithUrlString:kUnbindAccountURL requestParams:requestParams bodyBlock:nil progressBlock:nil successBlock:success failureBlock:failure];
    
    [[DFHttpManager sharedInstance] addRequestObject:requestObj];
}

+ (void)requestAccountRegister:(id)requestParams
                  successBlock:(DFRequestSuccessBlock)success
                  failureBlock:(DFRequestFailureBlock)failure {
    
    DFRequestObject *requestObj = [DFRequestObject requestWithUrlString:kRegisterURL requestParams:requestParams bodyBlock:nil progressBlock:nil successBlock:success failureBlock:failure];
    
    [[DFHttpManager sharedInstance] addRequestObject:requestObj];
}

+ (void)requestAccountForgetPassword:(id)requestParams
                        successBlock:(DFRequestSuccessBlock)success
                        failureBlock:(DFRequestFailureBlock)failure {
    
    DFRequestObject *requestObj = [DFRequestObject requestWithUrlString:kForgotPswURL requestParams:requestParams bodyBlock:nil progressBlock:nil successBlock:success failureBlock:failure];
    
    [[DFHttpManager sharedInstance] addRequestObject:requestObj];
}

+ (void)requestAccountModifyBindMobile:(id)requestParams
                          successBlock:(DFRequestSuccessBlock)success
                          failureBlock:(DFRequestFailureBlock)failure {
    
    DFRequestObject *requestObj = [DFRequestObject requestWithUrlString:kUserModifyMobile requestParams:requestParams bodyBlock:nil progressBlock:nil successBlock:success failureBlock:failure];
    
    [[DFHttpManager sharedInstance] addRequestObject:requestObj];
}

+ (void)requestAccountModifyBindEmail:(id)requestParams
                         successBlock:(DFRequestSuccessBlock)success
                         failureBlock:(DFRequestFailureBlock)failure {
    
    DFRequestObject *requestObj = [DFRequestObject requestWithUrlString:kUserModifyEmail requestParams:requestParams bodyBlock:nil progressBlock:nil successBlock:success failureBlock:failure];
    
    [[DFHttpManager sharedInstance] addRequestObject:requestObj];
}

+ (void)requestAccountModifyInfo:(id)requestParams
                    successBlock:(DFRequestSuccessBlock)success
                    failureBlock:(DFRequestFailureBlock)failure {
    
    DFRequestObject *requestObj = [DFRequestObject requestWithUrlString:kUserModifyInfo requestParams:requestParams bodyBlock:nil progressBlock:nil successBlock:success failureBlock:failure];
    
    [[DFHttpManager sharedInstance] addRequestObject:requestObj];
}

+ (void)requestAccountExit:(id)requestParams
              successBlock:(DFRequestSuccessBlock)success
              failureBlock:(DFRequestFailureBlock)failure {
    
    DFRequestObject *requestObj = [DFRequestObject requestWithUrlString:kExitURL requestParams:requestParams bodyBlock:nil progressBlock:nil successBlock:success failureBlock:failure];
    
    [[DFHttpManager sharedInstance] addRequestObject:requestObj];
}

+ (void)requestAccountBusinessStream:(id)requestParams
                        successBlock:(DFRequestSuccessBlock)success
                        failureBlock:(DFRequestFailureBlock)failure {
    
    DFRequestObject *requestObj = [DFRequestObject requestWithUrlString:kUserStream requestParams:requestParams bodyBlock:nil progressBlock:nil successBlock:success failureBlock:failure];
    
    [[DFHttpManager sharedInstance] addRequestObject:requestObj];
}

+ (void)requestCouponList:(id)requestParams
             successBlock:(DFRequestSuccessBlock)success
             failureBlock:(DFRequestFailureBlock)failure {
    DFRequestObject *requestObj = [DFRequestObject requestWithUrlString:kCouponsList requestParams:requestParams bodyBlock:nil progressBlock:nil successBlock:success failureBlock:failure];
    
    [[DFHttpManager sharedInstance] addRequestObject:requestObj];
}

+ (void)requestBalance:(id)requestParams
          successBlock:(DFRequestSuccessBlock)success
          failureBlock:(DFRequestFailureBlock)failure {
    DFRequestObject *requestObj = [DFRequestObject requestWithUrlString:kBalance requestParams:requestParams bodyBlock:nil progressBlock:nil successBlock:success failureBlock:failure];
    
    [[DFHttpManager sharedInstance] addRequestObject:requestObj];
}

+ (void)requestMessage:(id)requestParams
          successBlock:(DFRequestSuccessBlock)success
          failureBlock:(DFRequestFailureBlock)failure {
    DFRequestObject *requestObj = [DFRequestObject requestWithUrlString:kUserNotificationList requestParams:requestParams bodyBlock:nil progressBlock:nil successBlock:success failureBlock:failure];
    
    [[DFHttpManager sharedInstance] addRequestObject:requestObj];
}

#pragma mark - 虚机接口
+ (void)requestHostList:(id)requestParams
           successBlock:(DFRequestSuccessBlock)success
           failureBlock:(DFRequestFailureBlock)failure{
    
    DFRequestObject *requestObj = [DFRequestObject requestWithUrlString:kApplicationHost requestParams:requestParams bodyBlock:nil progressBlock:nil successBlock:success failureBlock:failure];
    
    [[DFHttpManager sharedInstance] addRequestObject:requestObj];
}
+ (void)requestHostDetail:(id)requestParams
             successBlock:(DFRequestSuccessBlock)success
             failureBlock:(DFRequestFailureBlock)failure {
    
    DFRequestObject *requestObj = [DFRequestObject requestWithUrlString:kApplicationHostDetail requestParams:requestParams bodyBlock:nil progressBlock:nil successBlock:success failureBlock:failure];
    
    [[DFHttpManager sharedInstance] addRequestObject:requestObj];
}
+ (void)requestHostBindList:(id)requestParams
               successBlock:(DFRequestSuccessBlock)success
               failureBlock:(DFRequestFailureBlock)failure {
    
    DFRequestObject *requestObj = [DFRequestObject requestWithUrlString:kApplicationHostBindList requestParams:requestParams bodyBlock:nil progressBlock:nil successBlock:success failureBlock:failure];
    
    [[DFHttpManager sharedInstance] addRequestObject:requestObj];
}
+ (void)requestHostBindDelete:(id)requestParams
                 successBlock:(DFRequestSuccessBlock)success
                 failureBlock:(DFRequestFailureBlock)failure {
    
    DFRequestObject *requestObj = [DFRequestObject requestWithUrlString:kApplicationHostBindDelete requestParams:requestParams bodyBlock:nil progressBlock:nil successBlock:success failureBlock:failure];
    
    [[DFHttpManager sharedInstance] addRequestObject:requestObj];
}
+ (void)requestHostBindAdd:(id)requestParams
              successBlock:(DFRequestSuccessBlock)success
              failureBlock:(DFRequestFailureBlock)failure {
    
    DFRequestObject *requestObj = [DFRequestObject requestWithUrlString:kApplicationHostBindAdd requestParams:requestParams bodyBlock:nil progressBlock:nil successBlock:success failureBlock:failure];
    
    [[DFHttpManager sharedInstance] addRequestObject:requestObj];
}
+ (void)requestHostChangePassword:(id)requestParams
                     successBlock:(DFRequestSuccessBlock)success
                     failureBlock:(DFRequestFailureBlock)failure {
    
    DFRequestObject *requestObj = [DFRequestObject requestWithUrlString:kApplicationHostChangePSD requestParams:requestParams bodyBlock:nil progressBlock:nil successBlock:success failureBlock:failure];
    
    [[DFHttpManager sharedInstance] addRequestObject:requestObj];
}
+ (void)requestHostChangeStatus:(id)requestParams
                   successBlock:(DFRequestSuccessBlock)success
                   failureBlock:(DFRequestFailureBlock)failure {
    
    DFRequestObject *requestObj = [DFRequestObject requestWithUrlString:kApplicationHostChangeState requestParams:requestParams bodyBlock:nil progressBlock:nil successBlock:success failureBlock:failure];
    
    [[DFHttpManager sharedInstance] addRequestObject:requestObj];
}

#pragma mark - 域名接口
+ (void)requestDomainList:(id)requestParams
             successBlock:(DFRequestSuccessBlock)success
             failureBlock:(DFRequestFailureBlock)failure {
    
    DFRequestObject *requestObj = [DFRequestObject requestWithUrlString:kApplicationDomain requestParams:requestParams bodyBlock:nil progressBlock:nil successBlock:success failureBlock:failure];
    
    [[DFHttpManager sharedInstance] addRequestObject:requestObj];
}
+ (void)requestDomainDetail:(id)requestParams
               successBlock:(DFRequestSuccessBlock)success
               failureBlock:(DFRequestFailureBlock)failure {
    
    DFRequestObject *requestObj = [DFRequestObject requestWithUrlString:kApplicationDomainDetal requestParams:requestParams bodyBlock:nil progressBlock:nil successBlock:success failureBlock:failure];
    
    [[DFHttpManager sharedInstance] addRequestObject:requestObj];
}
+ (void)requestDomainDNSList:(id)requestParams
                successBlock:(DFRequestSuccessBlock)success
                failureBlock:(DFRequestFailureBlock)failure {
    
    DFRequestObject *requestObj = [DFRequestObject requestWithUrlString:kApplicationDomainDNSList requestParams:requestParams bodyBlock:nil progressBlock:nil successBlock:success failureBlock:failure];
    
    [[DFHttpManager sharedInstance] addRequestObject:requestObj];
}
+ (void)requestDomainChangeDns:(id)requestParams
                  successBlock:(DFRequestSuccessBlock)success
                  failureBlock:(DFRequestFailureBlock)failure {
    
    DFRequestObject *requestObj = [DFRequestObject requestWithUrlString:kApplicationDomainDnsChange requestParams:requestParams bodyBlock:nil progressBlock:nil successBlock:success failureBlock:failure];
    
    [[DFHttpManager sharedInstance] addRequestObject:requestObj];
}
+ (DFRequest *)requestDomainSearch:(id)requestParams
                       successBlock:(DFRequestSuccessBlock)success
                       failureBlock:(DFRequestFailureBlock)failure {
    
    DFRequestObject *requestObj = [DFRequestObject requestWithUrlString:kApplicationDomainCheck requestParams:requestParams bodyBlock:nil progressBlock:nil successBlock:success failureBlock:failure];
    
    return [[DFHttpManager sharedInstance] addRequestObject:requestObj];
}

#pragma mark - 数据库接口
+ (void)requestDBList:(id)requestParams
         successBlock:(DFRequestSuccessBlock)success
         failureBlock:(DFRequestFailureBlock)failure {
    
    DFRequestObject *requestObj = [DFRequestObject requestWithUrlString:kDBList requestParams:requestParams bodyBlock:nil progressBlock:nil successBlock:success failureBlock:failure];
    
    [[DFHttpManager sharedInstance] addRequestObject:requestObj];
}
+ (void)requestDBDetail:(id)requestParams
           successBlock:(DFRequestSuccessBlock)success
           failureBlock:(DFRequestFailureBlock)failure {
    
    DFRequestObject *requestObj = [DFRequestObject requestWithUrlString:kDBDetail requestParams:requestParams bodyBlock:nil progressBlock:nil successBlock:success failureBlock:failure];
    
    [[DFHttpManager sharedInstance] addRequestObject:requestObj];
}
+ (void)requestDBChangePassword:(id)requestParams
                   successBlock:(DFRequestSuccessBlock)success
                   failureBlock:(DFRequestFailureBlock)failure {
    
    DFRequestObject *requestObj = [DFRequestObject requestWithUrlString:kDBModifyPassword requestParams:requestParams bodyBlock:nil progressBlock:nil successBlock:success failureBlock:failure];
    
    [[DFHttpManager sharedInstance] addRequestObject:requestObj];
}
+ (void)requestApplicationChangeRemark:(id)requestParams
                          successBlock:(DFRequestSuccessBlock)success
                          failureBlock:(DFRequestFailureBlock)failure {
    
    NSString *url;
    if ([requestParams isKindOfClass:NSClassFromString(@"DFApplicationModifyFTPRemarkRequestModel")]) {
        
        url = kApplicationHostChangeRemark;
    }
    else if ([requestParams isKindOfClass:NSClassFromString(@"DFApplicationModifyDBRemarkRequestModel")]) {
        
        url = kDBModifyRemark;
    }
    else if ([requestParams isKindOfClass:NSClassFromString(@"DFApplicationModifyDomainRemarkRequestModel")]) {
        
        url = kApplicationDomainChangeRemark;
    }
    
    NSAssert(url, @"传参错误");
        
    DFRequestObject *requestObj = [DFRequestObject requestWithUrlString:url requestParams:requestParams bodyBlock:nil progressBlock:nil successBlock:success failureBlock:failure];
    
    [[DFHttpManager sharedInstance] addRequestObject:requestObj];
}

+ (void)requestWillExpire:(id)requestParams
             successBlock:(DFRequestSuccessBlock)success
             failureBlock:(DFRequestFailureBlock)failure {
    
    DFRequestObject *requestObj = [DFRequestObject requestWithUrlString:kWillExpire requestParams:requestParams bodyBlock:nil progressBlock:nil successBlock:success failureBlock:failure];
    
    [[DFHttpManager sharedInstance] addRequestObject:requestObj];
}

+ (void)requestWillExpireNum:(id)requestParams
                successBlock:(DFRequestSuccessBlock)success
                failureBlock:(DFRequestFailureBlock)failure {
    
    DFRequestObject *requestObj = [DFRequestObject requestWithUrlString:kWillExpireNum requestParams:requestParams bodyBlock:nil progressBlock:nil successBlock:success failureBlock:failure];
    
    [[DFHttpManager sharedInstance] addRequestObject:requestObj];
}

#pragma mark - whois接口
+ (void)requestWhoisCheckRecord:(id)requestParams
                   successBlock:(DFRequestSuccessBlock)success
                   failureBlock:(DFRequestFailureBlock)failure {
    
    DFRequestObject *requestObj = [DFRequestObject requestWithUrlString:kHomeCheckWhoisRecord requestParams:requestParams bodyBlock:nil progressBlock:nil successBlock:success failureBlock:failure];
    
    [[DFHttpManager sharedInstance] addRequestObject:requestObj];
}
+ (void)requestWhoisDetail:(id)requestParams
              successBlock:(DFRequestSuccessBlock)success
              failureBlock:(DFRequestFailureBlock)failure {
    
    DFRequestObject *requestObj = [DFRequestObject requestWithUrlString:kHomeWhois requestParams:requestParams bodyBlock:nil progressBlock:nil successBlock:success failureBlock:failure];
    
    [[DFHttpManager sharedInstance] addRequestObject:requestObj];
}
#pragma mark - 充值接口
+ (void)requestChargeCMBInit:(id)requestParams
                successBlock:(DFRequestSuccessBlock)success
                failureBlock:(DFRequestFailureBlock)failure {
    
    DFRequestObject *requestObj = [DFRequestObject requestWithUrlString:kChargeRequestCMB requestParams:requestParams bodyBlock:nil progressBlock:nil successBlock:success failureBlock:failure];
    
    [[DFHttpManager sharedInstance] addRequestObject:requestObj];
}

+ (void)requestChargeWeChatInit:(id)requestParams
                   successBlock:(DFRequestSuccessBlock)success
                   failureBlock:(DFRequestFailureBlock)failure {
    
    DFRequestObject *requestObj = [DFRequestObject requestWithUrlString:kChargeRequestWX requestParams:requestParams bodyBlock:nil progressBlock:nil successBlock:success failureBlock:failure];
    
    [[DFHttpManager sharedInstance] addRequestObject:requestObj];
}

+ (void)requestChargeALiPayInit:(id)requestParams
                   successBlock:(DFRequestSuccessBlock)success
                   failureBlock:(DFRequestFailureBlock)failure {
    DFRequestObject *requestObj = [DFRequestObject requestWithUrlString:kChargeRequestALiPay requestParams:requestParams bodyBlock:nil progressBlock:nil successBlock:success failureBlock:failure];
    
    [[DFHttpManager sharedInstance] addRequestObject:requestObj];
}

+ (void)requestCheckRechargePayNotice:(id)requestParams
                         successBlock:(DFRequestSuccessBlock)success
                         failureBlock:(DFRequestFailureBlock)failure {
    DFRequestObject *requestObj = [DFRequestObject requestWithUrlString:kCheckRechargePayNotice requestParams:requestParams bodyBlock:nil progressBlock:nil successBlock:success failureBlock:failure];
    
    [[DFHttpManager sharedInstance] addRequestObject:requestObj];
}

#pragma mark - CMS接口
+ (DFRequest *)requestCMSLanuchAD:(id)requestParams
                      successBlock:(DFRequestSuccessBlock)success
                      failureBlock:(DFRequestFailureBlock)failure {
    
    DFRequestObject *requestObj = [DFRequestObject requestWithUrlString:kCMSLanuchAD requestParams:requestParams bodyBlock:nil progressBlock:nil successBlock:success failureBlock:failure];
    
    return [[DFHttpManager sharedInstance] addRequestObject:requestObj];
}
+ (void)requestCMSNews:(id)requestParams
          successBlock:(DFRequestSuccessBlock)success
          failureBlock:(DFRequestFailureBlock)failure {
    
    DFRequestObject *requestObj = [DFRequestObject requestWithUrlString:kCMSNews requestParams:requestParams bodyBlock:nil progressBlock:nil successBlock:success failureBlock:failure];
    
    [[DFHttpManager sharedInstance] addRequestObject:requestObj];
}

#pragma mark - 其他
+(void)requestUploadFile:(id)requestParams
               bodyBlock:(DFRequestBodyBlock)body
           progressBlock:(DFRequestProgressBlock)progress
            successBlock:(DFRequestSuccessBlock)success
            failureBlock:(DFRequestFailureBlock)failure {
    
    DFRequestObject *requestObj = [DFRequestObject requestWithUrlString:kUploadFile requestParams:requestParams bodyBlock:body progressBlock:progress successBlock:success failureBlock:failure];
    requestObj.requestMethod = DFRequestMethodUploadData;
    
    [[DFHttpManager sharedInstance] addRequestObject:requestObj];
}
+ (void)requestVersion:(id)requestParams
          successBlock:(DFRequestSuccessBlock)success
          failureBlock:(DFRequestFailureBlock)failure {
    
    DFRequestObject *requestObj = [DFRequestObject requestWithUrlString:kCheckVersion requestParams:requestParams bodyBlock:nil progressBlock:nil successBlock:success failureBlock:failure];
    
    [[DFHttpManager sharedInstance] addRequestObject:requestObj];
}
+ (void)requestQRLogin:(id)requestParams
          successBlock:(DFRequestSuccessBlock)success
          failureBlock:(DFRequestFailureBlock)failure {
    
    DFRequestObject *requestObj = [DFRequestObject requestWithUrlString:kQrLoginURL requestParams:requestParams bodyBlock:nil progressBlock:nil successBlock:success failureBlock:failure];
    
    [[DFHttpManager sharedInstance] addRequestObject:requestObj];
}

+ (void)requestCheckQRWithUrl:(NSString*)url
                 successBlock:(DFRequestSuccessBlock)success
                 failureBlock:(DFRequestFailureBlock)failure {
    DFRequestObject *requestObj = [DFRequestObject requestWithUrlString:url requestParams:nil bodyBlock:nil progressBlock:nil successBlock:success failureBlock:failure];
    requestObj.needSerialized = NO;
    requestObj.requestMethod = DFRequestMethodGET;
    [[DFHttpManager sharedInstance] addRequestObject:requestObj];
}

#pragma mark - 续费相关接口

// 获取域名价格
+ (void)requestDomainRenewPrice:(id)requestParams
                   successBlock:(DFRequestSuccessBlock)success
                   failureBlock:(DFRequestFailureBlock)failure {
    DFRequestObject *requestObj = [DFRequestObject requestWithUrlString:kDomainRenewPrice requestParams:requestParams bodyBlock:nil progressBlock:nil successBlock:success failureBlock:failure];
    
    [[DFHttpManager sharedInstance] addRequestObject:requestObj];
}

// 域名正常续费
+ (void)requestDomainRenewOrder:(id)requestParams
                   successBlock:(DFRequestSuccessBlock)success
                   failureBlock:(DFRequestFailureBlock)failure {
    DFRequestObject *requestObj = [DFRequestObject requestWithUrlString:kDomainRenewOrder requestParams:requestParams bodyBlock:nil progressBlock:nil successBlock:success failureBlock:failure];
    
    [[DFHttpManager sharedInstance] addRequestObject:requestObj];
}

// 域名赎回续费
+ (void)requestDomainRebackOrder:(id)requestParams
                    successBlock:(DFRequestSuccessBlock)success
                    failureBlock:(DFRequestFailureBlock)failure {
    DFRequestObject *requestObj = [DFRequestObject requestWithUrlString:kDomainRebackOrder requestParams:requestParams bodyBlock:nil progressBlock:nil successBlock:success failureBlock:failure];
    
    [[DFHttpManager sharedInstance] addRequestObject:requestObj];
}

// 获取虚拟主机价格与时间
+ (void)requestVhostRenewPrice:(id)requestParams
                  successBlock:(DFRequestSuccessBlock)success
                  failureBlock:(DFRequestFailureBlock)failure {
    DFRequestObject *requestObj = [DFRequestObject requestWithUrlString:kVhostRenewPrice requestParams:requestParams bodyBlock:nil progressBlock:nil successBlock:success failureBlock:failure];
    
    [[DFHttpManager sharedInstance] addRequestObject:requestObj];
}

// 虚拟主机续费
+ (void)requestVhostRenewOrder:(id)requestParams
                  successBlock:(DFRequestSuccessBlock)success
                  failureBlock:(DFRequestFailureBlock)failure {
    DFRequestObject *requestObj = [DFRequestObject requestWithUrlString:kVhostRenewOrder requestParams:requestParams bodyBlock:nil progressBlock:nil successBlock:success failureBlock:failure];
    
    [[DFHttpManager sharedInstance] addRequestObject:requestObj];
}

// 获取数据库价格与时间
+ (void)requestDatabaseRenewPrice:(id)requestParams
                     successBlock:(DFRequestSuccessBlock)success
                     failureBlock:(DFRequestFailureBlock)failure {
    DFRequestObject *requestObj = [DFRequestObject requestWithUrlString:kDatabaseRenewPrice requestParams:requestParams bodyBlock:nil progressBlock:nil successBlock:success failureBlock:failure];
    
    [[DFHttpManager sharedInstance] addRequestObject:requestObj];
}

// 数据库续费
+ (void)requestDatebaseRenewOrder:(id)requestParams
                     successBlock:(DFRequestSuccessBlock)success
                     failureBlock:(DFRequestFailureBlock)failure {
    DFRequestObject *requestObj = [DFRequestObject requestWithUrlString:kDatabaseRenewOrder requestParams:requestParams bodyBlock:nil progressBlock:nil successBlock:success failureBlock:failure];
    
    [[DFHttpManager sharedInstance] addRequestObject:requestObj];
}

+ (void)requestOrderPay:(id)requestParams
           successBlock:(DFRequestSuccessBlock)success
           failureBlock:(DFRequestFailureBlock)failure {
    DFRequestObject *requestObj = [DFRequestObject requestWithUrlString:kOrderPay requestParams:requestParams bodyBlock:nil progressBlock:nil successBlock:success failureBlock:failure];
    
    [[DFHttpManager sharedInstance] addRequestObject:requestObj];
}

@end
