//
//  HgttenModel.h
//  StockEconomyInformation
//
//  Created by 陆金鑫 on 16/4/27.
//  Copyright © 2016年 陆金鑫. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HgttenModel : NSObject

@property (nonatomic, copy) NSString *vc2marcode;   //股票代码 NSString
@property (nonatomic, copy) NSString *vc2name;      //股票名称 NSString
@property (nonatomic, retain) NSNumber *numorder;     //当日排名 NSString
@property (nonatomic, retain) NSNumber *numclose;     //收盘价 NSString
@property (nonatomic, retain) NSNumber *numratio;     //当日涨幅 NSString
@property (nonatomic, retain) NSNumber *numbmount;    //买入量 NSNumber
@property (nonatomic, retain) NSNumber *numsmount;    //卖出量 NSNumber
@property (nonatomic, retain) NSNumber *numsummount;  //总成交量 NSNumber
@property (nonatomic, copy) NSString *dattrade;     //日期 NSString "2015-12-04 00:00:00"

@end
