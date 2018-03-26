//
//  ForgetViewController.m
//  zhmz
//
//  Created by 魏亮 on 2018/3/11.
//  Copyright © 2018年 魏亮. All rights reserved.
//

#import "ForgetViewController.h"
#import "NewPSWViewController.h"
#import "TextFiled_Login.h"
#import "TimerBtn.h"

@interface ForgetViewController ()
@property(nonatomic,strong)TextFiled_Login * userName;
@property(nonatomic,strong)TextFiled_Login * code;
@property(nonatomic,strong)TextFiled_Login * pswNew;
@property(nonatomic,strong)TextFiled_Login * pswNewAgain;

@property(nonatomic,strong)UIButton * forgetBtn;

@end

@implementation ForgetViewController

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
    _userName = [[TextFiled_Login alloc]initWithFrame:CGRectMake(left, top, WIDTH-2*left, height) img:nil text:@"请输入手机号"];
    [self.view addSubview:_userName];
    
    _code = [[TextFiled_Login alloc]initWithFrame:CGRectMake(left, 149, WIDTH-2*left, height) img:nil text:@"请输入身份证号"];
    [self.view addSubview:_code];
    
    _pswNew = [[TextFiled_Login alloc]initWithFrame:CGRectMake(left, 198, WIDTH-2*left, height) img:nil text:@"请输入新密码"];
    [self.view addSubview:_pswNew];
    
    _pswNewAgain = [[TextFiled_Login alloc]initWithFrame:CGRectMake(left, 247, WIDTH-2*left, height) img:nil text:@"确认新密码"];
    [self.view addSubview:_pswNewAgain];
    
    _forgetBtn = [[UIButton alloc]initWithFrame:CGRectMake(left, 320,WIDTH-2*left, height)];
    _forgetBtn.backgroundColor = RGB(0, 149, 233, 1);
    [_forgetBtn setTitle:@"找回密码" forState:UIControlStateNormal];
    _forgetBtn.cornerRadius = 5;
    [_forgetBtn addTarget:self action:@selector(forgetPsw) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_forgetBtn];
}

- (void)forgetPsw {

}












@end
