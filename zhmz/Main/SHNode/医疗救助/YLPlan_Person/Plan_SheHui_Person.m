//
//  Plan_SheHui_Person.m
//  zhmz
//
//  Created by 魏亮 on 2018/3/18.
//  Copyright © 2018年 魏亮. All rights reserved.
//

#import "Plan_SheHui_Person.h"

@interface Plan_SheHui_Person ()<UITableViewDelegate,UITableViewDataSource,
UISearchControllerDelegate,UISearchResultsUpdating>

@property (nonatomic,retain) UISearchController *searchController;
@property (nonatomic,strong) UITableView *tableView;

@property (nonatomic,strong) NSMutableArray *dataListArry;
@property (nonatomic,strong) NSMutableArray *searchListArry;
@end

@implementation Plan_SheHui_Person

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tabBarController.navigationItem.title = @"进度查询";
    self.dataListArry = [NSMutableArray array];
    self.searchListArry = [NSMutableArray array];
    self.dataListArry = [NSMutableArray array];
    for (NSInteger i =0; i<100; i++) {
        [self.dataListArry addObject:[NSString stringWithFormat:@"%ld%@",(long)i,[self shuffledAlphabet]]];
    }
    [self buildUI];
}

- (void)buildUI {
    self.tableView =[[UITableView alloc]initWithFrame:CGRectMake(0, 0,WIDTH ,HEIGTH)];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;

    self.searchController = [[UISearchController alloc]initWithSearchResultsController:nil];
    self.searchController.delegate= self;
    self.searchController.searchResultsUpdater = self;
    self.searchController.searchBar.barTintColor = RGB(235, 236, 239, 1);
    self.searchController.searchBar.placeholder= @"输入受理号查询";
    self.searchController.searchBar.frame = CGRectMake(0,0,WIDTH, 44);
    self.tableView.tableHeaderView = self.searchController.searchBar;
    [self.view addSubview: self.tableView];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (self.searchController.active) {
        return [self.searchListArry count];
    }
    else {
        return 0;
    }
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *flag=@"cell";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:flag];
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:flag];
    }
    if (self.searchController.active) {
        [cell.textLabel setText:self.searchListArry[indexPath.row]];
    }
    else{
        [cell.textLabel setText:self.dataListArry[indexPath.row]];
    }
    return cell;
}
-(void)updateSearchResultsForSearchController:(UISearchController *)searchController {
    NSString *searchString = [self.searchController.searchBar text];
    NSPredicate *preicate = [NSPredicate predicateWithFormat:@"SELF CONTAINS[c] %@", searchString];
    if (self.searchListArry!= nil) {
        [self.searchListArry removeAllObjects];
    }
    //过滤数据
    self.searchListArry= [NSMutableArray arrayWithArray:[self.dataListArry filteredArrayUsingPredicate:preicate]];
    //刷新表格
    [self.tableView reloadData];
}

#pragma mark - UISearchControllerDelegate代理,可以省略,主要是为了验证打印的顺序
- (void)willPresentSearchController:(UISearchController *)searchController
{
    NSLog(@"willPresentSearchController");
}

- (void)didPresentSearchController:(UISearchController *)searchController
{
    NSLog(@"didPresentSearchController");
}

- (void)willDismissSearchController:(UISearchController *)searchController
{
    NSLog(@"willDismissSearchController");
}

- (void)didDismissSearchController:(UISearchController *)searchController
{
    NSLog(@"didDismissSearchController");
}

- (void)presentSearchController:(UISearchController *)searchController
{
    NSLog(@"presentSearchController");
}



- (NSString *)shuffledAlphabet {
    
    NSMutableArray * shuffledAlphabet = [NSMutableArray arrayWithArray:@[@"A",@"B",@"C",@"D",@"E",@"F",@"G",@"H",@"I",@"J",@"K",@"L",@"M",@"N",@"O",@"P",@"Q",@"R",@"S",@"T",@"U",@"V",@"W",@"X",@"Y",@"Z"]];
    
    NSString *strTest = [[NSString alloc]init];
    for (int i=0; i<3; i++) {
        int x = arc4random() % 25;
        strTest = [NSString stringWithFormat:@"%@%@",strTest,shuffledAlphabet[x]];
    }
    return strTest;
}

@end
