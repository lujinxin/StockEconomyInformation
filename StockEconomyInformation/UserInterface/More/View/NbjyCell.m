//
//  NbjyCell.m
//  StockEconomyInformation
//
//  Created by 陆金鑫 on 16/4/24.
//  Copyright © 2016年 陆金鑫. All rights reserved.
//

#import "NbjyCell.h"

@implementation NbjyCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
}


- (void)setNbjyModel:(NbjyModel *)nbjyModel {
    
    if (_nbjyModel != nbjyModel) {
        _nbjyModel = nbjyModel;
        
        _stockcodeLb.text = _nbjyModel.stockcode;
        _stockcodeLb.font = [UIFont fontWithName:@"Helvetica-Bold" size:21.0];
        
        _stocknameLb.text = _nbjyModel.stockname;
        _stocknameLb.font = [UIFont fontWithName:@"Helvetica-Bold" size:20.0];
        
        _hldkindLb.text = _nbjyModel.hldkind;
        
        _changekindLb.text = _nbjyModel.changekind;
        
        if ([_nbjyModel.changenum intValue] == 0) {
            _changenumLb.text = @"未知";
        } else {
            _changenumLb.text = [NSString stringWithFormat:@"%d", [_nbjyModel.changenum intValue]];
        }
        
        
        _priceLb.text = [NSString stringWithFormat:@"%.2f", [_nbjyModel.price floatValue]];
        
        _changepriceLb.text = [NSString stringWithFormat:@"%.2f万", [_nbjyModel.changeprice floatValue]];
        
        _hldnumLb.text = _nbjyModel.hldnum;
        
        if ((_nbjyModel.reasons != nil) || (_nbjyModel.reasons.length == 0)) {
            _reasonsLb.text = _nbjyModel.reasons;
        } else {
            _reasonsLb.text = @"未知";
        }
        
        
        _changerLb.text = _nbjyModel.changer;
        _relationshipLb.text = _nbjyModel.relationship;
        _positionLb.text = _nbjyModel.position;
        
        
        _tradedateLb.text = [_nbjyModel.trade_date substringToIndex:10];
        
        
    }
    
    
    
    
    
}




- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
