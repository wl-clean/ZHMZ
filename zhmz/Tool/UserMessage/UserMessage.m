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
    });
    return userMessage;
}

@end