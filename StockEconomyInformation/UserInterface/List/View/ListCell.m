//
//  ListCell.m
//  StockEconomyInformation
//
//  Created by 陆金鑫 on 16/4/27.
//  Copyright © 2016年 陆金鑫. All rights reserved.
//

#import "ListCell.h"

@implementation ListCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setListModel:(ListModel *)listModel {
    
    if (_listModel != listModel) {
        _listModel = listModel;
        
        _stockNameLb.text = _listModel.name;
        _stockCodeLb.text = _listModel.symbol;
        _stockCurrentPriceLb.text = [NSString stringWithFormat:@"%.2f", [_listModel.trade floatValue]];//现价
        _stockChangePriceLb.text = [NSString stringWithFormat:@"%.2f", [_listModel.pricechange floatValue]];//涨跌
        _stockChangePercentLb.text = [NSString stringWithFormat:@"%.2f%%", [_listModel.changepercent floatValue]];//涨幅
        
        if ([_listModel.pricechange doubleValue] >= 0) {
            _stockNameLb.textColor = [UIColor redColor];
            _stockCodeLb.textColor = [UIColor redColor];
            _stockCurrentPriceLb.textColor = [UIColor redColor];
            _stockChangePriceLb.textColor = [UIColor redColor];
            _stockChangePercentLb.textColor = [UIColor redColor];
        } else if ([_listModel.pricechange doubleValue] < 0) {
            _stockNameLb.textColor = [UIColor greenColor];
            _stockCodeLb.textColor = [UIColor greenColor];
            _stockCurrentPriceLb.textColor = [UIColor greenColor];
            _stockChangePriceLb.textColor = [UIColor greenColor];
            _stockChangePercentLb.textColor = [UIColor greenColor];
            
        }

    }
    
    
}














- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
