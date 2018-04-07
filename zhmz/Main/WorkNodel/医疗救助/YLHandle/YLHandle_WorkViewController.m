//
//  YLHandle_WorkViewController.m
//  zhmz
//
//  Created by 魏亮 on 2018/3/31.
//  Copyright © 2018年 魏亮. All rights reserved.
//

#import "YLHandle_WorkViewController.h"

@interface YLHandle_WorkViewController ()

@end

@implementation YLHandle_WorkViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray *array=[[NSBundle mainBundle]loadNibNamed:@"YLHandle_WorkViewController" owner:nil options:nil];
    NSLog(@"%@",array);
    UserMessage * user = USER;
    if (user.regionLevel == 10101005) {
        
    } else if (user.regionLevel == 10101004) {
        
    } else {
        
    }
    
}

//乡镇XIB
- (IBAction)DCHS:(id)sender {
}
- (IBAction)MZPY:(id)sender {
}
- (IBAction)SHGS:(id)sender {
}
- (IBAction)DZDA:(id)sender {
}
- (IBAction)LXSJ:(id)sender {
}

//区县XIB
- (IBAction)RHCC:(id)sender {
}
- (IBAction)SPGS:(id)sender {
}
- (IBAction)LXSJ_QX:(id)sender {
}
- (IBAction)DZDA_QX:(id)sender {
}

//其他XIB
- (IBAction)DZDA_QT:(id)sender {
}

@end
