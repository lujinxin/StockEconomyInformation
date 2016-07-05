//
//  HgttenViewController.h
//  StockEconomyInformation
//
//  Created by 陆金鑫 on 16/4/24.
//  Copyright © 2016年 陆金鑫. All rights reserved.
//

#import "BaseViewController.h"
#import "HgttenModel.h"
#import "HgttenCell.h"


@interface HgttenViewController : BaseViewController <UITableViewDelegate, UITableViewDataSource>{
    
    UITableView *_hgttenTableView;
    
    NSMutableArray *_hgttenArray;
    
}

@end
