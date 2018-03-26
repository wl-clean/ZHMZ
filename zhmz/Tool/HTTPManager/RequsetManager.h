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
+ (void)loginWithDict:(NSDictionary *)dict completion:(ResultBlock)completion;

//忘记密码
+ (void)forgetPswWithDict:(NSDictionary *)dict completion:(ResultBlock)completion;


@end
