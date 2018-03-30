//
//  PhoneNumVC_Person.m
//  zhmz
//
//  Created by 魏亮 on 2018/3/14.
//  Copyright © 2018年 魏亮. All rights reserved.
//

#import "PhoneNumVC_Person.h"

@interface PhoneNumVC_Person ()

@end

@implementation PhoneNumVC_Person

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"绑定手机号";
}

- (IBAction)submitNum:(id)sender {

}
- (IBAction)noBindPhone:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}


@end
