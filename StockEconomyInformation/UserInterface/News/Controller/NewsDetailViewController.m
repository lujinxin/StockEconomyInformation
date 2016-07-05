//
//  NewsDetailViewController.m
//  StockEconomyInformation
//
//  Created by 陆金鑫 on 16/4/21.
//  Copyright © 2016年 陆金鑫. All rights reserved.
//

#import "NewsDetailViewController.h"

@interface NewsDetailViewController () <UIScrollViewDelegate, UIWebViewDelegate> {
    
    UIWebView *_newsWebView;
    
}

@end

@implementation NewsDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createNav];
    
    
}



- (void)createNav {
    [self setTitle:@"详情"];
//    [self.navigationController.navigationBar setTintColor:[UIColor redColor]];
//    [self.navigationController.navigationBar setBarTintColor:[UIColor redColor]];
    
    _newsWebView = [[UIWebView alloc] initWithFrame:CGRectMake(0, -49, KScreenWidth, KScreenHeight +360)];
    _newsWebView.scrollView.delegate = self;
    _newsWebView.delegate = self;
    _newsWebView.backgroundColor = [UIColor redColor];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:self.model.url]];
    [_newsWebView loadRequest:request];
    
    [self.view addSubview:_newsWebView];
    
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
