//
//  ViewController_Base.m
//  zhmz
//
//  Created by 魏亮 on 2018/3/8.
//  Copyright © 2018年 魏亮. All rights reserved.
//

#import "ViewController_Base.h"

@interface ViewController_Base ()

@end

@implementation ViewController_Base

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = RGB(235, 236, 239, 1);
}

- (void)creatRightBtnForScan {
    UIBarButtonItem *pulishButton = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"scan"] style:UIBarButtonItemStylePlain target:self action:@selector(scanImg)];
    self.navigationController.tabBarController.navigationItem.rightBarButtonItem = pulishButton;
}

- (void)scanImg {
    
}

- (void)setImgStr:(NSString *)imgStr {
    _imgStr = imgStr;
    UIImageView * imgB = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGTH)];
    imgB.image = [UIImage imageNamed:self.imgStr];
    imgB.userInteractionEnabled = YES;
    [self.view addSubview:imgB];
}

@end
