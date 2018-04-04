//
//  PersonViewController.m
//  zhmz
//
//  Created by 魏亮 on 2018/3/13.
//  Copyright © 2018年 魏亮. All rights reserved.
//

#import "PersonViewController.h"
#import "PersonVC_Person.h"
#import "PersonVC_SheHui_Person.h"
#import "PswVC_Person.h"
#import "PhoneNumVC_Person.h"
#import "PhoneNumChangeViewController.h"
#import "SetVC_Person.h"
@interface PersonViewController ()

@property (weak, nonatomic) IBOutlet UIButton *checkBtn;

@end

@implementation PersonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我的";
}
- (IBAction)personClick:(id)sender {
    UserMessage * user = USER;
    id person;
    if (user.loginType == 1) {
        person = [[PersonVC_Person alloc]init];
    } else {
        person = [[PersonVC_SheHui_Person alloc]init];
    }
    [self.navigationController pushViewController:person animated:YES];

}
- (IBAction)pswClick:(id)sender {
    PswVC_Person * psw = [[PswVC_Person alloc]init];
    [self.navigationController pushViewController:psw animated:YES];
}
- (IBAction)phoneNumClick:(id)sender {
    UserMessage * user = USER;
    id phone;
    if (user.loginType == 1) {
        if ([NSString isEmptyString:user.mobilePhone]) {
            phone = [[PhoneNumVC_Person alloc]init];
        } else {
            phone = [[PhoneNumChangeViewController alloc]init];
        }
    } else {
        if ([NSString isEmptyString:user.shehuiPHONE]) {
            phone = [[PhoneNumVC_Person alloc]init];
        } else {
            phone = [[PhoneNumChangeViewController alloc]init];
        }
    }
    [self.navigationController pushViewController:phone animated:YES];
}
- (IBAction)setClick:(id)sender {
    SetVC_Person * set = [[SetVC_Person alloc]init];
    [self.navigationController pushViewController:set animated:YES];
}



@end
