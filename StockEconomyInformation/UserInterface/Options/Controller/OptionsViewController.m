//
//  OptionsViewController.m
//  StockEconomyInformation
//
//  Created by 陆金鑫 on 16/1/8.
//  Copyright © 2016年 陆金鑫. All rights reserved.
//

#import "OptionsViewController.h"
#import "AFNetworking.h"
#import "MJRefresh.h"
#import "DBManager.h"
#import "SelectedStock.h"


static NSString *idenOpt = @"ListCell";

@interface OptionsViewController () {
    ListModel *_tempModel;
    
}

@end

@implementation OptionsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"自选";
    
    [self.navigationController.navigationBar setTitleTextAttributes:@{ NSFontAttributeName:[UIFont systemFontOfSize:19.0], NSForegroundColorAttributeName:[UIColor whiteColor]
                                                                       }];
    
    [self createListHeader];
    
    [self createOptionsList];
    
    [self loadDatabase];
    
}

#pragma mark ---------------------创建列表头(30 +42)-----------------------
- (void)createListHeader {
    
    //表头条
    UIView *listHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 64, KScreenWidth, 30)];
    listHeaderView.backgroundColor = [UIColor grayColor];
    //股票名称
    UILabel *stockNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 110, 30)];
    stockNameLabel.text = @"股票名称";
    stockNameLabel.textAlignment = NSTextAlignmentCenter;
    //现价
    UILabel *stockPriceLabel = [[UILabel alloc] initWithFrame:CGRectMake(108, 0, 80, 30)];
    stockPriceLabel.text = @"现价";
    stockPriceLabel.textAlignment = NSTextAlignmentCenter;
    //涨跌
    UILabel *stockUpDownLabel = [[UILabel alloc] initWithFrame:CGRectMake(195, 0, 80, 30)];
    stockUpDownLabel.text = @"涨跌";
    stockUpDownLabel.textAlignment = NSTextAlignmentCenter;
    //涨跌幅
    UILabel *stockUpdownPercentLabel = [[UILabel alloc] initWithFrame:CGRectMake(285, 0, 80, 30)];
    stockUpdownPercentLabel.text = @"涨幅";
    stockUpdownPercentLabel.textAlignment = NSTextAlignmentCenter;
    
    [listHeaderView addSubview:stockNameLabel];
    [listHeaderView addSubview:stockPriceLabel];
    [listHeaderView addSubview:stockUpDownLabel];
    [listHeaderView addSubview:stockUpdownPercentLabel];
    [self.view addSubview:listHeaderView];
}


#pragma mark ------------------创建自选列表
- (void)createOptionsList {
    
    _optionsTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64 +30, KScreenWidth, KScreenHeight -64 -49 -30) style:UITableViewStylePlain];
    _optionsTableView.delegate = self;
    _optionsTableView.dataSource = self;
    
    [_optionsTableView registerNib:[UINib nibWithNibName:@"ListCell" bundle:nil] forCellReuseIdentifier:idenOpt];
    
    _optionsTableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self loadDatabase];
        [_optionsTableView reloadData];
        [_optionsTableView.header endRefreshing];
    }];
    
    _optionsTableView.footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        
        [_optionsTableView.footer endRefreshing];
    }];
    
    _optionsTableView.rowHeight = 60;
    
    [self.view addSubview:_optionsTableView];
    
}

#pragma mark ----------------代理方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return _optionListArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ListCell *listCell = [tableView dequeueReusableCellWithIdentifier:idenOpt forIndexPath:indexPath];
    
    listCell.listModel = _optionListArray[indexPath.row];
    
    _tempModel = listCell.listModel;
    
    return listCell;
}


#pragma mark ------------------------单元格点击事件-------------------------
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    _stockDetailVC = [[StockDetailViewController alloc] init];
    
    _stockDetailVC.listModel = _optionListArray[indexPath.row];
    
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:_stockDetailVC];
    
    nav.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self.navigationController pushViewController:_stockDetailVC animated:YES];
    
}


#pragma mark ---------------------删自选
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [_optionListArray removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
        //删除数据库
        DBManager *manager = [DBManager shareDBManager];
        NSArray *databaseArray = [manager quaryWithName:@"SelectedStock" withPredicate:nil];
        [manager removeData:databaseArray[indexPath.row]];
        
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    return @"删自选";
}



#pragma mark --------------------加载数据库
- (void)loadDatabase {
    _optionListArray = [NSMutableArray array];
    DBManager *manager = [DBManager shareDBManager];
    NSArray *databaseArray = [manager quaryWithName:@"SelectedStock" withPredicate:nil];
    
    for (SelectedStock *selectedStock in databaseArray) {
        NSLog(@"查询测试查询测试：：：%@", selectedStock.stockName);
        
        ListModel *listModel = [[ListModel alloc] init];
        listModel.symbol = selectedStock.stockCode;
        listModel.name = selectedStock.stockName;
        listModel.trade = [NSNumber numberWithFloat:selectedStock.stockPrice];
        listModel.pricechange = [NSNumber numberWithFloat:selectedStock.pricecChange];
        listModel.changepercent = [NSNumber numberWithFloat:selectedStock.changePercent];
        
        [_optionListArray addObject:listModel];
        
    }
    NSLog(@"数据库读取：：：%@", _optionListArray);
    
}





















- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
