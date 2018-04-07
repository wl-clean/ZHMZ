//
//  RequsetManager.h
//  zhmz
//
//  Created by 魏亮 on 2018/3/26.
//  Copyright © 2018年 魏亮. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HTTPManager.h"

typedef void(^ResultBlock)(NSDictionary *returnData);

@interface RequsetManager : NSObject

//获取唯一ID接口
+ (void)getOnlyCodeWithCompletion:(ResultBlock)completion;

//登录
+ (void)loginWithDict:(NSDictionary *)dict loginType:(int)loginType  completion:(ResultBlock)completion;

//忘记密码
+ (void)forgetPswWithDict:(NSDictionary *)dict completion:(ResultBlock)completion;

//获取权限
+ (void)getUserInfoWithAccount:(NSString *)account md5Key:(NSString *)md5Key completion:(ResultBlock)completion;

//修改密码
+ (void)alterPswWithDict:(NSDictionary *)dict completion:(ResultBlock)completio;
@end
