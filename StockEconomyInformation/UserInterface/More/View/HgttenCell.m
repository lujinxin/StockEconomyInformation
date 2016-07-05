//
//  HgttenCell.m
//  StockEconomyInformation
//
//  Created by 陆金鑫 on 16/4/27.
//  Copyright © 2016年 陆金鑫. All rights reserved.
//

#import "HgttenCell.h"

@implementation HgttenCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
}


- (void) setHgttenModel:(HgttenModel *)hgttenModel {
    
    if (_hgttenModel != hgttenModel) {
        _hgttenModel = hgttenModel;
        
        _vc2marcodeLb.text = _hgttenModel.vc2marcode;
        _vc2marcodeLb.font = [UIFont fontWithName:@"Helvetica-Bold" size:21.0];
        
        _vc2nameLb.text = _hgttenModel.vc2name;
        _vc2nameLb.font = [UIFont fontWithName:@"Helvetica-Bold" size:21.0];
        
        _numorderLb.text = [NSString stringWithFormat:@"%.0f", [_hgttenModel.numorder floatValue]];
        _numcloseLb.text = [NSString stringWithFormat:@"%.2f", [_hgttenModel.numclose floatValue]];
        _numratioLb.text = [NSString stringWithFormat:@"%.2f%%", [_hgttenModel.numratio floatValue]];
        
        _numbmountLb.text = [NSString stringWithFormat:@"%d", [_hgttenModel.numbmount intValue]];
        _numsmountLb.text = [NSString stringWithFormat:@"%d", [_hgttenModel.numsmount intValue]];
        _numsummountLb.text = [NSString stringWithFormat:@"%d", [_hgttenModel.numsummount intValue]];
        
        
        _dattradeLb.text = [_hgttenModel.dattrade substringToIndex:10];
        
        
        
        
    }
    
    
    
    
    
    
    

}






- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
