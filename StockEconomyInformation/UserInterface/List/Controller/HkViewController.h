//
//  HkViewController.h
//  StockEconomyInformation
//
//  Created by 陆金鑫 on 16/4/27.
//  Copyright © 2016年 陆金鑫. All rights reserved.
//

#import "BaseViewController.h"
#import "ListModel.h"
#import "ListCell.h"
#import "HKUSDetailViewController.h"
#import "StockDetailViewController.h"

@interface HkViewController : BaseViewController<UITableViewDelegate, UITableViewDataSource> {
    
    UITableView *_hkListTableView;
    
    NSMutableArray *_hkListArray;
    
    HKUSDetailViewController *_hkusDetailVC;
    
    StockDetailViewController *_stockDetailVC;
    
    UITextField *_searchTextField;
}


@end
