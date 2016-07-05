//
//  NbjyViewController.m
//  StockEconomyInformation
//
//  Created by 陆金鑫 on 16/4/24.
//  Copyright © 2016年 陆金鑫. All rights reserved.
//

#import "NbjyViewController.h"
#import "AFNetworking.h"
#import "MJRefresh.h"

static NSString *iden3 = @"NbjyCell";

@interface NbjyViewController ()

@end

@implementation NbjyViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self requestNbjyData];
    
    [self createNbjyTableView];
    
}


//----------------创建TableView
- (void)createNbjyTableView {
    _nbjyTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, KScreenHeight -64 -44 -49) style:UITableViewStylePlain];
    _nbjyTableView.delegate = self;
    _nbjyTableView.dataSource = self;
    [_nbjyTableView registerNib:[UINib nibWithNibName:@"NbjyCell" bundle:nil] forCellReuseIdentifier:iden3];
    _nbjyTableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self requestNbjyData];
        [_nbjyTableView reloadData];
        [_nbjyTableView.header endRefreshing];
    }];
    
    _nbjyTableView.footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        
        [_nbjyTableView.footer endRefreshing];
    }];
    
    _nbjyTableView.rowHeight = 185;
    
    [self.view addSubview:_nbjyTableView];
}


//-----------------tableview代理方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return _nbjyArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NbjyCell *nbjyCell = [tableView dequeueReusableCellWithIdentifier:iden3 forIndexPath:indexPath];
    
    nbjyCell.nbjyModel = _nbjyArray[indexPath.row];
    return nbjyCell;
}


//----------------网络请求
- (void)requestNbjyData {
    
    _nbjyArray = [NSMutableArray array];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    NSDate *date = [NSDate dateWithTimeIntervalSinceNow:-(24-8)*60*60];     //昨天
    //    NSDate *date = [NSDate date];     //今天
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy-MM-dd";
    NSString *dateString = [formatter stringFromDate:date];
    
    [manager.requestSerializer setValue:kAPIStoreKey forHTTPHeaderField:@"apikey"];
    
    //    [manager GET:@"http://apis.baidu.com/tehir/stockassistant/neibujiaoyi" parameters:@{@"date":dateString} success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
    //
    //        NSDictionary *dic = (NSDictionary *)responseObject;
    //        NSArray *array = [dic objectForKey:@"rows"];
    //        for (NSDictionary *dic in array) {
    //            NbjyModel *model = [[NbjyModel alloc] init];
    //            [model setValuesForKeysWithDictionary:dic];
    //            [_nbjyArray addObject:model];
    //        }
    //        [_nbjyTableView reloadData];
    //        NSLog(@"_nbjyArray-----------------%@", _nbjyArray);
    //
    //
    //    } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
    //        NSLog(@"内部交易数据请求失败！");
    //    }];
    //
    
    [manager GET:@"http://apis.baidu.com/tehir/stockassistant/neibujiaoyi" parameters:
     @{@"date":dateString} success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
         
         NSDictionary *dic = (NSDictionary *)responseObject;
         NSArray *array = [dic objectForKey:@"rows"];
         for (NSDictionary *dic in array) {
             NbjyModel *model = [[NbjyModel alloc] init];
             [model setValuesForKeysWithDictionary:dic];
             [_nbjyArray addObject:model];
             
         }
         
         if (_nbjyArray.count == 0) {
             //初始化文件路径
             NSString *path  = [[NSBundle mainBundle] pathForResource:@"neibujiaoyi.json" ofType:nil];
             NSData *d = [NSData dataWithContentsOfFile:path];
             //解析json数据，使用系统方法 JSONObjectWithData:  options: error:
             NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:d options:NSJSONReadingMutableLeaves error:nil];
             NSArray *array = [dic objectForKey:@"rows"];
             for (NSDictionary *dic in array) {
                 NbjyModel *model = [[NbjyModel alloc] init];
                 [model setValuesForKeysWithDictionary:dic];
                 
                 [_nbjyArray addObject:model];
                 
                 NSLog(@"ttttttttttttttttttttttmodel%@TTTTTTTTTTTTTTTTTTTTTT", model);
             }
         }
         
         [_nbjyTableView reloadData];
         NSLog(@"_nbjyArray-----------------%@", _nbjyArray);
         
     } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
         
         NSLog(@"内部交易数据请求失败！");
         
         //初始化文件路径
         NSString *path  = [[NSBundle mainBundle] pathForResource:@"neibujiaoyi.json" ofType:nil];
         NSData *d = [NSData dataWithContentsOfFile:path];
         //解析json数据，使用系统方法 JSONObjectWithData:  options: error:
         NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:d options:NSJSONReadingMutableLeaves error:nil];
         NSArray *array = [dic objectForKey:@"rows"];
         for (NSDictionary *dic in array) {
             NbjyModel *model = [[NbjyModel alloc] init];
             [model setValuesForKeysWithDictionary:dic];
             
             [_nbjyArray addObject:model];
             
             NSLog(@"ttttttttttttttttttttttmodel%@TTTTTTTTTTTTTTTTTTTTTT", model);
         }
         [_nbjyTableView reloadData];
         
         NSLog(@"_nbjyArray-----------------%@", _nbjyArray);

         
         
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
