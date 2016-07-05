//
//  HKUSDetailViewController.m
//  StockEconomyInformation
//
//  Created by 陆金鑫 on 16/5/2.
//  Copyright © 2016年 陆金鑫. All rights reserved.
//

#import "HKUSDetailViewController.h"
#import "AFNetworking.h"
#import "UIImageView+WebCache.h"

@interface HKUSDetailViewController () {
    
    UIWebView *_detailWebView;
    
}

@end

@implementation HKUSDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = [NSString stringWithFormat:@"%@", _listModel.name];

    [self requestHKUSInfo];
    
    [self createDetailView];
    
}


- (void)createDetailView {
    _detailWebView = [[UIWebView alloc] initWithFrame:CGRectMake(0, -26, KScreenWidth, KScreenHeight +176)];
    
    _detailWebView.backgroundColor = [UIColor redColor];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:_hkusDetailModel.urlWap]];
    [_detailWebView loadRequest:request];
    
    [self.view addSubview:_detailWebView];
    
    
}



- (void)requestHKUSInfo {
    
    NSString *urlString = @"http://op.juhe.cn/onebox/stock/query";
    
    NSString *stock = _listModel.symbol;
    NSLog(@"symbol::::::::::::%@:::::::::::", stock);
    
    _hkusDetailModel = [[HKUSDetailModel alloc] init];
    
    [[AFHTTPSessionManager manager] GET:urlString parameters:@{@"stock":stock, @"key":kJHGuPiaoChaXunKey} success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        NSDictionary *dic = (NSDictionary *)responseObject;
        NSDictionary *result = [dic objectForKey:@"result"];
        [_hkusDetailModel setValuesForKeysWithDictionary:result];
        
        //NSLog(@"dic:%@", dic);
        NSLog(@"result:%@", result);
        
        NSLog(@"模型模型_hkusDetailModel:::::::%@", _hkusDetailModel);
        
        NSLog(@"需要的urlWap::::::::::%@", _hkusDetailModel.urlWap);
        
        [self createDetailView];
        
    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        
        NSLog(@"requestUSHKInfo失败！！！");
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
