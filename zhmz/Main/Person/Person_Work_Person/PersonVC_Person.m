//
//  PersonVC_Person.m
//  zhmz
//
//  Created by 魏亮 on 2018/3/14.
//  Copyright © 2018年 魏亮. All rights reserved.
//

#import "PersonVC_Person.h"

@interface PersonVC_Person ()

@end

@implementation PersonVC_Person

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"个人资料";
    [self userData];
}

- (void)userData {
    UserMessage * user = USER;
    if (![NSString isEmptyString:user.realName]) {
        self.name.text = user.realName;
    }   if (![NSString isEmptyString:user.officePhone]) {
        self.phone.text = user.officePhone;
    }   if (![NSString isEmptyString:user.email]) {
        self.e_mail.text = user.email;
    }   if (![NSString isEmptyString:user.departName]) {
        self.type.text = user.departName;
    }
}



- (void)creatView {
    UIButton * btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 60, 44)];
    [btn setTitle:@"编辑" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(fixPerson) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem * barBtn = [[UIBarButtonItem alloc]initWithCustomView:btn];
    self.navigationItem.rightBarButtonItem = barBtn;
}

- (void)fixPerson {
    self.navigationItem.rightBarButtonItem = nil;
    self.phone.userInteractionEnabled = YES;
    self.e_mail.userInteractionEnabled = YES;
    self.submitBtn.hidden = NO;
}
- (IBAction)saveAndBack:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}






@end
