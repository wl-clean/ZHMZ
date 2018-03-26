//
//  HTTPManager.h
//  zhmz
//
//  Created by 魏亮 on 2018/3/25.
//  Copyright © 2018年 魏亮. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"


typedef void(^ResultBlock)(NSDictionary *returnData);

@interface HTTPManager : NSObject

+ (void)post:(NSString *)URLString parameters:(NSDictionary *)dict completion:(ResultBlock)completion;

+ (void)get:(NSString *)URLString parameters:(NSDictionary *)dict completion:(ResultBlock)completion;
@end
