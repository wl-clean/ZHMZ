//
//  PhoneNumChangeViewController.m
//  zhmz
//
//  Created by 魏亮 on 2018/4/2.
//  Copyright © 2018年 魏亮. All rights reserved.
//

#import "PhoneNumChangeViewController.h"
#import "AddPhone.h"
@interface PhoneNumChangeViewController ()
@property (weak, nonatomic) IBOutlet UILabel *phone;

@end

@implementation PhoneNumChangeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"修改手机号";
    UserMessage * user = USER;
    if (user.loginType == 1) {
        self.phone.text = user.mobilePhone;
    } else {
        self.phone.text = user.shehuiPHONE;
    }
}
- (IBAction)phoneChange:(id)sender {
    
}


@end
