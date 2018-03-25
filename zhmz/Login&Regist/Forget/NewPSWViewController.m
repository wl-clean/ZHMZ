//
//  NewPSWViewController.m
//  zhmz
//
//  Created by 魏亮 on 2018/3/12.
//  Copyright © 2018年 魏亮. All rights reserved.
//

#import "NewPSWViewController.h"
#import "TextFiled_Login.h"
@interface NewPSWViewController ()

@property(nonatomic,strong)TextFiled_Login * pswNew;
@property(nonatomic,strong)TextFiled_Login * pswNew2;

@end

@implementation NewPSWViewController

static int left = 30;
static int height = 50;
static int top = 100;

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"忘记密码";
    self.imgStr = @"loginBackground";

    
    [self buildText];
}
- (void)buildText {
    _pswNew = [[TextFiled_Login alloc]initWithFrame:CGRectMake(left, top, WIDTH-2*left, height) img:nil text:@"新密码"];
    [self.view addSubview:_pswNew];
    
    _pswNew2 = [[TextFiled_Login alloc]initWithFrame:CGRectMake(left, 149, WIDTH-2*left, height) img:nil text:@"确认新密码"];
    [self.view addSubview:_pswNew2];
    
    UIButton * forgetDownBtn = [[UIButton alloc]initWithFrame:CGRectMake(left, 220,WIDTH-2*left, height)];
    forgetDownBtn.backgroundColor = RGB(0, 149, 233, 1);
    [forgetDownBtn setTitle:@"完成" forState:UIControlStateNormal];
    forgetDownBtn.cornerRadius = 5;
    [forgetDownBtn addTarget:self action:@selector(forgetPsw) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:forgetDownBtn];
}

- (void)forgetPsw {
    [self.navigationController popToRootViewControllerAnimated:YES];
}
@end
