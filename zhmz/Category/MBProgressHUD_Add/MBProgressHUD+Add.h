//
//  MBProgressHUD+Add.h
//  zhmz
//
//  Created by 魏亮 on 2018/3/11.
//  Copyright © 2018年 魏亮. All rights reserved.
//

#import <MBProgressHUD/MBProgressHUD.h>

@interface MBProgressHUD (Add)
+ (void)showError:(NSString *)error toView:(UIView *)view;
+ (void)showSuccess:(NSString *)success toView:(UIView *)view;
+ (MBProgressHUD *)showMessag:(NSString *)message toView:(UIView *)view;
@end
