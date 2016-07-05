//
//  DzjyViewController.h
//  StockEconomyInformation
//
//  Created by 陆金鑫 on 16/4/24.
//  Copyright © 2016年 陆金鑫. All rights reserved.
//

#import "BaseViewController.h"
#import "DzjyModel.h"
#import "DzjyCell.h"


@interface DzjyViewController : BaseViewController <UITableViewDelegate, UITableViewDataSource>{
    
    UITableView *_dzjyTableView;
    
    NSMutableArray *_dzjyArray;
    
}


@end
