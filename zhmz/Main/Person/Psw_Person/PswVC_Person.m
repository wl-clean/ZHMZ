//
//  PswVC_Person.m
//  zhmz
//
//  Created by 魏亮 on 2018/3/14.
//  Copyright © 2018年 魏亮. All rights reserved.
//

#import "PswVC_Person.h"

@interface PswVC_Person ()

@end

@implementation PswVC_Person

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"修改密码";
}


- (IBAction)changePswSubmit:(id)sender {
    UserMessage * user = USER;
    if ([self.pswNew.text isEqualToString:self.pswNewAgain.text]) {
        NSDictionary * dict = [NSDictionary dictionaryWithObjectsAndKeys:user.userName,@"LoginName",self.pswOld.text,@"PassWord",self.pswNew.text,@"newPassWord", nil];
        [RequsetManager
         alterPswWithDict:dict
         completion:^(NSDictionary *returnData) {
             NSNumber * errorCode = returnData[@"Error"][@"ErrorCode"];
             if (errorCode == 0) {
                 [MBProgressHUD showError:@"错误" toView:self.view];
                 [self performSelector:@selector(popBack) withObject:self afterDelay:0.5];
             } else {
                 [MBProgressHUD showError:@"错误" toView:self.view];
             }
        }];
    } else {
        [MBProgressHUD showError:@"输入不正确" toView:self.view];
    }
}

- (void)popBack {
    [self.navigationController popViewControllerAnimated:YES];
}
@end
