//
//  NewsListModel.h
//  StockEconomyInformation
//
//  Created by 陆金鑫 on 16/4/19.
//  Copyright © 2016年 陆金鑫. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NewsListModel : NSObject

/**
 *  "list": [
 {
 "title": "融慧财经:中国铁建今年新合同乐观",
 "time": "2016-04-19 16:57:13",
 "src": "新浪",
 "category": "",
 "pic": "http://api.jisuapi.com/news/upload/20160419/172006_69249.png",
 "url": "http://m.news.so.com/transcode?ofmt=html&src=srp&q=%E7%90%86%E8%B4%A2&pn=1&pos=2&m=89235a01f1a96667559f8e09f10b975cc0df5b2c&u=http%3A%2F%2Ffinance.sina.com.cn%2Fstock%2Fhkstock%2Fggscyd%2F2016-04-19%2Fdoc-ifxriqqx3049759.shtml",
 "weburl": "http://finance.sina.com.cn/stock/hkstock/ggscyd/2016-04-19/doc-ifxriqqx3049759.shtml",
 "content": "<p>国家统计局早前公布，今年中国首季GDP按年增长6.7%，符合市场预期，基础建设与房地产投资为主要的增长动力。同时目前持续推行宽松货币政策，由去年年底开始鼓励信贷投入，承建商资金到位后，则有利基建股获得新合约工程项目。</p><p class=\"header\">对于目前基建股有三大业务亮点:</p><p>第一是基建业行业的新合同增长理想。中铁建(HK.1186)今年首季度新签合同1792亿元人民币，按年增长16%，合同增长领域主要为铁路建设与房地产;中铁(HK.390)今年首季新签订合同也有良好表现，新签订合同金额为1892亿元人民币，按年增加21%。增长业务来源与中铁建相似。</p><p>第二个关注点是，中铁建与中铁均上调今年全年新合同增长目标，外资投行摩根士丹利发表报告指出，中铁管理层表示今年哟信心新合同将会超过一万亿元人民币，对比早前公布8500亿元人民币的目标增加18%。</p><p>第三，去年第四季度以及今年首季，中铁建的铁路工程承包新合同分别同比增加95%及46%;中铁的铁路基建建设合同分别增加49%及93%，意味着铁路项目会加快推进。外资投行瑞银预测今年铁路投资，有望超出预期目标5%达到8400亿元人民币。基建铁路股当中，中国中铁被市场</p><p><img src=\"http://api.jisuapi.com/news/upload/20160419/172006_69249.png\"></p>"
 }
 */


@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *time;
@property (nonatomic, copy) NSString *src;
@property (nonatomic, copy) NSString *pic;
@property (nonatomic, copy) NSString *url;






@end
