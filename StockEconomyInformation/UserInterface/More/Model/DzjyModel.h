//
//  DzjyModel.h
//  StockEconomyInformation
//
//  Created by 陆金鑫 on 16/5/2.
//  Copyright © 2016年 陆金鑫. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DzjyModel : NSObject

/**
 {
 "total": 84,
 "success": true,
 "info": "",
 "rows": [
 {
 "trade_date": "2016-04-27 00:00:00",
 "stockcode": "002208",
 "stockname": "合肥城建",
 "price": 24.63,
 "buyervol": 100.0,
 "buyerapply": 2463.0,
 "buyerdepartment": "华泰证券股份有限公司深圳竹子林四路证券营业部",
 "sellerdepartment": "国元证券股份有限公司合肥桐城路证券营业部",
 "stocktype": "A股"
 },
 
 */

@property (nonatomic, copy) NSString *trade_date;
@property (nonatomic, copy) NSString *stockcode;
@property (nonatomic, copy) NSString *stockname;
@property (nonatomic, retain) NSNumber *price;          //成交价格(元)
@property (nonatomic, retain) NSNumber *buyervol;       //成交量(万股)
@property (nonatomic,retain) NSNumber *buyerapply;      //成交金额(万元)
@property (nonatomic, copy) NSString *buyerdepartment;  //买方营业部
@property (nonatomic, copy) NSString *sellerdepartment;  //卖方营业部
@property (nonatomic, copy) NSString *stocktype;         //证券类型





@end
