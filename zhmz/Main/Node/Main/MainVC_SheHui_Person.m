//
//  MainVC_SheHui_Person.m
//  zhmz
//
//  Created by 魏亮 on 2018/3/18.
//  Copyright © 2018年 魏亮. All rights reserved.
//

#import "MainVC_SheHui_Person.h"
#import "MainVC_SheHui_Person_Cell.h"
@interface MainVC_SheHui_Person ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation MainVC_SheHui_Person

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tabBarController.navigationItem.title = @"首页";
    [self creatRightBtnForScan];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSArray *xibArr = [[NSBundle mainBundle] loadNibNamed:@"MainVC_SheHui_Person_Cell" owner:nil options:nil];
    MainVC_SheHui_Person_Cell * cell = [xibArr objectAtIndex:0];
    cell.img.image = [UIImage imageNamed:@[@"审批进度",@"资金发放",@"复查通知",@"信访通知",@"系统通知"][indexPath.row]];
    cell.titleFirst.text = @[@"审批进度",@"资金发放",@"复查通知",@"信访通知",@"系统通知"][indexPath.row];
    cell.titleSecond.text = @[@"点击查看审批进度",@"点击资金发放消息",@"点击查看复查通知消息",@"点击查看信访通知消息",@"点击查看系统通知消息"][indexPath.row];
    return cell;
}

@end
