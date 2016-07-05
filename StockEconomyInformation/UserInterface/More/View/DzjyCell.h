//
//  DzjyCell.h
//  StockEconomyInformation
//
//  Created by 陆金鑫 on 16/5/2.
//  Copyright © 2016年 陆金鑫. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DzjyModel.h"

@interface DzjyCell : UITableViewCell

/**
 trade_dateLb
 stockCodeLb
 stockNameLb
 priceLb
 buyerVolLb
 buyerApplyLb
 buyerDepartmentLb
 sellerDepartmentLb
 stockTypeLb
 */

@property (weak, nonatomic) IBOutlet UILabel *stockCodeLb;
@property (weak, nonatomic) IBOutlet UILabel *stockNameLb;
@property (weak, nonatomic) IBOutlet UILabel *stockTypeLb;
@property (weak, nonatomic) IBOutlet UILabel *tradeDateLb;

@property (weak, nonatomic) IBOutlet UILabel *buyerDepartmentLb;
@property (weak, nonatomic) IBOutlet UILabel *sellerDepartmentLb;

@property (weak, nonatomic) IBOutlet UILabel *priceLb;
@property (weak, nonatomic) IBOutlet UILabel *buyerVolLb;
@property (weak, nonatomic) IBOutlet UILabel *buyerApplyLb;

@property (nonatomic) DzjyModel *dzjyModel;



@end
