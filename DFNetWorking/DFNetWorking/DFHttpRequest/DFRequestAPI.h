//
//  DFRequestAPI.h
//  
//
//  Created by 全程恺 on 16/12/13.
//  Copyright © 2016年 xmisp. All rights reserved.
//  抽离网络请求过程，用于单元测试共用

#import <Foundation/Foundation.h>
#import "DFAccountRequestModel.h"
#import "DFApplicationRequestModel.h"
#import "DFCMSRequestModel.h"
#import "DFOtherRequestModel.h"

@interface DFRequestAPI : NSObject

#pragma mark - 会员接口
//已有点击账号绑定
+ (void)requestAccountBindAccount:(id)requestParams
                     successBlock:(DFRequestSuccessBlock)success
                     failureBlock:(DFRequestFailureBlock)failure;
//无需密码绑定第三方
+ (void)requestAccountBindAccountWithoutPassword:(id)requestParams
                                    successBlock:(DFRequestSuccessBlock)success
                                    failureBlock:(DFRequestFailureBlock)failure;
//验证第三方是否已绑定
+ (void)requestAccountBindCheck:(id)requestParams
                   successBlock:(DFRequestSuccessBlock)success
                   failureBlock:(DFRequestFailureBlock)failure;
//重置账号密码
+ (void)requestAccountResetPassword:(id)requestParams
                       successBlock:(DFRequestSuccessBlock)success
                       failureBlock:(DFRequestFailureBlock)failure;
//意见反馈
+ (void)requestAccountFeekback:(id)requestParams
                  successBlock:(DFRequestSuccessBlock)success
                  failureBlock:(DFRequestFailureBlock)failure;
//个人身份认证
+ (void)requestAccountModifyCardInfo:(id)requestParams
                        successBlock:(DFRequestSuccessBlock)success
                        failureBlock:(DFRequestFailureBlock)failure;
//企业身份认证
+ (void)requestAccountModifyCompanyInfo:(id)requestParams
                           successBlock:(DFRequestSuccessBlock)success
                           failureBlock:(DFRequestFailureBlock)failure;
//发送短信
+ (void)requestAccountSendMessage:(id)requestParams
                     successBlock:(DFRequestSuccessBlock)success
                     failureBlock:(DFRequestFailureBlock)failure;
//发送邮件
+ (void)requestAccountSendEmail:(id)requestParams
                   successBlock:(DFRequestSuccessBlock)success
                   failureBlock:(DFRequestFailureBlock)failure;
//验证短信
+ (void)requestAccountCheckMessage:(id)requestParams
                      successBlock:(DFRequestSuccessBlock)success
                      failureBlock:(DFRequestFailureBlock)failure;
//验证邮箱
+ (void)requestAccountCheckEmail:(id)requestParams
                    successBlock:(DFRequestSuccessBlock)success
                    failureBlock:(DFRequestFailureBlock)failure;
//点击账号登录
+ (void)requestAccountLogin:(id)requestParams
               successBlock:(DFRequestSuccessBlock)success
               failureBlock:(DFRequestFailureBlock)failure;
//第三方登录
+ (void)requestAccountLoginThird:(id)requestParams
                    successBlock:(DFRequestSuccessBlock)success
                    failureBlock:(DFRequestFailureBlock)failure;
//微信sdk登录
+ (void)requestAccountLoginThirdWeChat:(id)requestParams
                          successBlock:(DFRequestSuccessBlock)success
                          failureBlock:(DFRequestFailureBlock)failure;
//获取微信平台信息
+ (void)requestAccountInfoFromWeChat:(id)requestParams
                        successBlock:(DFRequestSuccessBlock)success
                        failureBlock:(DFRequestFailureBlock)failure;
//微博sdk登录
+ (void)requestAccountLoginThirdWebo:(id)requestParams
                          successBlock:(DFRequestSuccessBlock)success
                          failureBlock:(DFRequestFailureBlock)failure;
//我的订单
+ (void)requestAccountOrder:(id)requestParams
               successBlock:(DFRequestSuccessBlock)success
               failureBlock:(DFRequestFailureBlock)failure;
//解绑第三方
+ (void)requestAccountUnbind:(id)requestParams
                successBlock:(DFRequestSuccessBlock)success
                failureBlock:(DFRequestFailureBlock)failure;
//手机注册
+ (void)requestAccountRegister:(id)requestParams
                  successBlock:(DFRequestSuccessBlock)success
                  failureBlock:(DFRequestFailureBlock)failure;
//找回密码
+ (void)requestAccountForgetPassword:(id)requestParams
                        successBlock:(DFRequestSuccessBlock)success
                        failureBlock:(DFRequestFailureBlock)failure;
//手机认证与修改
+ (void)requestAccountModifyBindMobile:(id)requestParams
                          successBlock:(DFRequestSuccessBlock)success
                          failureBlock:(DFRequestFailureBlock)failure;
//邮箱认证与修改
+ (void)requestAccountModifyBindEmail:(id)requestParams
                         successBlock:(DFRequestSuccessBlock)success
                         failureBlock:(DFRequestFailureBlock)failure;
//手机认证与修改
+ (void)requestAccountModifyInfo:(id)requestParams
                    successBlock:(DFRequestSuccessBlock)success
                    failureBlock:(DFRequestFailureBlock)failure;
//退出
+ (void)requestAccountExit:(id)requestParams
              successBlock:(DFRequestSuccessBlock)success
              failureBlock:(DFRequestFailureBlock)failure;
//业务流水
+ (void)requestAccountBusinessStream:(id)requestParams
                        successBlock:(DFRequestSuccessBlock)success
                        failureBlock:(DFRequestFailureBlock)failure;
// 优惠券列表
+ (void)requestCouponList:(id)requestParams
             successBlock:(DFRequestSuccessBlock)success
             failureBlock:(DFRequestFailureBlock)failure;
// 获取余额
+ (void)requestBalance:(id)requestParams
          successBlock:(DFRequestSuccessBlock)success
          failureBlock:(DFRequestFailureBlock)failure;
//APP推送消息列表
+ (void)requestMessage:(id)requestParams
          successBlock:(DFRequestSuccessBlock)success
          failureBlock:(DFRequestFailureBlock)failure;

#pragma mark - 虚机接口
//虚拟主机列表
+ (void)requestHostList:(id)requestParams
           successBlock:(DFRequestSuccessBlock)success
           failureBlock:(DFRequestFailureBlock)failure;
//虚拟主机详情页
+ (void)requestHostDetail:(id)requestParams
             successBlock:(DFRequestSuccessBlock)success
             failureBlock:(DFRequestFailureBlock)failure;
//虚机获取绑定域名列表
+ (void)requestHostBindList:(id)requestParams
               successBlock:(DFRequestSuccessBlock)success
               failureBlock:(DFRequestFailureBlock)failure;
//虚机删除域名
+ (void)requestHostBindDelete:(id)requestParams
                 successBlock:(DFRequestSuccessBlock)success
                 failureBlock:(DFRequestFailureBlock)failure;
//虚机绑定域名
+ (void)requestHostBindAdd:(id)requestParams
              successBlock:(DFRequestSuccessBlock)success
              failureBlock:(DFRequestFailureBlock)failure;
//虚机修改密码
+ (void)requestHostChangePassword:(id)requestParams
                     successBlock:(DFRequestSuccessBlock)success
                     failureBlock:(DFRequestFailureBlock)failure;
//虚机更改状态
+ (void)requestHostChangeStatus:(id)requestParams
                   successBlock:(DFRequestSuccessBlock)success
                   failureBlock:(DFRequestFailureBlock)failure;

#pragma mark - 域名接口
//域名管理列表
+ (void)requestDomainList:(id)requestParams
             successBlock:(DFRequestSuccessBlock)success
             failureBlock:(DFRequestFailureBlock)failure;
//域名详情
+ (void)requestDomainDetail:(id)requestParams
               successBlock:(DFRequestSuccessBlock)success
               failureBlock:(DFRequestFailureBlock)failure;
//获取DNS列表
+ (void)requestDomainDNSList:(id)requestParams
                successBlock:(DFRequestSuccessBlock)success
                failureBlock:(DFRequestFailureBlock)failure;
//修改域名DNS
+ (void)requestDomainChangeDns:(id)requestParams
                  successBlock:(DFRequestSuccessBlock)success
                  failureBlock:(DFRequestFailureBlock)failure;
//域名查询
+ (DFRequest *)requestDomainSearch:(id)requestParams
                       successBlock:(DFRequestSuccessBlock)success
                       failureBlock:(DFRequestFailureBlock)failure;

#pragma mark - 数据库接口
//数据库列表
+ (void)requestDBList:(id)requestParams
         successBlock:(DFRequestSuccessBlock)success
         failureBlock:(DFRequestFailureBlock)failure;
//数据库详情
+ (void)requestDBDetail:(id)requestParams
           successBlock:(DFRequestSuccessBlock)success
           failureBlock:(DFRequestFailureBlock)failure;
//数据库密码修改
+ (void)requestDBChangePassword:(id)requestParams
                   successBlock:(DFRequestSuccessBlock)success
                   failureBlock:(DFRequestFailureBlock)failure;
//控制台更改备注
+ (void)requestApplicationChangeRemark:(id)requestParams
                          successBlock:(DFRequestSuccessBlock)success
                          failureBlock:(DFRequestFailureBlock)failure;

#pragma mark - 即将过期接口
+ (void)requestWillExpire:(id)requestParams
             successBlock:(DFRequestSuccessBlock)success
             failureBlock:(DFRequestFailureBlock)failure;
//获取即将到期数量
+ (void)requestWillExpireNum:(id)requestParams
                successBlock:(DFRequestSuccessBlock)success
                failureBlock:(DFRequestFailureBlock)failure;

#pragma mark - whois接口
//域名备案查询 @宏钊
+ (void)requestWhoisCheckRecord:(id)requestParams
                   successBlock:(DFRequestSuccessBlock)success
                   failureBlock:(DFRequestFailureBlock)failure;
//域名whois信息查询
+ (void)requestWhoisDetail:(id)requestParams
              successBlock:(DFRequestSuccessBlock)success
              failureBlock:(DFRequestFailureBlock)failure;

#pragma mark - 充值接口
//招行
+ (void)requestChargeCMBInit:(id)requestParams
                successBlock:(DFRequestSuccessBlock)success
                failureBlock:(DFRequestFailureBlock)failure;
//微信
+ (void)requestChargeWeChatInit:(id)requestParams
                   successBlock:(DFRequestSuccessBlock)success
                   failureBlock:(DFRequestFailureBlock)failure;

// 支付宝
+ (void)requestChargeALiPayInit:(id)requestParams
                   successBlock:(DFRequestSuccessBlock)success
                   failureBlock:(DFRequestFailureBlock)failure;

// 检查充值是否成功
+ (void)requestCheckRechargePayNotice:(id)requestParams
                         successBlock:(DFRequestSuccessBlock)success
                         failureBlock:(DFRequestFailureBlock)failure;

#pragma mark - CMS接口
//APP启动页广告
+ (DFRequest *)requestCMSLanuchAD:(id)requestParams
                      successBlock:(DFRequestSuccessBlock)success
                      failureBlock:(DFRequestFailureBlock)failure;
//CMS行业新闻/促销信息列表
+ (void)requestCMSNews:(id)requestParams
          successBlock:(DFRequestSuccessBlock)success
          failureBlock:(DFRequestFailureBlock)failure;

#pragma mark - 其他
//上传图片
+ (void)requestUploadFile:(id)requestParams
                bodyBlock:(DFRequestBodyBlock)body
            progressBlock:(DFRequestProgressBlock)progress
             successBlock:(DFRequestSuccessBlock)success
             failureBlock:(DFRequestFailureBlock)failure;
//APP版本检查
+ (void)requestVersion:(id)requestParams
          successBlock:(DFRequestSuccessBlock)success
          failureBlock:(DFRequestFailureBlock)failure;
//点击扫码登录pc端
+ (void)requestQRLogin:(id)requestParams
          successBlock:(DFRequestSuccessBlock)success
          failureBlock:(DFRequestFailureBlock)failure;

//识别二维码
+ (void)requestCheckQRWithUrl:(NSString*)url
          successBlock:(DFRequestSuccessBlock)success
          failureBlock:(DFRequestFailureBlock)failure;

#pragma mark - 续费接口

// 获取域名价格
+ (void)requestDomainRenewPrice:(id)requestParams
          successBlock:(DFRequestSuccessBlock)success
          failureBlock:(DFRequestFailureBlock)failure;

// 域名正常续费
+ (void)requestDomainRenewOrder:(id)requestParams
                  successBlock:(DFRequestSuccessBlock)success
                  failureBlock:(DFRequestFailureBlock)failure;

// 域名赎回续费
+ (void)requestDomainRebackOrder:(id)requestParams
                 successBlock:(DFRequestSuccessBlock)success
                 failureBlock:(DFRequestFailureBlock)failure;

// 获取虚拟主机价格与时间
+ (void)requestVhostRenewPrice:(id)requestParams
                    successBlock:(DFRequestSuccessBlock)success
                    failureBlock:(DFRequestFailureBlock)failure;

// 虚拟主机续费
+ (void)requestVhostRenewOrder:(id)requestParams
                    successBlock:(DFRequestSuccessBlock)success
                    failureBlock:(DFRequestFailureBlock)failure;

// 获取数据库价格与时间
+ (void)requestDatabaseRenewPrice:(id)requestParams
                    successBlock:(DFRequestSuccessBlock)success
                    failureBlock:(DFRequestFailureBlock)failure;

// 数据库续费
+ (void)requestDatebaseRenewOrder:(id)requestParams
                    successBlock:(DFRequestSuccessBlock)success
                    failureBlock:(DFRequestFailureBlock)failure;

// 支付订单扣款
+ (void)requestOrderPay:(id)requestParams
           successBlock:(DFRequestSuccessBlock)success
           failureBlock:(DFRequestFailureBlock)failure;

@end
