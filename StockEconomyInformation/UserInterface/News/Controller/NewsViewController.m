//
//  NewsViewController.m
//  StockEconomyInformation
//
//  Created by 陆金鑫 on 16/1/8.
//  Copyright © 2016年 陆金鑫. All rights reserved.
//

#import "NewsViewController.h"
#import "SCNavTabBarController.h"
#import "NewsListViewController.h"



@interface NewsViewController () {
    NSArray *_newsTypeArray;
}

@end

@implementation NewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController.navigationBar setTitleTextAttributes:@{ NSFontAttributeName:[UIFont systemFontOfSize:19.0], NSForegroundColorAttributeName:[UIColor whiteColor]
                                                                       }];
    [self loadScnav];
    
}


- (void)loadScnav {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"NewsURL.plist" ofType:nil];
    _newsTypeArray = [NSArray arrayWithContentsOfFile:path];
    SCNavTabBarController *scnav = [[SCNavTabBarController alloc] init];
    NSMutableArray *vcArray = [NSMutableArray array];
    for (NSDictionary *dic in _newsTypeArray) {
        NewsListViewController *newsListVC = [[NewsListViewController alloc] init];
        newsListVC.title = dic[@"title"];
        [vcArray addObject:newsListVC];
    }
    scnav.subViewControllers = [vcArray copy];
    [scnav addParentController:self];
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
