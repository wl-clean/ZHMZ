//
//  SetVC_Person.m
//  zhmz
//
//  Created by 魏亮 on 2018/3/14.
//  Copyright © 2018年 魏亮. All rights reserved.
//

#import "SetVC_Person.h"
#import "LoginViewController.h"
#import <AudioToolbox/AudioToolbox.h>
@interface SetVC_Person ()

@property(nonatomic,strong)UserMessage * user;
@property (weak, nonatomic) IBOutlet UISwitch *messageSend;
@property (weak, nonatomic) IBOutlet UISwitch *soundSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *moveSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *quiteSwitch;

@end

@implementation SetVC_Person

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"设置";
    self.user = USER;
    [self.messageSend setOn:self.user.messageSend];
    [self.soundSwitch setOn:self.user.sound];
    [self.moveSwitch setOn:self.user.move];
    [self.quiteSwitch setOn:self.user.trouble];
    
}
- (IBAction)newSend:(id)sender {
    self.user.messageSend = !self.user.messageSend;
    [self.messageSend setOn:self.user.messageSend];
    [USERDEFAULTS setBool:self.user.messageSend forKey:MESSAGESEND];
}
- (IBAction)soundSwitch:(id)sender {
    self.user.sound = !self.user.sound;
    [self.soundSwitch setOn:self.user.sound];
    [USERDEFAULTS setBool:self.user.sound forKey:SOUND];
}
- (IBAction)moveSwitch:(id)sender {
    self.user.move = !self.user.move;
    [self.moveSwitch setOn:self.user.move];
    [USERDEFAULTS setBool:self.user.move forKey:MOVE];
}
- (IBAction)quiteSwitch:(id)sender {
    self.user.trouble = !self.user.trouble;
    [self.quiteSwitch setOn:self.user.trouble];
    [USERDEFAULTS setBool:self.user.trouble forKey:TROUBLE];
}
- (IBAction)loginOut:(id)sender {
    LoginViewController  * loginView = [[LoginViewController alloc]init];
    NavigationController_Base * loginNaigtion = [[NavigationController_Base alloc]initWithRootViewController:loginView];
    loginNaigtion.navigateType = 1;
    UIWindow * window = [UIApplication sharedApplication].delegate.window;
    window.rootViewController = loginNaigtion;
}


@end
