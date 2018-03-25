//
//  TimerBtn.m
//  zhmz
//
//  Created by 魏亮 on 2018/3/12.
//  Copyright © 2018年 魏亮. All rights reserved.
//

#import "TimerBtn.h"

@implementation TimerBtn

+ (id)sharedTime{
    static TimerBtn *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (manager == nil) {
            manager = [[self alloc]init];
            manager.titleLabel.font = [UIFont systemFontOfSize:15];
            manager.layer.cornerRadius = 5;
            manager.backgroundColor = RGB(97, 152, 225, 1);
            [manager setTitle:@"获取验证码" forState:UIControlStateNormal];
            [manager addTarget:manager action:@selector(getCode:) forControlEvents:UIControlEventTouchUpInside];
        }
    });
    return manager;
}

- (void)getCode:(TimerBtn *)sender {
    [MBProgressHUD showSuccess:@"验证码已发送!" toView:self.superview.superview];
    sender.enabled = NO;
    sender.time = 60;
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(updateUi:) userInfo:sender repeats:YES];
}
- (void)updateUi:(NSTimer *)timer {
    TimerBtn *btn = (TimerBtn *)[timer userInfo];
    btn.time = btn.time - 1;
    NSString *str = [NSString stringWithFormat:@"%d",btn.time];
    NSAttributedString *Str = [[NSAttributedString alloc]initWithString:str attributes:@{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont systemFontOfSize:13]}];
    [btn setAttributedTitle:Str forState:UIControlStateNormal];
    if (btn.time == 0) {
        btn.time = 60;
        [btn setTitle:@"获取验证码" forState:UIControlStateNormal];
        btn.enabled = YES;
        [timer invalidate];
        timer = nil;
    }
}

@end
