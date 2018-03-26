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

+ (void)loginWithDict:(NSDictionary *)dict completion:(ResultBlock)completion {
    UserMessage * user = [UserMessage userMessage];
    NSString * path;
    if (user.loginType == 1) {
        path = WORKURL(@"SalvationPlatform/phoneLoginController.do?phoneLogin");
    } else {
        path = SHURL(@"SalvationPlatform/phoneLoginController.do?phoneLogin");
    }
    [HTTPManager
     post:path
     parameters:dict
     completion:^(NSDictionary *returnData) {
         
         completion(returnData);
    }];
}

+ (void)forgetPswWithDict:(NSDictionary *)dict completion:(ResultBlock)completion {
    
}

@end
