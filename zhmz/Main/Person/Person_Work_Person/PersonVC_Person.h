//
//  PersonVC_Person.h
//  zhmz
//
//  Created by 魏亮 on 2018/3/14.
//  Copyright © 2018年 魏亮. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PersonVC_Person : ViewController_Base
@property (weak, nonatomic) IBOutlet UITextField *name;
@property (weak, nonatomic) IBOutlet UITextField *phone;
@property (weak, nonatomic) IBOutlet UITextField *e_mail;
@property (weak, nonatomic) IBOutlet UITextField *type;
@property (weak, nonatomic) IBOutlet UIButton *submitBtn;

@end
