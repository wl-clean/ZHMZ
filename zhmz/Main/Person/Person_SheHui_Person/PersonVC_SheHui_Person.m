//
//  PersonVC_SheHui_Person.m
//  zhmz
//
//  Created by 魏亮 on 2018/3/22.
//  Copyright © 2018年 魏亮. All rights reserved.
//

#import "PersonVC_SheHui_Person.h"

@interface PersonVC_SheHui_Person ()

@end

@implementation PersonVC_SheHui_Person

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"个人资料";
    
}

- (void)creatView {
    UIButton * btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 60, 44)];
    [btn setTitle:@"编辑" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(fixPerson) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem * barBtn = [[UIBarButtonItem alloc]initWithCustomView:btn];
    self.navigationItem.rightBarButtonItem = barBtn;
}

@end
