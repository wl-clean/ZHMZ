//
//  SetVC_Person.m
//  zhmz
//
//  Created by 魏亮 on 2018/3/14.
//  Copyright © 2018年 魏亮. All rights reserved.
//

#import "SetVC_Person.h"
#import "LoginViewController.h"
@interface SetVC_Person ()

@end

@implementation SetVC_Person

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"设置";
}
- (IBAction)soundSwitch:(id)sender {
}
- (IBAction)moveSwitch:(id)sender {
}
- (IBAction)quiteSwitch:(id)sender {
}
- (IBAction)loginOut:(id)sender {
    LoginViewController  * loginView = [[LoginViewController alloc]init];
    NavigationController_Base * loginNaigtion = [[NavigationController_Base alloc]initWithRootViewController:loginView];
    loginNaigtion.navigateType = 1;
    UIWindow * window = [UIApplication sharedApplication].delegate.window;
    window.rootViewController = loginNaigtion;
}


@end
