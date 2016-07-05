//
//  SZViewController.h
//  StockEconomyInformation
//
//  Created by 陆金鑫 on 16/4/27.
//  Copyright © 2016年 陆金鑫. All rights reserved.
//

#import "BaseViewController.h"
#import "StockDetailViewController.h"
#import "ListModel.h"
#import "ListCell.h"


@interface SZViewController : BaseViewController<UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate> {
    
    UITableView *_szListTableView;
    
    NSMutableArray *_szListArray;
    
    StockDetailViewController *_stockDetailVC;
    
    UITextField *_searchTextField;
}

@end
