//
//  NbjyModel.h
//  StockEconomyInformation
//
//  Created by 陆金鑫 on 16/4/25.
//  Copyright © 2016年 陆金鑫. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NbjyModel : NSObject

/**
 *  
 //股票代码 NSString
 @property (weak, nonatomic) IBOutlet UILabel *stockcodeLb;
 //股票名称 NSString
 @property (weak, nonatomic) IBOutlet UILabel *stocknameLb;
 //持股种类 NSString
 @property (weak, nonatomic) IBOutlet UILabel *hldkindLb;
 //变动类型 NSString
 @property (weak, nonatomic) IBOutlet UILabel *changekindLb;
 //变动股数 NSNumber
 @property (weak, nonatomic) IBOutlet UILabel *changenumLb;
 //成交均价(元) NSNumber
 @property (weak, nonatomic) IBOutlet UILabel *priceLb;
 //变动金额(万元) NSNumber
 @property (weak, nonatomic) IBOutlet UILabel *changepriceLb;
 //变动后持股数 NSNumber
 @property (weak, nonatomic) IBOutlet UILabel *hldnumLb;
 //变动原因 NSString
 @property (weak, nonatomic) IBOutlet UILabel *reasonsLb;
 //变动人 NSString
 @property (weak, nonatomic) IBOutlet UILabel *changerLb;
 //与董监高关系 NSString
 @property (weak, nonatomic) IBOutlet UILabel *relationshipLb;
 //董监高职务 NSString
 @property (weak, nonatomic) IBOutlet UILabel *positionLb;
 //交易日期 "2015-11-20 00:00:00" NSString
 @property (weak, nonatomic) IBOutlet UILabel *tradedateLb;

 */

@property (nonatomic, copy) NSString *stockcode;        //股票代码 NSString
@property (nonatomic, copy) NSString *stockname;        //股票名称 NSString
@property (nonatomic, copy) NSString *hldkind;          //持股种类 NSString
@property (nonatomic, copy) NSString *changekind;       //变动类型 NSString
@property (nonatomic, retain) NSNumber *changenum;      //变动股数 NSNumber
@property (nonatomic, retain) NSNumber *price;          //成交均价(元) NSNumber
@property (nonatomic, retain) NSNumber *changeprice;    //变动金额(万元) NSNumber
@property (nonatomic, copy) NSString *hldnum;           //变动后持股数 NSString
@property (nonatomic, copy) NSString *reasons;          //变动原因 NSString
@property (nonatomic, copy) NSString *changer;          //变动人 NSString
@property (nonatomic, copy) NSString *relationship;     //与董监高关系 NSString
@property (nonatomic, copy) NSString *position;         //董监高职务 NSString
@property (nonatomic, copy) NSString *trade_date;       //交易日期 "2015-11-20 00:00:00" NSString











@end
