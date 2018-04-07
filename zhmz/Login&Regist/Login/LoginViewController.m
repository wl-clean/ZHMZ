//
//  LoginViewController.m
//  zhmz
//
//  Created by 魏亮 on 2018/3/10.
//  Copyright © 2018年 魏亮. All rights reserved.
//

#import "LoginViewController.h"
#import "TextFiled_Login.h"
#import "MainChooseController.h"
#import "RegistViewController.h"
#import "ForgetViewController.h"

@interface LoginViewController ()
@property(nonatomic,strong)TextFiled_Login * userName;
@property(nonatomic,strong)TextFiled_Login * psw;
@property(nonatomic,assign)int select;
@property(nonatomic,strong)UIButton * workBtn;
@property(nonatomic,strong)UIButton * personBtn;


@end

@implementation LoginViewController

static int left = 30;
static int height = 50;
static int top = 230;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor greenColor];
    
    self.imgStr = @"loginBackground";
    self.select = 1;
    [self buildText];
    [self buildBtn];
    [self buildBtnSecond];
    UIImageView * imgL = [[UIImageView alloc]init];
    imgL.image = [UIImage imageNamed:@"loginLogo"];
    [self.view addSubview:imgL];
    [imgL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).mas_offset(40);
        make.left.equalTo(self.view.mas_left).mas_offset(20*SCALE);
        make.right.equalTo(self.view.mas_right).mas_offset(-20*SCALE);
        make.height.mas_equalTo(imgL.mas_width).multipliedBy(0.56);
    }];
    self.userName.textField.text = [USERDEFAULTS objectForKey:USERNAME];
    self.psw.textField.text= [USERDEFAULTS objectForKey:PSW];
}

- (void)buildText {
    _userName = [[TextFiled_Login alloc]initWithFrame:CGRectMake(left, top, WIDTH-2*left, height) img:@"usericon" text:@"请输入手机号"];
    _userName.cornerRadius = 5;
    [self.view addSubview:_userName];
    
    _psw = [[TextFiled_Login alloc]initWithFrame:CGRectMake(left, 290, WIDTH-2*left, height) img:@"pswIcon" text:@"请输入密码"];
    _psw.cornerRadius = 5;
    _psw.safeInput = YES;
    [self.view addSubview:_psw];
    
    _workBtn = [[UIButton alloc]initWithFrame:CGRectMake(WIDTH-left-2*80, 360, 80, 20)];
    _workBtn.tag = 1;
    [_workBtn setImage:[UIImage imageNamed:@"select_login"] forState:UIControlStateNormal];
    [_workBtn setTitle:@"工作人员" forState:UIControlStateNormal];
    _workBtn.titleLabel.font = [UIFont systemFontOfSize:13];
    [_workBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_workBtn addTarget:self action:@selector(chonesePeople:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_workBtn];
    _personBtn = [[UIButton alloc]initWithFrame:CGRectMake(WIDTH-left-80, 360, 80, 20)];
    _personBtn.tag = 0;
    [_personBtn setImage:[UIImage imageNamed:@"selectNo_login"] forState:UIControlStateNormal];
    [_personBtn setTitle:@"社会人员" forState:UIControlStateNormal];
    _personBtn.titleLabel.font = [UIFont systemFontOfSize:13];
    [_personBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_personBtn addTarget:self action:@selector(chonesePeople:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_personBtn];

}

- (void)buildBtn {
    UIView * view = [[UIView alloc]initWithFrame:CGRectMake(left, 400, WIDTH-60, height)];
    [self.view addSubview:view];
    for (int i = 0; i < 2; i++) {
        UIButton * btn = [[UIButton alloc]initWithFrame:CGRectMake(((view.width-10)/2+10)*i, 0, (view.width-10)/2, view.height)];
        btn.backgroundColor = RGB(0, 149, 233, 1);
        [btn setTitle:@[@"在线登录",@"离线登录"][i] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(loginChonese:) forControlEvents:UIControlEventTouchUpInside];
        btn.tag = i;
        [view addSubview:btn];
        if (i == 0) {
            UIBezierPath* rounded = [UIBezierPath bezierPathWithRoundedRect:btn.bounds byRoundingCorners:UIRectCornerTopLeft|UIRectCornerBottomLeft cornerRadii:CGSizeMake(5,5)];
            CAShapeLayer* shape = [[CAShapeLayer alloc] init];
            [shape setPath:rounded.CGPath];
            btn.layer.mask = shape;
        } else {
            UIBezierPath* rounded = [UIBezierPath bezierPathWithRoundedRect:btn.bounds byRoundingCorners:UIRectCornerTopRight|UIRectCornerBottomRight cornerRadii:CGSizeMake(5,5)];
            CAShapeLayer* shape = [[CAShapeLayer alloc] init];
            [shape setPath:rounded.CGPath];
            btn.layer.mask = shape;
        }
    }
    
    UILabel * lab = [[UILabel alloc]initWithFrame:CGRectMake(view.width/2-15, 10, 30, 30)];
    lab.text = @"OR";
    lab.textColor = RGB(0, 149, 233, 1);;
    lab.clipsToBounds = YES;
    lab.layer.cornerRadius = 15;
    lab.backgroundColor = [UIColor whiteColor];
    lab.textAlignment = NSTextAlignmentCenter;
    [view addSubview:lab];
}

- (void)buildBtnSecond {
    UIButton * btn = [[UIButton alloc]initWithFrame:CGRectMake(left, 460, 70, 30)];
    [btn setTitle:@"忘记密码" forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:16];
    [btn setTitleColor:RGB(0, 149, 233, 1) forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(forgetPsw) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    UIButton * btn2 = [[UIButton alloc]initWithFrame:CGRectMake(WIDTH-left-70, 460, 70, 30)];
    //功能废弃
    btn2.hidden = YES;
    btn2.titleLabel.textAlignment = NSTextAlignmentRight;
    [btn2 setTitle:@"立即注册" forState:UIControlStateNormal];
    btn2.titleLabel.font = [UIFont systemFontOfSize:16];
    [btn2 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [btn2 setTitleColor: RGB(0, 149, 233, 1) forState:UIControlStateHighlighted];
    [btn2 addTarget:self action:@selector(regist) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn2];
    
}

- (void)chonesePeople:(UIButton *)sender {
    if (sender.tag == 1) {
        [sender setImage:[UIImage imageNamed:@"select_login"] forState:UIControlStateNormal];
        [self.personBtn setImage:[UIImage imageNamed:@"selectNo_login"] forState:UIControlStateNormal];
    } else {
        [sender setImage:[UIImage imageNamed:@"select_login"] forState:UIControlStateNormal];
        [self.workBtn setImage:[UIImage imageNamed:@"selectNo_login"] forState:UIControlStateNormal];
    }
    self.select = (int)sender.tag;
}

- (void)loginChonese:(UIButton *)sender {
    NSString * md5Code = [[NSString stringWithFormat:@"%@%@%@",self.userName.textField.text,self.psw.textField.text,MD5KEY] getMd5_32Bit];
    if (sender.tag == 0) {
        if ([NSString isEmptyString:self.userName.textField.text]||[NSString isEmptyString:self.psw.textField.text]) {
            [MBProgressHUD showError:@"账号密码不能为空" toView:self.view];
            return;
        }
        [MBProgressHUD showMessag:@"请稍等" toView:self.view];
        [RequsetManager loginWithDict:@{@"LoginName":self.userName.textField.text,@"PassWord":self.psw.textField.text,@"Md5Key":md5Code} loginType:self.select completion:^(NSDictionary *returnData) {
            [MBProgressHUD hideHUDForView:self.view animated:YES];
            NSDictionary * error = returnData[@"Error"];
            if ([error[@"ErrorCode"] intValue]==0) {
                NSDictionary * dict = returnData[@"Result"][0];
                NSDictionary * userDict = dict[@"personal"];
                NSArray * msgArr = dict[@"systemMsg"];
                
                UserMessage * user = USER;
                if (user.loginType == 1) {
                    //工作人员信息
                    user.realName = userDict[@"realName"];
                    user.personalId = userDict[@"personalId"];
                    user.mobilePhone = userDict[@"mobilePhone"];
                    user.officePhone = userDict[@"officePhone"];
                    user.orgCode = userDict[@"orgCode"];
                    user.email = userDict[@"email"];
                    user.departName = userDict[@"departName"];
                } else {
                    //社会人员信息
                    user.realName = dict[@"RealName"];
                    user.shehuiADDRESS = dict[@"Address"];
                    user.shehuiID = dict[@"Id"];
                    user.shehuicardID = dict[@"Idcard"];
                    user.shehuiPSW = dict[@"Password"];
                    user.shehuiREGTIME = dict[@"RegTime"];
                    user.shehuiSEX = dict[@"Sex"];
                    user.shehuiPHONE = dict[@"Phone"];
                }
                user.loginType = self.select;
                user.Md5Key = md5Code;
                user.userName = self.userName.textField.text;
                user.userPsw = self.psw.textField.text;
                [USERDEFAULTS setObject:self.userName.textField.text forKey:USERNAME];
                [USERDEFAULTS setObject:self.psw.textField.text forKey:PSW];
                for (NSDictionary * dict in msgArr) {
                    if ([dict[@"identification"]isEqualToString:user.jzResultIp]) {
                        user.jzAccount = dict[@"account"];
                    } if ([dict[@"identification"]isEqualToString:user.hdResultIp]) {
                        user.hdAccount = dict[@"account"];
                    } if ([dict[@"identification"]isEqualToString:user.yzsResultIp]) {
                        user.yzsResultIp = dict[@"account"];
                    }
                }
                
                user.messageSend = [USERDEFAULTS boolForKey:MESSAGESEND];
                user.sound = [USERDEFAULTS boolForKey:SOUND];
                user.move = [USERDEFAULTS boolForKey:MOVE];
                user.trouble = [USERDEFAULTS boolForKey:TROUBLE];
                
                
                MainChooseController * main = [[MainChooseController alloc]init];
                [self.navigationController pushViewController:main animated:YES];
                NavigationController_Base * nav = [[NavigationController_Base alloc]initWithRootViewController:main];
                nav.navigateType = 2;
                UIWindow * window = [UIApplication sharedApplication].delegate.window;
                window.rootViewController = nav;
                [window makeKeyAndVisible];
            } else {
                [MBProgressHUD showError:error[@"ErrorMessage"] toView:self.view];
            }
        }];
    } else {
        
    }
}

- (void)forgetPsw {
    ForgetViewController * forget = [[ForgetViewController alloc]init];
    [self.navigationController pushViewController:forget animated:YES];
}
- (void)regist {
    RegistViewController * regist = [[RegistViewController alloc]init];
    [self.navigationController pushViewController:regist animated:YES];
}

@end
