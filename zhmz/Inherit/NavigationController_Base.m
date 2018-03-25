//
//  NavigationController_Base.m
//  zhmz
//
//  Created by 魏亮 on 2018/3/11.
//  Copyright © 2018年 魏亮. All rights reserved.
//

#import "NavigationController_Base.h"

@interface NavigationController_Base ()

@end

@implementation NavigationController_Base

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:19],NSForegroundColorAttributeName:[UIColor whiteColor]}];

}





- (void)setNavigateType:(int)navigateType {
    _navigateType = navigateType;
    [self setType:self.navigateType];
}

- (void)setType:(int)type {
    if (type == 1) {
        self.navigationBar.tintColor = [UIColor whiteColor];
        [self.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
        [self.navigationBar setShadowImage:[UIImage new]];
    } else if (type ==2) {
        self.navigationBar.tintColor = [UIColor whiteColor];
        self.navigationBar.barTintColor = RGB(0, 132, 222, 1);
        [self.navigationBar setShadowImage:[UIImage new]];
    }
}






- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (self.childViewControllers.count>0) {
        
    }
    [super pushViewController:viewController animated:YES];
}


@end
