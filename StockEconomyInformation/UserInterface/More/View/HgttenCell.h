//
//  HgttenCell.h
//  StockEconomyInformation
//
//  Created by 陆金鑫 on 16/4/27.
//  Copyright © 2016年 陆金鑫. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HgttenModel.h"


@interface HgttenCell : UITableViewCell

//股票代码 NSString
@property (weak, nonatomic) IBOutlet UILabel *vc2marcodeLb;
//股票名称 NSString
@property (weak, nonatomic) IBOutlet UILabel *vc2nameLb;
//当日排名 NSString
@property (weak, nonatomic) IBOutlet UILabel *numorderLb;
//收盘价 NSNumber
@property (weak, nonatomic) IBOutlet UILabel *numcloseLb;
//当日涨幅 NSString
@property (weak, nonatomic) IBOutlet UILabel *numratioLb;
//买入量 NSNumber
@property (weak, nonatomic) IBOutlet UILabel *numbmountLb;
//卖出量 NSNumber
@property (weak, nonatomic) IBOutlet UILabel *numsmountLb;
//总成交量 NSNumber
@property (weak, nonatomic) IBOutlet UILabel *numsummountLb;
//日期 NSString
@property (weak, nonatomic) IBOutlet UILabel *dattradeLb;


@property (nonatomic) HgttenModel *hgttenModel;

@end
