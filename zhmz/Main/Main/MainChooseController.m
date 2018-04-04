//
//  MainChooseController.m
//  zhmz
//
//  Created by 魏亮 on 2018/3/9.
//  Copyright © 2018年 魏亮. All rights reserved.
//

#import "MainChooseController.h"
#import "PersonViewController.h"

//医疗救助-工作
#import "YLMain_WorkViewController.h"
#import "YLSearch_WorkViewController.h"
#import "YLHandle_WorkViewController.h"
#import "YLStatistice_WorkViewController.h"
#import "YLMine_WorkViewController.h"

//医疗救助-社会
#import "MainVC_SheHui_Person.h"
#import "Message_SheHui_Person.h"
#import "Plan_SheHui_Person.h"
#import "Mine_SheHui_Person.h"



#import "CycleScrollView.h"
@interface MainChooseController ()<CycleScrollViewDelegate>
@property(nonatomic,strong)CycleScrollView * scroll;
@end

@implementation MainChooseController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:animated];
    [self.scroll.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:self.scroll.itemCount inSection:0] atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:NO];
    self.scroll.collectionView.userInteractionEnabled = YES;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.imgStr = @"backgroundImg_main";
    UIButton * btn = [[UIButton alloc]initWithFrame:CGRectMake(WIDTH-40, 40, 30, 30)];
    btn.imageView.contentMode = UIViewContentModeCenter;
    [btn setBackgroundImage:[UIImage imageNamed:@"person_main"] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(goPerson) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    UIImageView * img = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"title_main"]];
    [self.view addSubview:img];
    [img mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).mas_offset(130);
        make.left.equalTo(self.view).mas_offset(40);
        make.right.equalTo(self.view).mas_offset(-40);
        make.height.mas_equalTo(img.mas_width).multipliedBy(0.083);
    }];

    NSArray *imageArr = @[@"核对系统",@"社会救助",@"医疗救助",];
    _scroll = [CycleScrollView cycleScrollViewWithFrame:CGRectMake(0, HEIGTH/2-(self.view.frame.size.width-150)/2, self.view.frame.size.width, self.view.frame.size.width-150) imageGroups:imageArr];
    _scroll.imgCornerRadius = (self.view.frame.size.width - 150)/2;
    _scroll.itemWidth = self.view.frame.size.width - 150;
    _scroll.delegate = self;
    [self.view addSubview:_scroll];
}

- (void)cycleScrollView:(CycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index {

    UITabBarController * tab;
    __block NSDictionary * dict;
    UserMessage * user= USER;
    if (user.loginType == 1) {
        if (index == 0) {
            if ([NSString isEmptyString:user.hdAccount]) {
 
            } else {
                [MBProgressHUD showError:@"请联系管理员" toView:self.view];
            }
        } else if (index == 1) {
            if ([NSString isEmptyString:user.jzAccount]) {
                [RequsetManager getUserInfoWithAccount:user.jzAccount md5Key:user.Md5Key completion:^(NSDictionary *returnData) {
                    NSArray * titName = @[@"首页",@"数据查询",@"业务办理",@"统计分析",@"我的"];
                    NSArray * imgName = @[@"首页",@"信息查询",@"业务办理",@"统计分析",@"我的"];
                    NSArray * imgNameSelect = @[@"首页_select",@"信息查询_select",@"业务办理_select",@"统计分析_select",@"我的_select"];
                    NSArray * className = @[@"YLMain_WorkViewController",@"YLSearch_WorkViewController",@"YLHandle_WorkViewController",@"YLStatistice_WorkViewController",@"YLMine_WorkViewController"];
                    dict = [[NSDictionary alloc]initWithObjectsAndKeys:titName,@"titName",imgName,@"imgName",imgNameSelect,@"imgNameSelect",className,@"className", nil];
                }];
            } else {
                [MBProgressHUD showError:@"请联系管理员" toView:self.view];
            }
        } else {
            if ([NSString isEmptyString:user.yzsAccount]) {

            } else {
                [MBProgressHUD showError:@"请联系管理员" toView:self.view];
            }
        }
    } else {
        NSArray * titName = @[@"首页",@"信息查询",@"进度查询",@"我的"];
        NSArray * imgName = @[@"首页",@"信息查询",@"进度查询",@"我的"];
        NSArray * imgNameSelect = @[@"首页_select",@"信息查询_select",@"进度查询_select",@"我的_select"];
        NSArray * className = @[@"MainVC_SheHui_Person",@"Message_SheHui_Person",@"Plan_SheHui_Person",@"Mine_SheHui_Person"];
        dict = [[NSDictionary alloc]initWithObjectsAndKeys:titName,@"titName",imgName,@"imgName",imgNameSelect,@"imgNameSelect",className,@"className", nil];
        if (index == 0) {
            if ([NSString isEmptyString:user.hdAccount]) {
                
            } else {
                [MBProgressHUD showError:@"请联系管理员" toView:self.view];
            }
        } else if (index == 1) {
            if ([NSString isEmptyString:user.jzAccount]) {
                
            } else {
                [MBProgressHUD showError:@"请联系管理员" toView:self.view];
            }
        } else {
            if ([NSString isEmptyString:user.yzsAccount]) {
                
            } else {
                [MBProgressHUD showError:@"请联系管理员" toView:self.view];
            }
        }
    }
    
    if (dict !=nil) {
        tab = [self getTabBarControllerWithVCMessage:dict];
        [self.navigationController pushViewController:tab animated:YES];
    }
}



- (UITabBarController *)getTabBarControllerWithVCMessage:(NSDictionary *)dict{
    NSMutableArray * sonViewControllers=[[NSMutableArray alloc]init];
    NSArray * titName = dict[@"titName"];
    NSArray * imgName = dict[@"imgName"];
    NSArray * imgNameSelect = dict[@"imgNameSelect"];
    NSArray * className = dict[@"className"];
    for (int i=0; i<titName.count; i++) {
        NSString *title = titName[i];
        Class c = NSClassFromString(className[i]);
        ViewController_Base * superViewController = [[c alloc]init];
        superViewController.title = title;
        superViewController.tabBarItem.image = [UIImage imageNamed:imgName[i]];
        superViewController.tabBarItem.selectedImage = [UIImage imageNamed:imgNameSelect[i]];
        [sonViewControllers addObject:superViewController];
    }
    UITabBarController * tab = [[UITabBarController alloc]init];
    tab.viewControllers = sonViewControllers;
    return tab;
}

- (void)goPerson {
    PersonViewController * person = [[PersonViewController alloc]init];
    [self.navigationController pushViewController:person animated:YES];
}

@end
