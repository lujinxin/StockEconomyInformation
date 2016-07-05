//
//  NewsListViewController.h
//  StockEconomyInformation
//
//  Created by 陆金鑫 on 16/4/19.
//  Copyright © 2016年 陆金鑫. All rights reserved.
//

#import "BaseViewController.h"
#import "NewsListModel.h"
#import "NewsTableViewCell.h"
#import "NewsDetailViewController.h"



@interface NewsListViewController : BaseViewController<UITableViewDelegate, UITableViewDataSource> {
    
    UITableView *_newsListTableView;
    
    //存放 model 的数组
    NSMutableArray *_newsListArray;
}

@end
