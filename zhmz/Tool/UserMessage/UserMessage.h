//
//  UserMessage.h
//  zhmz
//
//  Created by 魏亮 on 2018/3/22.
//  Copyright © 2018年 魏亮. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserMessage : NSObject

@property(nonatomic,assign)int loginType;//1是工作,0是社会
@property(nonatomic,copy)NSString * userName;//账号
@property(nonatomic,copy)NSString * userPsw;//密码

@property(nonatomic,copy)NSString * jzResultIp;//救助ip
@property(nonatomic,copy)NSString * hdResultIp;//核对ip
@property(nonatomic,copy)NSString * yzsResultIp;//一站式ip



+ (id)userMessage;
@end
