//
//  NbjyCell.h
//  StockEconomyInformation
//
//  Created by 陆金鑫 on 16/4/24.
//  Copyright © 2016年 陆金鑫. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NbjyModel.h"


@interface NbjyCell : UITableViewCell

//股票代码 NSString
@property (weak, nonatomic) IBOutlet UILabel *stockcodeLb;
//股票名称 NSString
@property (weak, nonatomic) IBOutlet UILabel *stocknameLb;
//持股种类 NSString
@property (weak, nonatomic) IBOutlet UILabel *hldkindLb;
//变动类型 NSString
@property (weak, nonatomic) IBOutlet UILabel *changekindLb;
//变动股数 NSNumber
@property (weak, nonatomic) IBOutlet UILabel *changenumLb;
//成交均价(元) NSNumber
@property (weak, nonatomic) IBOutlet UILabel *priceLb;
//变动金额(万元) NSNumber
@property (weak, nonatomic) IBOutlet UILabel *changepriceLb;
//变动后持股数 NSString
@property (weak, nonatomic) IBOutlet UILabel *hldnumLb;
//变动原因 NSString
@property (weak, nonatomic) IBOutlet UILabel *reasonsLb;
//变动人 NSString
@property (weak, nonatomic) IBOutlet UILabel *changerLb;
//与董监高关系 NSString
@property (weak, nonatomic) IBOutlet UILabel *relationshipLb;
//董监高职务 NSString
@property (weak, nonatomic) IBOutlet UILabel *positionLb;
//交易日期 "2015-11-20 00:00:00" NSString
@property (weak, nonatomic) IBOutlet UILabel *tradedateLb;


@property (nonatomic) NbjyModel *nbjyModel;






@end
