//
//  UserMessage.m
//  zhmz
//
//  Created by 魏亮 on 2018/3/22.
//  Copyright © 2018年 魏亮. All rights reserved.
//

#import "UserMessage.h"

@implementation UserMessage

+ (id)userMessage{
    static UserMessage * userMessage;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (userMessage == nil) {
            userMessage = [[self alloc]init];
        }
        userMessage.loginType = 1;
    });
    return userMessage;
}

- (NSMutableArray *)arrIp {
    if (_arrIp == nil) {
        _arrIp = [[NSMutableArray alloc]init];
    }
    return _arrIp;
}

@end
