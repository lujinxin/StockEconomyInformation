//
//  NbjyViewController.h
//  StockEconomyInformation
//
//  Created by 陆金鑫 on 16/4/24.
//  Copyright © 2016年 陆金鑫. All rights reserved.
//

#import "BaseViewController.h"
#import "NbjyCell.h"
#import "NbjyModel.h"


@interface NbjyViewController : BaseViewController <UITableViewDelegate, UITableViewDataSource> {
    
    UITableView *_nbjyTableView;
    
    NSMutableArray *_nbjyArray;
    
}

@end
