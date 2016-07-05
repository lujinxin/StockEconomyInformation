//
//  DzjyViewController.m
//  StockEconomyInformation
//
//  Created by 陆金鑫 on 16/4/24.
//  Copyright © 2016年 陆金鑫. All rights reserved.
//

#import "DzjyViewController.h"
#import "AFNetworking.h"
#import "MJRefresh.h"


static NSString *iden5 = @"DzjyCell";

@interface DzjyViewController ()

@end

@implementation DzjyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self requestDzjyData];
    
    [self createDzjyTableView];
    
}

//-------------------列表
- (void)createDzjyTableView {
    
    _dzjyTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, KScreenHeight -64 -44 -49) style:UITableViewStylePlain];
    
    _dzjyTableView.delegate = self;
    _dzjyTableView.dataSource = self;
    
    [_dzjyTableView registerNib:[UINib nibWithNibName:@"DzjyCell" bundle:nil] forCellReuseIdentifier:iden5];
    
    _dzjyTableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self requestDzjyData];
        [_dzjyTableView reloadData];
        [_dzjyTableView.header endRefreshing];
        
    }];
    
    _dzjyTableView.footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        
        [_dzjyTableView.footer endRefreshing];
    }];
    
    _dzjyTableView.rowHeight = 100;
    [self.view addSubview:_dzjyTableView];
    
}


//-----------------tableView代理方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dzjyArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    DzjyCell *dzjyCell = [tableView dequeueReusableCellWithIdentifier:iden5 forIndexPath:indexPath];
    dzjyCell.dzjyModel = _dzjyArray[indexPath.row];
    
    return dzjyCell;
    
}


//----------------网络请求
- (void)requestDzjyData {
    
    _dzjyArray = [NSMutableArray array];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    NSDate *date = [NSDate dateWithTimeIntervalSinceNow:-(24-8)*60*60];     //昨天
    //    NSDate *date = [NSDate date];     //今天
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy-MM-dd";
    NSString *dateString = [formatter stringFromDate:date];
#warning 这里是测试日期
//    dateString = @"2016-04-29";
    
    [manager.requestSerializer setValue:kAPIStoreKey forHTTPHeaderField:@"apikey"];
    
    [manager GET:@"http://apis.baidu.com/tehir/stockassistant/dazongjiaoyi" parameters:
     @{@"date":dateString} success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
         
         NSDictionary *dic = (NSDictionary *)responseObject;
         NSArray *array = [dic objectForKey:@"rows"];
         for (NSDictionary *dic in array) {
             DzjyModel *model = [[DzjyModel alloc] init];
             [model setValuesForKeysWithDictionary:dic];
             
             [_dzjyArray addObject:model];
             
             NSLog(@"tttttttttttttttttttttt%@", model);
         }
         
         if (_dzjyArray.count == 0) {
             //初始化文件路径
             NSString *path  = [[NSBundle mainBundle] pathForResource:@"dazongjiaoyi.json" ofType:nil];
             NSData *d = [NSData dataWithContentsOfFile:path];
             //解析json数据，使用系统方法 JSONObjectWithData:  options: error:
             NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:d options:NSJSONReadingMutableLeaves error:nil];
             NSArray *array = [dic objectForKey:@"rows"];
             for (NSDictionary *dic in array) {
                 DzjyModel *model = [[DzjyModel alloc] init];
                 [model setValuesForKeysWithDictionary:dic];
                 
                 [_dzjyArray addObject:model];
                 
                 NSLog(@"ttttttttttttttttttttttmodel%@TTTTTTTTTTTTTTTTTTTTTT", model);
             }
         }
         
         [_dzjyTableView reloadData];
         
         NSLog(@"_dzjyArray-----------------%@", _dzjyArray);
         
     } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
         
         NSLog(@"大宗交易数据请求失败！");
         
         //初始化文件路径
         NSString *path  = [[NSBundle mainBundle] pathForResource:@"dazongjiaoyi.json" ofType:nil];
         NSData *d = [NSData dataWithContentsOfFile:path];
         //解析json数据，使用系统方法 JSONObjectWithData:  options: error:
         NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:d options:NSJSONReadingMutableLeaves error:nil];
         NSArray *array = [dic objectForKey:@"rows"];
         for (NSDictionary *dic in array) {
             DzjyModel *model = [[DzjyModel alloc] init];
             [model setValuesForKeysWithDictionary:dic];
             
             [_dzjyArray addObject:model];
             
             NSLog(@"ttttttttttttttttttttttmodel%@TTTTTTTTTTTTTTTTTTTTTT", model);
         }
         [_dzjyTableView reloadData];
         
         NSLog(@"_dzjyArray-----------------%@", _dzjyArray);
         
         
     }];
    
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
