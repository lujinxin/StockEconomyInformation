//
//  FivePriceView.m
//  StockEconomyInformation
//
//  Created by 陆金鑫 on 16/2/24.
//  Copyright © 2016年 陆金鑫. All rights reserved.
//

#import "FivePriceView.h"

@implementation FivePriceView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)setStockDetailModel:(StockDetailModel *)stockDetailModel {
    if (_stockDetailModel != stockDetailModel) {
        _stockDetailModel = stockDetailModel;
        
        _buyOnePriLabel.text = [NSString stringWithFormat:@"%.2f", [_stockDetailModel.buyOnePri doubleValue]];
        _buyTwoPriLabel.text = [NSString stringWithFormat:@"%.2f", [_stockDetailModel.buyTwoPri doubleValue]];
        _buyThreePriLabel.text = [NSString stringWithFormat:@"%.2f", [_stockDetailModel.buyThreePri doubleValue]];
        _buyFourPriLabel.text = [NSString stringWithFormat:@"%.2f", [_stockDetailModel.buyFourPri doubleValue]];
        _buyFivePriLabel.text = [NSString stringWithFormat:@"%.2f", [_stockDetailModel.buyFivePri doubleValue]];
        _buyOneLabel.text = [NSString stringWithFormat:@"%ld", [_stockDetailModel.buyOne integerValue]/100];
        _buyTwoLabel.text = [NSString stringWithFormat:@"%ld", [_stockDetailModel.buyTwo integerValue]/100];
        _buyThreeLabel.text = [NSString stringWithFormat:@"%ld", [_stockDetailModel.buyThree integerValue]/100];
        _buyFourLabel.text = [NSString stringWithFormat:@"%ld", [_stockDetailModel.buyFour integerValue]/100];
        _buyFiveLabel.text = [NSString stringWithFormat:@"%ld", [_stockDetailModel.buyFive integerValue]/100];
        
        _sellOnePriLabel.text = [NSString stringWithFormat:@"%.2f", [_stockDetailModel.sellOnePri doubleValue]];
        _sellTwoPriLabel.text = [NSString stringWithFormat:@"%.2f", [_stockDetailModel.sellTwoPri doubleValue]];
        _sellThreePriLabel.text = [NSString stringWithFormat:@"%.2f", [_stockDetailModel.sellThreePri doubleValue]];
        _sellFourPriLabel.text = [NSString stringWithFormat:@"%.2f", [_stockDetailModel.sellFourPri doubleValue]];
        _sellFivePriLabel.text = [NSString stringWithFormat:@"%.2f", [_stockDetailModel.sellFivePri doubleValue]];
        _sellOneLabel.text = [NSString stringWithFormat:@"%ld", [_stockDetailModel.sellOne integerValue]/100];
        _sellTwoLabel.text = [NSString stringWithFormat:@"%ld", [_stockDetailModel.sellTwo integerValue]/100];
        _sellThreeLabel.text = [NSString stringWithFormat:@"%ld", [_stockDetailModel.sellThree integerValue]/100];
        _sellFourLabel.text = [NSString stringWithFormat:@"%ld", [_stockDetailModel.sellFour integerValue]/100];
        _sellFiveLabel.text = [NSString stringWithFormat:@"%ld", [_stockDetailModel.sellFive integerValue]/100];
        
        _buyOnePriLabel.textColor = [UIColor redColor];
        _buyTwoPriLabel.textColor = [UIColor redColor];
        _buyThreePriLabel.textColor = [UIColor redColor];
        _buyFourPriLabel.textColor = [UIColor redColor];
        _buyFivePriLabel.textColor = [UIColor redColor];
        _buyOneLabel.textColor = [UIColor redColor];
        _buyTwoLabel.textColor = [UIColor redColor];
        _buyThreeLabel.textColor = [UIColor redColor];
        _buyFourLabel.textColor = [UIColor redColor];
        _buyFiveLabel.textColor = [UIColor redColor];

        _sellOnePriLabel.textColor = [UIColor greenColor];
        _sellTwoPriLabel.textColor = [UIColor greenColor];
        _sellThreePriLabel.textColor = [UIColor greenColor];
        _sellFourPriLabel.textColor = [UIColor greenColor];
        _sellFivePriLabel.textColor = [UIColor greenColor];
        _sellOneLabel.textColor = [UIColor greenColor];
        _sellTwoLabel.textColor = [UIColor greenColor];
        _sellThreeLabel.textColor = [UIColor greenColor];
        _sellFourLabel.textColor = [UIColor greenColor];
        _sellFiveLabel.textColor = [UIColor greenColor];

        
        
        _nowPriLb.text = [NSString stringWithFormat:@"%.2f", [stockDetailModel.nowPri floatValue]];
        if ([stockDetailModel.increPri floatValue] >= 0.0) {
            _nowPriLb.textColor = [UIColor redColor];
            _upDownImage1.image = [UIImage imageNamed:@"up"];
            _upDownImage2.image = [UIImage imageNamed:@"up"];
        } else {
            _nowPriLb.textColor = [UIColor greenColor];
            _upDownImage1.image = [UIImage imageNamed:@"down"];
            _upDownImage2.image = [UIImage imageNamed:@"down"];
        }
        _todayStartPriLb.text = [NSString stringWithFormat:@"%.2f", [stockDetailModel.todayStartPri  floatValue]];
        _yestodEndPriLb.text = [NSString stringWithFormat:@"%.2f", [stockDetailModel.yestodEndPri floatValue]];
        
        
        //涨幅，被替换了
        _increaseLb.text = [NSString stringWithFormat:@"%.2f%%", [stockDetailModel.increase floatValue]];
        
        //涨跌，被替换了
        _increPriLb.text = [NSString stringWithFormat:@"%.2f", [stockDetailModel.increPri floatValue]];
        
        _todayMaxLb.text = [NSString stringWithFormat:@"%.2f", [stockDetailModel.todayMax floatValue]];
        _todayMinLb.text = [NSString stringWithFormat:@"%.2f", [stockDetailModel.todayMin floatValue]];
        _traNumberLb.text = [NSString stringWithFormat:@"%ld", [stockDetailModel.traNumber integerValue]];
        _traAmountLb.text = [NSString stringWithFormat:@"%.2f亿", [stockDetailModel.traAmount floatValue]/10000];
        
        

        
    }

//    [self setNeedsLayout];
    
}

//- (void)layoutSubviews {
//    
//    [super layoutSubviews];
//    
//    self.buyOnePriLabel.text = self.stockDetailModel.buyOnePri;
//}


- (void)setDatas:(NSArray *)datas {
    if (_datas != datas) {
        _datas = datas;
        //这个数组里面只有这一个model
        self.stockDetailModel = [_datas lastObject];
//        self.stockDetailModel = [_datas firstObject];
        NSLog(@"_datas:%@", _datas);
    }
}








@end
