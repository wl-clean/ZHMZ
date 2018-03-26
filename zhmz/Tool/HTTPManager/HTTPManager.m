//
//  HTTPManager.m
//  zhmz
//
//  Created by 魏亮 on 2018/3/25.
//  Copyright © 2018年 魏亮. All rights reserved.
//

#import "HTTPManager.h"

@implementation HTTPManager

+ (void)post:(NSString *)URLString parameters:(NSDictionary *)dict completion:(ResultBlock)completion{
    AFHTTPSessionManager * manager = [HTTPManager manager];
    [manager POST:URLString parameters:dict progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        completion(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
}

+ (void)get:(NSString *)URLString parameters:(NSDictionary *)dict completion:(ResultBlock)completion{
    AFHTTPSessionManager * manager = [HTTPManager manager];
    [manager GET:URLString parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        completion(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
}

+(AFHTTPSessionManager *)manager {
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    manager.requestSerializer.timeoutInterval = 5;
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    return manager;
}
@end
