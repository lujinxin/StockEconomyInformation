//
//  MoreViewController.m
//  StockEconomyInformation
//
//  Created by 陆金鑫 on 16/1/8.
//  Copyright © 2016年 陆金鑫. All rights reserved.
//

#import "MoreViewController.h"

@interface MoreViewController ()

@end

@implementation MoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController.navigationBar setTitleTextAttributes:@{ NSFontAttributeName:[UIFont systemFontOfSize:19.0], NSForegroundColorAttributeName:[UIColor whiteColor]
                                                                       }];
    [self loadScnav];
    
    
}


- (void)loadScnav {
    
    SCNavTabBarController *scnav = [[SCNavTabBarController alloc] init];
    NSMutableArray *vcArray = [NSMutableArray array];
    
    NbjyViewController *nbjyVC = [[NbjyViewController alloc] init];
    
    HgttenViewController *hgttenVC = [[HgttenViewController alloc] init];
    
    DzjyViewController *dzjyVC = [[DzjyViewController alloc] init];
    
    nbjyVC.title = @"内部交易信息";
    hgttenVC.title = @"沪港通十大成交股";
    dzjyVC.title = @"大宗交易信息";
    
    
    [vcArray addObject:nbjyVC];
    [vcArray addObject:hgttenVC];
    [vcArray addObject:dzjyVC];
    
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
