//
//  HgttenViewController.m
//  StockEconomyInformation
//
//  Created by 陆金鑫 on 16/4/24.
//  Copyright © 2016年 陆金鑫. All rights reserved.
//

#import "HgttenViewController.h"
#import "AFNetworking.h"
#import "MJRefresh.h"


static NSString *iden4 = @"HgttenCell";

@interface HgttenViewController ()

@end

@implementation HgttenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self requestHgttenData];
    
    [self createHgttenTableView];
    
}


- (void)createHgttenTableView {
    
    _hgttenTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, KScreenHeight -64 -44 -49) style:UITableViewStylePlain];
    
    _hgttenTableView.delegate = self;
    _hgttenTableView.dataSource = self;
    
    [_hgttenTableView registerNib:[UINib nibWithNibName:@"HgttenCell" bundle:nil] forCellReuseIdentifier:iden4];
    
    _hgttenTableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self requestHgttenData];
        [_hgttenTableView reloadData];
        [_hgttenTableView.header endRefreshing];
        
    }];
    
    _hgttenTableView.footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        
        [_hgttenTableView.footer endRefreshing];
    }];
    
    _hgttenTableView.rowHeight = 125;
    [self.view addSubview:_hgttenTableView];
    
}


//-----------------tableView代理方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return _hgttenArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    HgttenCell *hgttenCell = [tableView dequeueReusableCellWithIdentifier:iden4 forIndexPath:indexPath];
    hgttenCell.hgttenModel = _hgttenArray[indexPath.row];
    
    return hgttenCell;
    
}


//----------------网络请求
- (void)requestHgttenData {
    
    _hgttenArray = [NSMutableArray array];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    NSDate *date = [NSDate dateWithTimeIntervalSinceNow:-(24-8)*60*60];     //昨天
    //    NSDate *date = [NSDate date];     //今天
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy-MM-dd";
    NSString *dateString = [formatter stringFromDate:date];
//    dateString = @"2016-04-29";
    
    [manager.requestSerializer setValue:kAPIStoreKey forHTTPHeaderField:@"apikey"];
    
    [manager GET:@"http://apis.baidu.com/tehir/stockassistant/hgtten" parameters:
     @{@"date":dateString} success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
         
         NSDictionary *dic = (NSDictionary *)responseObject;
         NSArray *array = [dic objectForKey:@"rows"];
         for (NSDictionary *dic in array) {
             HgttenModel *model = [[HgttenModel alloc] init];
             [model setValuesForKeysWithDictionary:dic];
             [_hgttenArray addObject:model];
             
         }
         
         if (_hgttenArray.count == 0) {
             //初始化文件路径
             NSString *path  = [[NSBundle mainBundle] pathForResource:@"hgtten.json" ofType:nil];
             NSData *d = [NSData dataWithContentsOfFile:path];
             //解析json数据，使用系统方法 JSONObjectWithData:  options: error:
             NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:d options:NSJSONReadingMutableLeaves error:nil];
             NSArray *array = [dic objectForKey:@"rows"];
             for (NSDictionary *dic in array) {
                 HgttenModel *model = [[HgttenModel alloc] init];
                 [model setValuesForKeysWithDictionary:dic];
                 
                 [_hgttenArray addObject:model];
                 
                 NSLog(@"ttttttttttttttttttttttmodel%@TTTTTTTTTTTTTTTTTTTTTT", model);
             }
         }
         
         [_hgttenTableView reloadData];
         
         NSLog(@"_hgttenArray-----------------%@", _hgttenArray);
         
     } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
         
         NSLog(@"沪港通十大交易数据请求失败！");
         
         //初始化文件路径
         NSString *path  = [[NSBundle mainBundle] pathForResource:@"hgtten.json" ofType:nil];
         NSData *d = [NSData dataWithContentsOfFile:path];
         //解析json数据，使用系统方法 JSONObjectWithData:  options: error:
         NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:d options:NSJSONReadingMutableLeaves error:nil];
         NSArray *array = [dic objectForKey:@"rows"];
         for (NSDictionary *dic in array) {
             HgttenModel *model = [[HgttenModel alloc] init];
             [model setValuesForKeysWithDictionary:dic];
             
             [_hgttenArray addObject:model];
             
             NSLog(@"ttttttttttttttttttttttmodel%@TTTTTTTTTTTTTTTTTTTTTT", model);
         }
         [_hgttenTableView reloadData];
         
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
