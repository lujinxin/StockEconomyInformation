//
//  SHViewController.h
//  StockEconomyInformation
//
//  Created by 陆金鑫 on 16/4/27.
//  Copyright © 2016年 陆金鑫. All rights reserved.
//

#import "BaseViewController.h"
#import "StockDetailViewController.h"
#import "ListModel.h"
#import "ListCell.h"


@interface SHViewController : BaseViewController <UITableViewDelegate, UITableViewDataSource>{
    
    UITableView *_shListTableView;
    
    NSMutableArray *_shListArray;
    
    StockDetailViewController *_stockDetailVC;
    
    UITextField *_searchTextField;
    
    
}




@end
