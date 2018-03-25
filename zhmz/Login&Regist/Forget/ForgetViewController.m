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
@property(nonatomic,strong)TimerBtn * codeBtn;
@property(nonatomic,strong)UIButton * forgetBtn;

@end

@implementation ForgetViewController

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
    self.title = @"忘记密码";
    self.imgStr = @"loginBackground";

    
    [self buildText];
}

- (void)buildText {
    _userName = [[TextFiled_Login alloc]initWithFrame:CGRectMake(left, top, WIDTH-2*left, height) img:nil text:@"请输入手机号"];
    [self.view addSubview:_userName];
    
    _code = [[TextFiled_Login alloc]initWithFrame:CGRectMake(left, 149, WIDTH-2*left, height) img:nil text:@"请输入验证码"];
    [self.view addSubview:_code];
    
    _codeBtn = [TimerBtn sharedTime];
    _codeBtn.frame = CGRectMake(_userName.width-5-90, 5, 90, 40);
    [_code addSubview:_codeBtn];
    
    _forgetBtn = [[UIButton alloc]initWithFrame:CGRectMake(left, 220,WIDTH-2*left, height)];
    _forgetBtn.backgroundColor = RGB(0, 149, 233, 1);
    [_forgetBtn setTitle:@"下一步" forState:UIControlStateNormal];
    _forgetBtn.cornerRadius = 5;
    [_forgetBtn addTarget:self action:@selector(forgetPsw) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_forgetBtn];
}

- (void)forgetPsw {
    NewPSWViewController * pswNew = [[NewPSWViewController alloc]init];
    [self.navigationController pushViewController:pswNew animated:YES];
}












@end
