//
//  RegistViewController.m
//  zhmz
//
//  Created by 魏亮 on 2018/3/10.
//  Copyright © 2018年 魏亮. All rights reserved.
//

#import "RegistViewController.h"
#import "TextFiled_Login.h"
#import "TimerBtn.h"
@interface RegistViewController ()

@property(nonatomic,strong)TextFiled_Login * userName;
@property(nonatomic,strong)TextFiled_Login * code;
@property(nonatomic,strong)TextFiled_Login * psw;
@property(nonatomic,strong)TimerBtn * codeBtn;

@end

@implementation RegistViewController

static int left = 30;
static int height = 50;
static int top = 100;

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    _codeBtn = [TimerBtn sharedTime];
    if (_codeBtn.time>0) {
        NSString *str = [NSString stringWithFormat:@"%ld",(long)_codeBtn.time];
        NSAttributedString *Str = [[NSAttributedString alloc]initWithString:str attributes:@{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont systemFontOfSize:13]}];
        [_codeBtn setAttributedTitle:Str forState:UIControlStateNormal];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"注册";
    self.imgStr = @"loginBackground";

    [self buildText];
}

- (void)buildText {
    _userName = [[TextFiled_Login alloc]initWithFrame:CGRectMake(left, top, WIDTH-2*left, height) img:nil text:@"请输入手机号"];
    [self.view addSubview:_userName];
    
    _codeBtn = [TimerBtn sharedTime];
    _codeBtn.frame = CGRectMake(_userName.width-5-90, 5, 90, 40);
    [_userName addSubview:_codeBtn];
    
    _code = [[TextFiled_Login alloc]initWithFrame:CGRectMake(left, 149, WIDTH-2*left, height) img:nil text:@"请输入验证码"];
    [self.view addSubview:_code];
    
    _psw = [[TextFiled_Login alloc]initWithFrame:CGRectMake(left, 198, WIDTH-2*left, height) img:nil text:@"请输入密码"];
    [self.view addSubview:_psw];
    
    UIButton * regist = [[UIButton alloc]initWithFrame:CGRectMake(left, 270, WIDTH-2*left, height)];
    regist.backgroundColor = RGB(0, 149, 233, 1);
    [regist setTitle:@"注    册" forState:UIControlStateNormal];
    regist.cornerRadius = 5;
    [regist addTarget:self action:@selector(registUser) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:regist];
}


- (void)registUser {
    
}





@end
