//
//  RequsetManager.m
//  zhmz
//
//  Created by 魏亮 on 2018/3/26.
//  Copyright © 2018年 魏亮. All rights reserved.
//

#import "RequsetManager.h"

@implementation RequsetManager


+ (void)getOnlyCodeWithCompletion:(ResultBlock)completion {
    [HTTPManager
     post:WORKURL(@"SalvationPlatform/phoneLoginController.do?getSystemIdentifyAll")
     parameters:@{@"ip_ports":@"222.222.49.34:9095,222.222.49.34:8099,222.222.49.34:8088"}
     completion:^(NSDictionary *returnData) {
         completion(returnData);
     }];
}

+ (void)loginWithDict:(NSDictionary *)dict loginType:(int)loginType completion:(ResultBlock)completion {
    NSString * path;
    if (loginType == 1) {
        path = WORKURL(@"SalvationPlatform/phoneLoginController.do?phoneLogin");
    } else {
        path = SHURL(@"weixin/api/login.do?wxLogin");
    }
    [HTTPManager
     post:path
     parameters:dict
     completion:^(NSDictionary *returnData) {
         completion(returnData);
    }];
}

+ (void)forgetPswWithDict:(NSDictionary *)dict completion:(ResultBlock)completion {
    [HTTPManager post:SHURL(@"jeecg-bpm/api/login.do?findPassword") parameters:@{} completion:^(NSDictionary *returnData) {
        completion(returnData);
    }];
}

+ (void)getUserInfoWithAccount:(NSString *)account md5Key:(NSString *)md5Key completion:(ResultBlock)completion {
    [HTTPManager post:WORKURL(@"SocietySalvation/api/appCommonController.do?getUserInfo") parameters:@{@"username":account,@"Md5Key":md5Key} completion:^(NSDictionary *returnData) {
        completion(returnData);
    }];
}

+ (void)alterPswWithDict:(NSDictionary *)dict completion:(ResultBlock)completion {
    UserMessage * user = USER;
    NSString * path;
    if (user.loginType == 1) {
        path = WORKURL(@"SalvationPlatform/phoneLoginController.do?phoneLogin");
    } else {
        path = SHURL(@"weixin/api/login.do?wxLogin");
    }
    [HTTPManager
     post:path
     parameters:dict
     completion:^(NSDictionary *returnData) {
         completion(returnData);
     }];
}

+ (void)alterPhoneWithNewPhone:(NSString *)newPhone oldPhone:(NSString *)oldPhone completion:(ResultBlock)completion {
    UserMessage * user = USER;
    NSString * path;
    if (user.loginType == 1) {
        path = WORKURL(@"SalvationPlatform/phoneLoginController.do?modifyPhone");
    } else {
        path = SHURL(@"weixin/api/login.do?modifyPhone");
    }
    [HTTPManager post:path parameters:@{@"oldPhone":oldPhone,@"newPhone":newPhone,@"Md5Key":user.Md5Key} completion:^(NSDictionary *returnData) {
        completion(returnData);
    }];
}

@end
