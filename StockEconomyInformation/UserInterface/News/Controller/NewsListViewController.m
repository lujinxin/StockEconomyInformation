//
//  NewsListViewController.m
//  StockEconomyInformation
//
//  Created by 陆金鑫 on 16/4/19.
//  Copyright © 2016年 陆金鑫. All rights reserved.
//

#import "NewsListViewController.h"
#import "MJRefresh.h"
#import "AFNetworking.h"


static NSString *iden2 = @"NewsTableViewCell";

@interface NewsListViewController (){

    NSString *_currentURL;
}

@end

@implementation NewsListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self requestNews];
    
    [self createNewsListTableview];

}


//----------------------创建新闻列表
- (void)createNewsListTableview {
    
    _newsListTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, KScreenHeight -64 -44 -49) style:UITableViewStylePlain];
    _newsListTableView.delegate = self;
    _newsListTableView.dataSource = self;
    
    [_newsListTableView registerNib:[UINib nibWithNibName:@"NewsTableViewCell" bundle:nil] forCellReuseIdentifier:iden2];
    
    _newsListTableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self requestNews];
        [_newsListTableView reloadData];
        [_newsListTableView.header endRefreshing];
    }];
    _newsListTableView.footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        
        [_newsListTableView.footer endRefreshing];
    }];
    
    _newsListTableView.rowHeight = 100;
    [self.view addSubview:_newsListTableView];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _newsListArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NewsTableViewCell *newsTableViewCell = [tableView dequeueReusableCellWithIdentifier:iden2 forIndexPath:indexPath];
    newsTableViewCell.newsListModel = _newsListArray[indexPath.row];
    return newsTableViewCell;
}

#pragma mark ------------------------单元格点击事件-------------------------
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NewsDetailViewController *newsDetailVC = [[NewsDetailViewController alloc] init];
    newsDetailVC.model = _newsListArray[indexPath.row];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:newsDetailVC];
    nav.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self.navigationController pushViewController:newsDetailVC animated:YES];
    
}



- (void)requestNews{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"NewsURL.plist" ofType:nil];
    NSArray *newsTypeArray = [NSArray arrayWithContentsOfFile:path];
    NSString *title = self.title;
    for (NSDictionary *dic in newsTypeArray) {
        NSString *title1 = dic[@"title"];
        if ([title1 isEqualToString:title]) {
            _currentURL = dic[@"urlString"];
        }
    }
    if (_currentURL != nil) {
        [[AFHTTPSessionManager manager] GET:@"http://api.jisuapi.com/news/search" parameters:@{@"keyword":self.title,@"appkey":kJiSuAppkey} success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
            NSDictionary *dic = (NSDictionary *)responseObject;
            NSDictionary *result = dic[@"result"];
            NSArray *list = result[@"list"];
            NSLog(@"%@",list);
            _newsListArray = [NSMutableArray array];
            for (NSDictionary *dic in list) {
                NewsListModel *model = [[NewsListModel alloc] init];
                [model setValuesForKeysWithDictionary:dic];
                [_newsListArray addObject:model];
            }
            [_newsListTableView reloadData];
            
            NSLog(@"_newsListArray----------------%@", _newsListArray);
            
        } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
            
            NSLog(@"数据请求失败");
        }];
    }
    
    
    NSLog(@"newsTypeArray是什么鬼：：%@：：", newsTypeArray);
    
    
}








- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
