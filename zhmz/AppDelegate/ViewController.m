//
//  ViewController.m
//  zhmz
//
//  Created by 魏亮 on 2018/3/8.
//  Copyright © 2018年 魏亮. All rights reserved.
//

#import "ViewController.h"
#import "TextFiled_Login.h"
@interface ViewController ()

@property(nonatomic,strong)TextFiled_Login * userName;
@property(nonatomic,strong)TextFiled_Login * psw;
@end

@implementation ViewController

static int left = 30;
static int height = 50;
static int top = 220;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor greenColor];
    UIImageView * imgB = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGTH)];
    imgB.image = [UIImage imageNamed:@"loginBackground"];
    imgB.userInteractionEnabled = YES;
    [self.view addSubview:imgB];

    [self buildText];
    [self buildBtn];
    [self buildBtnSecond];
    
    UIImageView * imgL = [[UIImageView alloc]init];
    imgL.image = [UIImage imageNamed:@"loginLogo"];
    [self.view addSubview:imgL];
    [imgL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).mas_offset(40);
        make.left.equalTo(self.view.mas_left).mas_offset(20*SCALE);
        make.bottom.equalTo(self.userName.mas_top).mas_offset(-30);
        make.right.equalTo(self.view.mas_right).mas_offset(-20*SCALE);
    }];
}

- (void)buildText {
    _userName = [[TextFiled_Login alloc]initWithFrame:CGRectMake(left, top, WIDTH-2*left, height) img:@"usericon" text:@"请输入账号"];
    [self.view addSubview:_userName];
    
    _psw = [[TextFiled_Login alloc]initWithFrame:CGRectMake(left, 290, WIDTH-2*left, height) img:@"pswIcon" text:@"请输入密码"];
    [self.view addSubview:_psw];
    
}

- (void)buildBtn {
    UIView * view = [[UIView alloc]initWithFrame:CGRectMake(left, 360, WIDTH-60, height)];
    [self.view addSubview:view];
    for (int i = 0; i < 2; i++) {
        UIButton * btn = [[UIButton alloc]initWithFrame:CGRectMake(((view.width-10)/2+10)*i, 0, (view.width-10)/2, view.height)];
        btn.backgroundColor = RGB(97, 152, 225, 1);
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
    lab.textColor = RGB(97, 152, 225, 1);
    lab.clipsToBounds = YES;
    lab.layer.cornerRadius = 15;
    lab.backgroundColor = [UIColor whiteColor];
    lab.textAlignment = NSTextAlignmentCenter;
    [view addSubview:lab];
}

- (void)buildBtnSecond {
    UIButton * btn = [[UIButton alloc]initWithFrame:CGRectMake(left, 420, 70, 30)];
    [btn setTitle:@"忘记密码" forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:16];
    [btn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [btn setTitleColor: RGB(97, 152, 225, 1) forState:UIControlStateHighlighted];
    [btn addTarget:self action:@selector(forgetPsw) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    UIButton * btn2 = [[UIButton alloc]initWithFrame:CGRectMake(WIDTH-left-70, 420, 70, 30)];
    btn2.titleLabel.textAlignment = NSTextAlignmentRight;
    [btn2 setTitle:@"立即注册" forState:UIControlStateNormal];
    btn2.titleLabel.font = [UIFont systemFontOfSize:16];
    [btn2 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [btn2 setTitleColor: RGB(97, 152, 225, 1) forState:UIControlStateHighlighted];
    [btn2 addTarget:self action:@selector(regist) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn2];

}

- (void)loginChonese:(UIButton *)sender {
    if (sender.tag == 0) {
        
    } else {
        
    }
}

- (void)forgetPsw {
    
}
- (void)regist {
    
}













@end
