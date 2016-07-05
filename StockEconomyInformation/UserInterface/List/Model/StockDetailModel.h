//
//  StockDetailModel.h
//  StockEconomyInformation
//
//  Created by 陆金鑫 on 16/2/22.
//  Copyright © 2016年 陆金鑫. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StockDetailModel : NSObject

/**
 
 {
 "resultcode": "200",
 "reason": "SUCCESSED!",
 "result": [
 {
 "data": {
 "buyFive": "1100",
 "buyFivePri": "16.760",
 "buyFour": "400",
 "buyFourPri": "16.770",
 "buyOne": "2500",
 "buyOnePri": "16.820",
 "buyThree": "3600",
 "buyThreePri": "16.790",
 "buyTwo": "12300",
 "buyTwoPri": "16.800",
 "competitivePri": "16.820",
 "date": "2016-04-29",
 "gid": "sh601009",
 "increPer": "-0.65",
 "increase": "-0.110",
 "name": "南京银行",
 "nowPri": "16.810",
 "reservePri": "16.830",
 "sellFive": "3800",
 "sellFivePri": "16.870",
 "sellFour": "1300",
 "sellFourPri": "16.860",
 "sellOne": "37000",
 "sellOnePri": "16.830",
 "sellThree": "2100",
 "sellThreePri": "16.850",
 "sellTwo": "216100",
 "sellTwoPri": "16.840",
 "time": "15:00:00",
 "todayMax": "17.100",
 "todayMin": "16.690",
 "todayStartPri": "16.810",
 "traAmount": "480039789.000",
 "traNumber": "282983",
 "yestodEndPri": "16.920"
 },
 "dapandata": {
 "dot": "16.810",
 "name": "南京银行",
 "nowPic": "-0.110",
 "rate": "-0.65",
 "traAmount": "48004",
 "traNumber": "282983"
 },
 "gopicture": {
 "minurl": "http://image.sinajs.cn/newchart/min/n/sh601009.gif",
 "dayurl": "http://image.sinajs.cn/newchart/daily/n/sh601009.gif",
 "weekurl": "http://image.sinajs.cn/newchart/weekly/n/sh601009.gif",
 "monthurl": "http://image.sinajs.cn/newchart/monthly/n/sh601009.gif"
 }
 }
 ],
 "error_code": 0
 }
 
 */

@property (nonatomic, copy) NSString *gid;       //股票编号："sh601009"
@property (nonatomic, copy) NSString *name;      //股票名称："南京银行"
@property (nonatomic) NSNumber *todayStartPri;   //今日开盘价
@property (nonatomic) NSNumber *yestodEndPri;    //昨日收盘价
@property (nonatomic) NSNumber *nowPri;          //当前价格
@property (nonatomic) NSNumber *todayMax;        //今日最高价
@property (nonatomic) NSNumber *todayMin;        //今日最低价

@property (nonatomic) NSNumber *traNumber;       //成交量
@property (nonatomic) NSNumber *traAmount;       //成交金额

@property (nonatomic) NSNumber *buyOne;
@property (nonatomic) NSNumber *buyOnePri;
@property (nonatomic) NSNumber *buyTwo;
@property (nonatomic) NSNumber *buyTwoPri;
@property (nonatomic) NSNumber *buyThree;
@property (nonatomic) NSNumber *buyThreePri;
@property (nonatomic) NSNumber *buyFour;
@property (nonatomic) NSNumber *buyFourPri;
@property (nonatomic) NSNumber *buyFive;
@property (nonatomic) NSNumber *buyFivePri;

@property (nonatomic) NSNumber *sellOne;
@property (nonatomic) NSNumber *sellOnePri;
@property (nonatomic) NSNumber *sellTwo;
@property (nonatomic) NSNumber *sellTwoPri;
@property (nonatomic) NSNumber *sellThree;
@property (nonatomic) NSNumber *sellThreePri;
@property (nonatomic) NSNumber *sellFour;
@property (nonatomic) NSNumber *sellFourPri;
@property (nonatomic) NSNumber *sellFive;
@property (nonatomic) NSNumber *sellFivePri;


@property (nonatomic) NSNumber *increPri;
@property (nonatomic) NSNumber *increase;


@property (nonatomic, copy) NSString *date;
@property (nonatomic, copy) NSString *time;

@property (nonatomic) NSNumber *dot;        //大盘当前点数："8.37"
@property (nonatomic) NSNumber *nowPic;     //大盘当前价格："0.11"
@property (nonatomic) NSNumber *rate;       //大盘涨跌率："1.33"

@property (nonatomic, copy) NSString *minurl;
//分时K线图："http://image.sinajs.cn/newchart/min/n/sh601009.gif"
@property (nonatomic, copy) NSString *dayurl;
@property (nonatomic, copy) NSString *weekurl;
@property (nonatomic, copy) NSString *monthurl;


@end
