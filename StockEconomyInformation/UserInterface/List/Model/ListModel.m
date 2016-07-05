//
//  ListModel.m
//  StockEconomyInformation
//
//  Created by 陆金鑫 on 16/4/27.
//  Copyright © 2016年 陆金鑫. All rights reserved.
//

#import "ListModel.h"

@implementation ListModel

/*
 
 @property (nonatomic,copy)NSString *code;
 @property (nonatomic,copy)NSString *name;
 @property (nonatomic,assign)NSNumber *trade;
 @property (nonatomic,assign)NSNumber *pricechange;
 @property (nonatomic,assign)NSNumber *changepercent;
 ------------------------------------------------------------------------------
 沪市数据                                   不需要改
 http://web.juhe.cn:8080/finance/stock/shall
 amount = 161886685;
 buy = "6.630";
 ---->                                   changepercent = "-1.192";涨跌幅
 -->code = 600026; 代码
 high = "6.740";
 low = "6.530";
                                            name = "\U4e2d\U6d77\U53d1\U5c55";名称
 open = "6.710";
                                            pricechange = "-0.080";涨跌额
 sell = "6.640";
 settlement = "6.710";
                                            symbol = sh600026;代码
 ticktime = "15:00:00";
 ---->                                       trade = "6.630";最新价
 volume = 244383;
 ------------------------------------------------------------------------------
 深圳股市                                   不需要改
 http://web.juhe.cn:8080/finance/stock/szall
 "data": [
 {
                                            "symbol": "sz300001",/代码*
                                            "name": "特锐德",*名称*
                                            "trade": "20.450",*最新价*
                                            "pricechange": "0.060",*涨跌额*
                                            "changepercent": "0.294",/涨跌幅*
"buy": "20.440",*买入*
"sell": "20.450",*卖出*
"settlement": "20.390",/昨收*
"open": "21.010",*今开*
"high": "21.040",*最高*
"low": "19.610",/最低*
"volume": 71773,成交量*
"amount": 146356152,成交额
"ticktime": "10:41:25",时间
 ------------------------------------------------------------------------------
 香港数据                                        改1个
 http://web.juhe.cn:8080/finance/stock/hkall
 
 "data": [
 {
                                                "symbol": "00001",代码
                                                "name": "长和",名称
 "engname": "CHEUNG KONG",
 "tradetype": "EQTY",
                                                "lasttrade": "94.550",最新价
 "prevclose": "95.400",
 "open": "95.000",
 "high": "96.150",
 "low": "94.400",
 "volume": "7212055",
 "currentvolume": "500",
 "amount": "684287949",
 "ticktime": "2016-04-27 16:01:04",
 "buy": "94.550",
 "sell": "94.600",
 "high_52week": "174.900",
 "low_52week": "91.800",
"eps": "30.720",
"dividend": "2.550",
 "stocks_sum": "3859678500",
                                                 "pricechange": "-0.850",涨跌额
                                                 "changepercent": "-0.8909853"涨跌幅
 ------------------------------------------------------------------------------
 美国股市                                              改5个
 http://web.juhe.cn:8080/finance/stock/usaall
 
                                                    "cname": "埃尼石油公司",
 "category": "",
                                                    "symbol": "E",代码
                                                    "price": "32.48",最新价
                                                    "diff": "0.32",涨跌额
                                                    "chg": "1.00",涨跌幅
 "preclose": "32.16",
 "open": "32.31",
 "high": "32.50",
 "low": "32.31",
 "amplitude": "0.59%",
 "volume": "41749",
 "mktcap": "5788799972534",
 "market": "NYSE"
 
 
 */

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    
    if ([key isEqualToString:@"lasttrade"]) {
        _trade = (NSNumber *)value;
    }
    
    if ([key isEqualToString:@"cname"]) {
        _name = (NSString *)value;
    }
    
    if ([key isEqualToString:@"price"]) {
        _trade = (NSNumber *)value;
    }
    
    if ([key isEqualToString:@"diff"]) {
        _pricechange = (NSNumber *)value;
    }
    
    if ([key isEqualToString:@"chg"]) {
        _changepercent = (NSNumber *)value;
    }
    
    
    
    
}




@end
