//
//  OptionsViewController.h
//  StockEconomyInformation
//
//  Created by 陆金鑫 on 16/1/8.
//  Copyright © 2016年 陆金鑫. All rights reserved.
//

#import "BaseViewController.h"
#import "ListModel.h"
#import "ListCell.h"
#import "StockDetailViewController.h"


@interface OptionsViewController : BaseViewController <UITableViewDelegate, UITableViewDataSource>{
    
    UITableView *_optionsTableView;
    
    NSMutableArray *_optionListArray;
    
    StockDetailViewController *_stockDetailVC;
    
}



@end
