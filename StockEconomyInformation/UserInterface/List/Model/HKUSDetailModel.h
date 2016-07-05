//
//  HKUSDetailModel.h
//  StockEconomyInformation
//
//  Created by 陆金鑫 on 16/5/2.
//  Copyright © 2016年 陆金鑫. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HKUSDetailModel : NSObject

/**
 *
 {
 "reason": "查询成功",
 "result": {
 "title": "阿里巴巴[BABA]_美股实时行情_新浪财经",
 "url": "http://j.www.haosou.com/?u=http%3A%2F%2Fstock.finance.sina.com.cn%2Fusstock%2Fquotes%2FBABA.html&m=b5824b&from=juhe&type=usstock_sina&juid=JHa807697e263fc6d191811db8f8abb92c",
 "urlWap": "http://j.www.haosou.com/?u=http%3A%2F%2Fstocks.sina.cn%2Fus%2F%3Fvt%3D4%26code%3DBABA&m=c279aa&from=juhe&type=usstock_sina&juid=JHa807697e263fc6d191811db8f8abb92c",
 "stockNum": "BABA",
 
 
 
 */

@property (nonatomic, copy) NSString *url;
@property (nonatomic, copy) NSString *urlWap;
@property (nonatomic, copy) NSString *stockNum;





@end
