//
//  StockDetailViewController.h
//  StockEconomyInformation
//
//  Created by 陆金鑫 on 16/4/30.
//  Copyright © 2016年 陆金鑫. All rights reserved.
//

#import "BaseViewController.h"
#import "ListModel.h"
#import "StockDetailModel.h"


@interface StockDetailViewController : BaseViewController

@property (nonatomic, strong) ListModel *listModel;

@property (nonatomic, strong) StockDetailModel *stockDetailModel;

@property (nonatomic) NSMutableArray *dataArray;



@end
