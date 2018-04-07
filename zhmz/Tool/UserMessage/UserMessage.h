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

@property(nonatomic,copy)NSString * realName;//昵称
@property(nonatomic,copy)NSString * personalId;//平台人员编号
@property(nonatomic,copy)NSString * mobilePhone;//电话
@property(nonatomic,copy)NSString * officePhone;//办公电话
@property(nonatomic,copy)NSString * orgCode;//组织机构
@property(nonatomic,copy)NSString * email;//邮箱
@property(nonatomic,copy)NSString * departName;//部门名称

@property(nonatomic,copy)NSString * shehuiID;//社会人员编号
@property(nonatomic,copy)NSString * shehuiSEX;//社会人员性别
@property(nonatomic,copy)NSString * shehuicardID;//社会人员身份证号
@property(nonatomic,copy)NSString * shehuiADDRESS;//社会人员地址
@property(nonatomic,copy)NSString * shehuiPSW;//社会人员密码
@property(nonatomic,copy)NSString * shehuiREGTIME;//社会人员注册时间
@property(nonatomic,copy)NSString * shehuiPHONE;//社会人员电话







@property(nonatomic,copy)NSString * Md5Key;//合法性校验字段
@property(nonatomic,assign)int regionLevel;//权限等级

@property(nonatomic,copy)NSString * jzAccount;//救助确认字段
@property(nonatomic,copy)NSString * hdAccount;//核对确认字段
@property(nonatomic,copy)NSString * yzsAccount;//一站式确认字段

@property(nonatomic,copy)NSString * jzResultIp;//救助ip
@property(nonatomic,copy)NSString * hdResultIp;//核对ip
@property(nonatomic,copy)NSString * yzsResultIp;//一站式ip
@property(nonatomic,strong)NSMutableArray * arrIp;//ip数组  暂时没用

@property(nonatomic,assign)BOOL messageSend;//新消息通知是否开启
@property(nonatomic,assign)BOOL sound;//声音
@property(nonatomic,assign)BOOL move;//震动
@property(nonatomic,assign)BOOL trouble;//打扰模式

+ (id)userMessage;
@end
