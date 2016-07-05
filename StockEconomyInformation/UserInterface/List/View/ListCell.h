//
//  ListCell.h
//  StockEconomyInformation
//
//  Created by 陆金鑫 on 16/4/27.
//  Copyright © 2016年 陆金鑫. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ListModel.h"

@interface ListCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *stockNameLb;
@property (weak, nonatomic) IBOutlet UILabel *stockCodeLb;
@property (weak, nonatomic) IBOutlet UILabel *stockCurrentPriceLb;
@property (weak, nonatomic) IBOutlet UILabel *stockChangePriceLb;
@property (weak, nonatomic) IBOutlet UILabel *stockChangePercentLb;

@property (nonatomic) ListModel *listModel;





@end
