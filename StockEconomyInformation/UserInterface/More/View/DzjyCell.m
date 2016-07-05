//
//  DzjyCell.m
//  StockEconomyInformation
//
//  Created by 陆金鑫 on 16/5/2.
//  Copyright © 2016年 陆金鑫. All rights reserved.
//

#import "DzjyCell.h"

@implementation DzjyCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
}


- (void) setDzjyModel:(DzjyModel *)dzjyModel {
    if (_dzjyModel != dzjyModel) {
        _dzjyModel = dzjyModel;
        
        _stockCodeLb.text = _dzjyModel.stockcode;
        _stockCodeLb.font = [UIFont fontWithName:@"Helvetica-Bold" size:21.0];
        
        _stockNameLb.text = _dzjyModel.stockname;
        _stockNameLb.font = [UIFont fontWithName:@"Helvetica-Bold" size:20.0];

        _stockTypeLb.text = _dzjyModel.stocktype;
        NSString *buyDepStr = [_dzjyModel.buyerdepartment stringByReplacingOccurrencesOfString:@"股份有限公司" withString:@""];
        buyDepStr = [buyDepStr stringByReplacingOccurrencesOfString:@"有限公司" withString:@""];
        buyDepStr = [buyDepStr stringByReplacingOccurrencesOfString:@"有限责任公司" withString:@""];
        buyDepStr = [buyDepStr stringByReplacingOccurrencesOfString:@"证券营业部" withString:@"营业部"];
        _buyerDepartmentLb.text = buyDepStr;
        
        NSString *sellDepStr = [_dzjyModel.sellerdepartment stringByReplacingOccurrencesOfString:@"股份有限公司" withString:@""];
        sellDepStr = [sellDepStr stringByReplacingOccurrencesOfString:@"有限公司" withString:@""];
        sellDepStr = [sellDepStr stringByReplacingOccurrencesOfString:@"有限责任公司" withString:@""];
        sellDepStr = [sellDepStr stringByReplacingOccurrencesOfString:@"证券营业部" withString:@"营业部"];
        _sellerDepartmentLb.text = sellDepStr;
        
        _priceLb.text = [NSString stringWithFormat:@"%.2f元", [_dzjyModel.price floatValue]];
        _buyerVolLb.text = [NSString stringWithFormat:@"%.2f万股", [_dzjyModel.buyervol floatValue]];
        _buyerApplyLb.text = [NSString stringWithFormat:@"%.2f万元", [_dzjyModel.buyerapply  floatValue]];
        _tradeDateLb.text = [_dzjyModel.trade_date substringToIndex:10];
        
    }
    
}






- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
