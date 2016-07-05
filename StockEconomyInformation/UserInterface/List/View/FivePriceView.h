//
//  FivePriceView.h
//  StockEconomyInformation
//
//  Created by 陆金鑫 on 16/2/24.
//  Copyright © 2016年 陆金鑫. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StockDetailModel.h"


@interface FivePriceView : UIView

/*
 @property (nonatomic)NSNumber *buyOne;
 @property (nonatomic)NSNumber *buyOnePri;
 @property (nonatomic)NSNumber *buyTwo;
 @property (nonatomic)NSNumber *buyTwoPri;
 @property (nonatomic)NSNumber *buyThree;
 @property (nonatomic)NSNumber *buyThreePri;
 @property (nonatomic)NSNumber *buyFour;
 @property (nonatomic)NSNumber *buyFourPri;
 @property (nonatomic)NSNumber *buyFive;
 @property (nonatomic)NSNumber *buyFivePri;
 
 @property (nonatomic)NSNumber *sellOne;
 @property (nonatomic)NSNumber *sellOnePri;
 @property (nonatomic)NSNumber *sellTwo;
 @property (nonatomic)NSNumber *sellTwoPri;
 @property (nonatomic)NSNumber *sellThree;
 @property (nonatomic)NSNumber *sellThreePr;
 @property (nonatomic)NSNumber *sellFour;
 @property (nonatomic)NSNumber *sellFourPri;
 @property (nonatomic)NSNumber *sellFive;
 @property (nonatomic)NSNumber *sellFivePri;

 */
@property (weak, nonatomic) IBOutlet UILabel *buyOnePriLabel;
@property (weak, nonatomic) IBOutlet UILabel *buyOneLabel;
@property (weak, nonatomic) IBOutlet UILabel *buyTwoPriLabel;
@property (weak, nonatomic) IBOutlet UILabel *buyTwoLabel;
@property (weak, nonatomic) IBOutlet UILabel *buyThreePriLabel;
@property (weak, nonatomic) IBOutlet UILabel *buyThreeLabel;
@property (weak, nonatomic) IBOutlet UILabel *buyFourPriLabel;
@property (weak, nonatomic) IBOutlet UILabel *buyFourLabel;
@property (weak, nonatomic) IBOutlet UILabel *buyFivePriLabel;
@property (weak, nonatomic) IBOutlet UILabel *buyFiveLabel;

@property (weak, nonatomic) IBOutlet UILabel *sellOnePriLabel;
@property (weak, nonatomic) IBOutlet UILabel *sellOneLabel;
@property (weak, nonatomic) IBOutlet UILabel *sellTwoPriLabel;
@property (weak, nonatomic) IBOutlet UILabel *sellTwoLabel;
@property (weak, nonatomic) IBOutlet UILabel *sellThreePriLabel;
@property (weak, nonatomic) IBOutlet UILabel *sellThreeLabel;
@property (weak, nonatomic) IBOutlet UILabel *sellFourPriLabel;
@property (weak, nonatomic) IBOutlet UILabel *sellFourLabel;
@property (weak, nonatomic) IBOutlet UILabel *sellFivePriLabel;
@property (weak, nonatomic) IBOutlet UILabel *sellFiveLabel;


/**
 @property (nonatomic, copy) NSString *gid;       //股票编号："sh601009"
 @property (nonatomic, copy) NSString *name;      //股票名称："南京银行"
 @property (nonatomic) NSNumber *todayStartPri;   //今日开盘价       !
 @property (nonatomic) NSNumber *yestodEndPri;    //昨日收盘价       !
 @property (nonatomic) NSNumber *nowPri;          //当前价格        !
 @property (nonatomic) NSNumber *todayMax;        //今日最高价       !
 @property (nonatomic) NSNumber *todayMin;        //今日最低价       !
 
 @property (nonatomic) NSNumber *increPri;          //涨幅        !
 @property (nonatomic) NSNumber *increase;          //涨跌        !
 
 //以下数据如有0值，说明即将或已经涨停或跌停，则用--代替
 @property (nonatomic) NSNumber *traNumber;       //成交量         !
 @property (nonatomic) NSNumber *traAmount;       //成交金额        !
 
 @property (nonatomic, copy) NSString *date;      //日期
 @property (nonatomic, copy) NSString *time;      //时间
 
 @property (nonatomic) NSNumber *dot;        //大盘当前点数："8.37"
 @property (nonatomic) NSNumber *nowPic;     //大盘当前价格："0.11"
 @property (nonatomic) NSNumber *rate;       //大盘涨跌率："1.33"
 */

@property (weak, nonatomic) IBOutlet UILabel *nowPriLb;

@property (weak, nonatomic) IBOutlet UILabel *todayStartPriLb;

@property (weak, nonatomic) IBOutlet UILabel *yestodEndPriLb;

@property (weak, nonatomic) IBOutlet UILabel *increPriLb;

@property (weak, nonatomic) IBOutlet UILabel *increaseLb;


@property (weak, nonatomic) IBOutlet UILabel *todayMaxLb;

@property (weak, nonatomic) IBOutlet UILabel *todayMinLb;

@property (weak, nonatomic) IBOutlet UILabel *traNumberLb;

@property (weak, nonatomic) IBOutlet UILabel *traAmountLb;

@property (weak, nonatomic) IBOutlet UIImageView *upDownImage1;

@property (weak, nonatomic) IBOutlet UIImageView *upDownImage2;


@property (nonatomic, strong) StockDetailModel *stockDetailModel;

@property (nonatomic) NSArray *datas;



@end
