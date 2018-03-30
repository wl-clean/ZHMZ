//
//  ViewController.m
//  zhmz
//
//  Created by 魏亮 on 2018/3/8.
//  Copyright © 2018年 魏亮. All rights reserved.
//

#import "ViewController.h"
#import "LoginViewController.h"
#import "NavigationController_Base.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    LoginViewController  * loginView = [[LoginViewController alloc]init];
    NavigationController_Base * loginNaigtion = [[NavigationController_Base alloc]initWithRootViewController:loginView];
    loginNaigtion.navigateType = 1;
    UIWindow * window = [UIApplication sharedApplication].delegate.window;
    window.rootViewController = loginNaigtion;
    
}














@end
