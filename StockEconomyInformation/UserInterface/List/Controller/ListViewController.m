//
//  ListViewController.m
//  StockEconomyInformation
//
//  Created by 陆金鑫 on 16/1/8.
//  Copyright © 2016年 陆金鑫. All rights reserved.
//

#import "ListViewController.h"
#import "SCNavTabBarController.h"
#import "SHViewController.h"
#import "SZViewController.h"
#import "HkViewController.h"
#import "USViewController.h"


@interface ListViewController ()

@end

@implementation ListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"列表";
    [self.navigationController.navigationBar setTitleTextAttributes:@{ NSFontAttributeName:[UIFont systemFontOfSize:19.0], NSForegroundColorAttributeName:[UIColor whiteColor]
                                                                       }];
    
    [self createMarketBar];
    
//    [self createSearchBar];
//    
//    [self createListHeader];
//    
//    //默认显示沪股列表
//    [self createStockList:@"http://web.juhe.cn:8080/finance/stock/shall" WithAppKey:kJHGuPiaoChaXunKey];
//    
//    //默认显示沪股列表
//    [self requestStockListData:@"http://web.juhe.cn:8080/finance/stock/shall" WithAppKey:kJHGuPiaoChaXunKey];
//    
    
}



#pragma mark -------------------创建股市列表选择条----------------------
- (void)createMarketBar {
    SCNavTabBarController *scNav = [[SCNavTabBarController alloc] init];
    NSArray *vcArray = [NSMutableArray array];
    
    SHViewController *shVC = [[SHViewController alloc] init];
    SZViewController *szVC = [[SZViewController alloc] init];
    HkViewController *hkVC = [[HkViewController alloc] init];
    USViewController *usVC = [[USViewController alloc] init];
    
    shVC.title = @"  沪股 ";
    szVC.title = @"深圳股市";
    hkVC.title = @"香港股市";
    usVC.title = @"美国股市";
    
    vcArray = @[shVC,szVC,hkVC,usVC];
    
    scNav.subViewControllers = [vcArray copy];
    [scNav addParentController:self];
}



//
//#pragma mark ------------------创建股票列表-----------------------
//- (void)createStockList:(NSString *)urlString WithAppKey:(NSString *)appKey {
//    
//    _stockListTableView = [[StockListTableView alloc] initWithFrame:CGRectMake(0, 174, KScreenWidth, KScreenHeight -174 -50)];
//    [self requestStockListData:urlString WithAppKey:appKey];
//    //下拉刷新
//    _stockListTableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
//        
//        [self requestStockListData:urlString WithAppKey:appKey];
//        [_stockListTableView reloadData];
//        [_stockListTableView.header endRefreshing];
//    }];
//    
//    //上拉加载更多
//    _stockListTableView.footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
//        
//        [_stockListTableView.footer endRefreshing];
//    }];
//    
//    
//    [self.view addSubview:_stockListTableView];
//}
//
//
//
//
//
//
//- (void)pulldownRef {
//    
//    
//    
//    
//    
//    
//}
//


#pragma mark ****************搜索按钮的点击事件*********************
//搜索按钮点击事件
- (void)searchBtnAct:(UIButton *)btn {
    
    [self.view endEditing:YES];
    
    
}










#pragma mark -------------------网络请求-----------------

//- (void)requestStockListData:(NSString *)urlString WithAppKey:(NSString *)appKey {
//    
//    _datas = [NSMutableArray array];
//    
//    [[AFHTTPSessionManager manager] GET:urlString parameters:@{@"type":@4,@"key":kJHGuPiaoShuJuKey,@"page":@1} success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
//        
//        NSDictionary *dic = (NSDictionary *)responseObject;
//        NSDictionary *result = [dic objectForKey:@"result"];
//        NSArray *data = [result objectForKey:@"data"];
//        for (NSDictionary *dics in data) {
//            
//            StockModel *model = [[StockModel alloc] init];
//            [model setValuesForKeysWithDictionary:dics];
//            [_datas addObject:model];
//        }
//        _stockListTableView.datas = _datas;
//        [_stockListTableView reloadData];
//        
////        NSLog(@"================%@================", _stockListTableView.datas);
//    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
//        
//        
//    }];
//}












/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
