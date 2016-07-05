//
//  HomeViewController.m
//  StockEconomyInformation
//
//  Created by 陆金鑫 on 16/1/8.
//  Copyright © 2016年 陆金鑫. All rights reserved.
//

#import "HomeViewController.h"
#import "AFNetworking.h"

#define ViewWidth [UIScreen mainScreen].bounds.size.width/2.0
#define ViewHeight ([UIScreen mainScreen].bounds.size.height-64-49)/3.0
#define LabelWidth ([UIScreen mainScreen].bounds.size.width/2.0-10)/2.0
#define LabelHeight 25

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"首页";
    [self.navigationController.navigationBar setTitleTextAttributes:@{ NSFontAttributeName:[UIFont systemFontOfSize:19.0], NSForegroundColorAttributeName:[UIColor whiteColor]
                                                                       }];
    
    [self createSHView];
    [self createSZView];
    [self createDJIView];
    [self createIXICView];
    [self createINXView];
    [self createHSIView];
    
}

/**数据实例：
1   {
     "errNum": 0,
     "errMsg": "success",
     "retData": 
2         { "stockinfo": [{
                 "name": "青岛啤酒",
                 "code": "00168",
                 "date": "2016/04/08 16:01",
                 "openningPrice": 26.85,
                 "closingPrice": 26.6,
                 "hPrice": 27,
                 "lPrice": 26.1,
                 "currentPrice": 26.95,
                 "growth": 0.35,
                 "growthPercent": 1.316,
                 "dealnumber": 2259440,
                 "turnover": 59950822,
                 "52hPrice": 57.8,
                 "52lPrice": 26.6 }],
         "market": 
3                 {
                 "shanghai":
4                        {
                         "name": "上证指数",
                         "curdot": 2984.9582,
                         "curprice": -23.4618,
                         "rate": -0.78,
                         "dealnumber": 1879046,
                         "turnover": 20733710
                         },
                         "shenzhen": {
                         "name": "深证成指",
                         "curdot": 10413.54,
                         "curprice": -91.342,
                         "rate": -0.87,
                         "dealnumber": 222155688,
                         "turnover": 37772607
                         },
                         "DJI": {
                         "name": "道琼斯",
                         "date": "2016-04-09 06:30:08",
                         "curdot": 17576.96,
                         "rate": 0.2,
                         "growth": 35,
                         "startdot": 17555.39,
                         "closedot": 17541.96,
                         "hdot": 17694.51,
                         "ldot": 17528.16,
                         "turnover": 0
                         },
                         "IXIC": {
                         "name": "纳斯达克",
                         "date": "2016-04-09 05:28:01",
                         "curdot": 4850.69,
                         "rate": 0.05,
                         "growth": 2.32,
                         "startdot": 4883.99,
                         "closedot": 4848.37,
                         "hdot": 4892.6,
                         "ldot": 4835.37,
                         "turnover": 1560915922
                         },
                         "INX": {
                         "name": "纳斯达克",
                         "date": "2016-04-09 05:28:01",
                         "curdot": 2047.6,
                         "rate": 0.28,
                         "growth": 5.69,
                         "startdot": 2045.54,
                         "closedot": 2041.91,
                         "hdot": 2060.63,
                         "ldot": 2041.69,
                         "turnover": 0
                         },
                         "HSI": {
                         "name": "恒生指数",
                         "date": "2016/04/08 16:01",
                         "curdot": 20370.4,
                         "rate": 0.51,
                         "growth": 104.35,
                         "startdot": 20061.6,
                         "closedot": 20266.05,
                         "hdot": 20370.44,
                         "ldot": 20045.47,
                         "turnover": 59957360,
                         "52hdot": 28588.52,
                         "52ldot": 18278.8
                         }
                 }
         }
     }
 */

#pragma mark ==============上证指数=====================
- (void)createSHView {
    UIView *shView = [[UIView alloc] initWithFrame:CGRectMake(0, 64, ViewWidth, ViewHeight)];
    shView.backgroundColor = [UIColor redColor];
//-----------------------------股市名称-----------------------
    UILabel *marketNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 4, LabelWidth, LabelHeight)];
    marketNameLabel.textColor = [UIColor whiteColor];
    marketNameLabel.text = @"上证指数";
    marketNameLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:20];
//-----------------------------1.涨跌-------------------------
    UILabel *curPriceLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, (ViewHeight-LabelHeight)/5.0, LabelWidth, LabelHeight)];
    curPriceLabel.text = @"涨跌";
    curPriceLabel.textColor = [UIColor whiteColor];
    UILabel *curPrice = [[UILabel alloc] initWithFrame:CGRectMake(5 + ViewWidth/2.0, (ViewHeight-LabelHeight)/5.0, LabelWidth, LabelHeight)];
    curPrice.textColor = [UIColor whiteColor];
//-----------------------------2.涨跌幅------------------------
    UILabel *rateLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, (ViewHeight-LabelHeight)/5.0 *2.0, LabelWidth, LabelHeight)];
    rateLabel.textColor = [UIColor whiteColor];
    rateLabel.text = @"涨幅";
    UILabel *rateNum = [[UILabel alloc] initWithFrame:CGRectMake(5 + ViewWidth/2.0, (ViewHeight-LabelHeight)/5.0 *2.0, LabelWidth, LabelHeight)];
    rateNum.textColor = [UIColor whiteColor];
//-----------------------------3.当前--------------------------
    UILabel *curDotLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, (ViewHeight-LabelHeight)/5.0 *3.0, LabelWidth, LabelHeight)];
    curDotLabel.textColor = [UIColor whiteColor];
    curDotLabel.text = @"当前";
    UILabel *curDot = [[UILabel alloc] initWithFrame:CGRectMake(5 + ViewWidth/2.0, (ViewHeight-LabelHeight)/5.0 *3.0, LabelWidth, LabelHeight)];
    curDot.textColor = [UIColor whiteColor];
//-----------------------------4.成交量(手)---------------------
    UILabel *dealNumberLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, (ViewHeight-LabelHeight)/5.0 *4.0, LabelWidth, LabelHeight)];
    dealNumberLabel.textColor = [UIColor whiteColor];
    dealNumberLabel.text = @"成交量(手)";
    UILabel *dealNumber = [[UILabel alloc] initWithFrame:CGRectMake(5 + ViewWidth/2.0, (ViewHeight-LabelHeight)/5.0 *4.0, LabelWidth, LabelHeight)];
    dealNumber.textColor = [UIColor whiteColor];
//-----------------------------5.成交金额(万)--------------------
    UILabel *turnOverLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, (ViewHeight-LabelHeight)/5.0 *5.0, LabelWidth, LabelHeight)];
    turnOverLabel.textColor = [UIColor whiteColor];
    turnOverLabel.text = @"成交额(万)";
    UILabel *turnOver = [[UILabel alloc] initWithFrame:CGRectMake(5 + ViewWidth/2.0, (ViewHeight-LabelHeight)/5.0 *5.0, LabelWidth, LabelHeight)];
    turnOver.textColor = [UIColor whiteColor];
//-----------------------------网络请求------------------------
    NSString *requestURLString = @"http://apis.baidu.com/apistore/stockservice/hkstock";
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager.requestSerializer setValue:kAPIStoreKey forHTTPHeaderField:@"apikey"];
    [manager GET:requestURLString parameters:@{@"stockid":@"00168",@"list":@1} success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        NSDictionary *dic = (NSDictionary *)responseObject;
        NSDictionary *reDeats = [dic objectForKey:@"retData"];
        NSDictionary *markets = [reDeats objectForKey:@"market"];
        NSDictionary *shanghai = [markets objectForKey:@"shanghai"];
//----------------------1.涨跌点数
        NSNumber *curprice = [shanghai objectForKey:@"curprice"];
        float curpriceFloat = [curprice floatValue];
        NSString *curpriceString = [NSString stringWithFormat:@"%.2f", curpriceFloat];
        curPrice.text = curpriceString;
//----------------------2.涨幅数据
        NSNumber *rate = [shanghai objectForKey:@"rate"];
        float rateFloat = [rate floatValue];
        NSString *rateString = [NSString stringWithFormat:@"%.2f%%", rateFloat];
        rateNum.text = rateString;
//----------------------3.当前点数数据
        NSNumber *curdot = [shanghai objectForKey:@"curdot"];
        float curdotFloat = [curdot floatValue];
        NSString *curdotString = [NSString stringWithFormat:@"%.2f", curdotFloat];
        curDot.text = curdotString;
//----------------------4.成交量(手)
        NSNumber *dealnumber = [shanghai objectForKey:@"dealnumber"];
        float dealnumberFloat = [dealnumber floatValue];
        dealnumberFloat /= 10000.0;
        NSString *dealnumberString = [NSString stringWithFormat:@"%.1f万", dealnumberFloat];
        dealNumber.text = dealnumberString;
//----------------------5.成交额(万元)
        NSNumber *turnover = [shanghai objectForKey:@"turnover"];
        float turnoverFloat = [turnover floatValue];
        turnoverFloat /= 10000.0;
        NSString *turnoverString = [NSString stringWithFormat:@"%.2f", turnoverFloat];
        turnOver.text = turnoverString;
//----------------------判断涨跌，显示不同的颜色
        if (curpriceFloat >= 0.0 && rateFloat >= 0.0) {
            shView.backgroundColor = [UIColor redColor];
        } else {
            shView.backgroundColor = [UIColor greenColor];
            marketNameLabel.textColor = [UIColor blackColor];
            curPriceLabel.textColor = [UIColor blackColor];
            rateLabel.textColor = [UIColor blackColor];
            curDotLabel.textColor = [UIColor blackColor];
            dealNumberLabel.textColor = [UIColor blackColor];
            turnOverLabel.textColor = [UIColor blackColor];
            curPrice.textColor = [UIColor blackColor];
            rateNum.textColor = [UIColor blackColor];
            curDot.textColor = [UIColor blackColor];
            dealNumber.textColor = [UIColor blackColor];
            turnOver.textColor = [UIColor blackColor];
        }
//        NSLog(@"=====成功了耶======%@======", dic);
    } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
//        NSLog(@"----卧槽！竟然失败了！！！----");
    }];

//.........................添加视图.........................
    [shView addSubview:marketNameLabel];
    [shView addSubview:curPriceLabel];
    [shView addSubview:rateLabel];
    [shView addSubview:curDotLabel];
    [shView addSubview:dealNumberLabel];
    [shView addSubview:turnOverLabel];
    [shView addSubview:curPrice];
    [shView addSubview:rateNum];
    [shView addSubview:curDot];
    [shView addSubview:dealNumber];
    [shView addSubview:turnOver];
    [self.view addSubview:shView];
}


#pragma mark ==============深证成指=====================
- (void)createSZView {
    UIView *szView = [[UIView alloc] initWithFrame:CGRectMake(ViewWidth, 64, ViewWidth, ViewHeight)];
    szView.backgroundColor = [UIColor redColor];
//-----------------------------股市名称-----------------------
    UILabel *marketNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 4, LabelWidth, LabelHeight)];
    marketNameLabel.textColor = [UIColor whiteColor];
    marketNameLabel.text = @"深证成指";
    marketNameLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:20];
//-----------------------------1.涨跌-------------------------
    UILabel *curPriceLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, (ViewHeight-LabelHeight)/5.0, LabelWidth, LabelHeight)];
    curPriceLabel.text = @"涨跌";
    curPriceLabel.textColor = [UIColor whiteColor];
    UILabel *curPrice = [[UILabel alloc] initWithFrame:CGRectMake(5 + ViewWidth/2.0, (ViewHeight-LabelHeight)/5.0, LabelWidth, LabelHeight)];
    curPrice.textColor = [UIColor whiteColor];
//-----------------------------2.涨跌幅------------------------
    UILabel *rateLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, (ViewHeight-LabelHeight)/5.0 *2.0, LabelWidth, LabelHeight)];
    rateLabel.textColor = [UIColor whiteColor];
    rateLabel.text = @"涨幅";
    UILabel *rateNum = [[UILabel alloc] initWithFrame:CGRectMake(5 + ViewWidth/2.0, (ViewHeight-LabelHeight)/5.0 *2.0, LabelWidth, LabelHeight)];
    rateNum.textColor = [UIColor whiteColor];
//-----------------------------3.当前--------------------------
    UILabel *curDotLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, (ViewHeight-LabelHeight)/5.0 *3.0, LabelWidth, LabelHeight)];
    curDotLabel.textColor = [UIColor whiteColor];
    curDotLabel.text = @"当前";
    UILabel *curDot = [[UILabel alloc] initWithFrame:CGRectMake(5 + ViewWidth/2.0, (ViewHeight-LabelHeight)/5.0 *3.0, LabelWidth, LabelHeight)];
    curDot.textColor = [UIColor whiteColor];
//-----------------------------4.成交量(手)---------------------
    UILabel *dealNumberLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, (ViewHeight-LabelHeight)/5.0 *4.0, LabelWidth, LabelHeight)];
    dealNumberLabel.textColor = [UIColor whiteColor];
    dealNumberLabel.text = @"成交量(手)";
    UILabel *dealNumber = [[UILabel alloc] initWithFrame:CGRectMake(5 + ViewWidth/2.0, (ViewHeight-LabelHeight)/5.0 *4.0, LabelWidth, LabelHeight)];
    dealNumber.textColor = [UIColor whiteColor];
//-----------------------------5.成交金额(万)--------------------
    UILabel *turnOverLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, (ViewHeight-LabelHeight)/5.0 *5.0, LabelWidth, LabelHeight)];
    turnOverLabel.textColor = [UIColor whiteColor];
    turnOverLabel.text = @"成交额(万)";
    UILabel *turnOver = [[UILabel alloc] initWithFrame:CGRectMake(5 + ViewWidth/2.0, (ViewHeight-LabelHeight)/5.0 *5.0, LabelWidth, LabelHeight)];
    turnOver.textColor = [UIColor whiteColor];
//-----------------------------网络请求------------------------
    NSString *requestURLString = @"http://apis.baidu.com/apistore/stockservice/hkstock";
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager.requestSerializer setValue:kAPIStoreKey forHTTPHeaderField:@"apikey"];
    [manager GET:requestURLString parameters:@{@"stockid":@"00168",@"list":@1} success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        NSDictionary *dic = (NSDictionary *)responseObject;
        NSDictionary *reDeats = [dic objectForKey:@"retData"];
        NSDictionary *markets = [reDeats objectForKey:@"market"];
        NSDictionary *shenzhen = [markets objectForKey:@"shenzhen"];
//----------------------1.涨跌点数
        NSNumber *curprice = [shenzhen objectForKey:@"curprice"];
        float curpriceFloat = [curprice floatValue];
        NSString *curpriceString = [NSString stringWithFormat:@"%.2f", curpriceFloat];
        curPrice.text = curpriceString;
//----------------------2.涨幅数据
        NSNumber *rate = [shenzhen objectForKey:@"rate"];
        float rateFloat = [rate floatValue];
        NSString *rateString = [NSString stringWithFormat:@"%.2f%%", rateFloat];
        rateNum.text = rateString;
//----------------------3.当前点数数据
        NSNumber *curdot = [shenzhen objectForKey:@"curdot"];
        float curdotFloat = [curdot floatValue];
        NSString *curdotString = [NSString stringWithFormat:@"%.2f", curdotFloat];
        curDot.text = curdotString;
//----------------------4.成交量(手)
        NSNumber *dealnumber = [shenzhen objectForKey:@"dealnumber"];
        float dealnumberFloat = [dealnumber floatValue];
        dealnumberFloat /= 10000.0;
        NSString *dealnumberString = [NSString stringWithFormat:@"%.1f万", dealnumberFloat];
        dealNumber.text = dealnumberString;
//----------------------5.成交额(万元)
        NSNumber *turnover = [shenzhen objectForKey:@"turnover"];
        float turnoverFloat = [turnover floatValue];
        turnoverFloat /= 10000.0;
        NSString *turnoverString = [NSString stringWithFormat:@"%.2f", turnoverFloat];
        turnOver.text = turnoverString;
//----------------------判断涨跌，显示不同的颜色
        if (curpriceFloat >= 0.0 && rateFloat >= 0.0) {
            szView.backgroundColor = [UIColor redColor];
        } else {
            szView.backgroundColor = [UIColor greenColor];
            marketNameLabel.textColor = [UIColor blackColor];
            curPriceLabel.textColor = [UIColor blackColor];
            rateLabel.textColor = [UIColor blackColor];
            curDotLabel.textColor = [UIColor blackColor];
            dealNumberLabel.textColor = [UIColor blackColor];
            turnOverLabel.textColor = [UIColor blackColor];
            curPrice.textColor = [UIColor blackColor];
            rateNum.textColor = [UIColor blackColor];
            curDot.textColor = [UIColor blackColor];
            dealNumber.textColor = [UIColor blackColor];
            turnOver.textColor = [UIColor blackColor];
        }
        NSLog(@"=====成功了耶======%@======", dic);
    } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
        NSLog(@"----卧槽！竟然失败了！！！----");
    }];
    
//.........................添加视图.........................
    [szView addSubview:marketNameLabel];
    [szView addSubview:curPriceLabel];
    [szView addSubview:rateLabel];
    [szView addSubview:curDotLabel];
    [szView addSubview:dealNumberLabel];
    [szView addSubview:turnOverLabel];
    [szView addSubview:curPrice];
    [szView addSubview:rateNum];
    [szView addSubview:curDot];
    [szView addSubview:dealNumber];
    [szView addSubview:turnOver];
    [self.view addSubview:szView];
}


#pragma mark ==============道琼斯=======================
- (void)createDJIView {
    UIView *djiView = [[UIView alloc] initWithFrame:CGRectMake(0, 64 + ViewHeight, ViewWidth, ViewHeight)];
    djiView.backgroundColor = [UIColor redColor];
//---------------股市名称------------------
    UILabel *marketNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 4, LabelWidth, LabelHeight)];
    marketNameLabel.textColor = [UIColor whiteColor];
    marketNameLabel.text = @"道琼斯";
    marketNameLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:20];
//-----------------------------0.涨跌-------------------------
    UILabel *growhtNum = [[UILabel alloc] initWithFrame:CGRectMake(5 + ViewWidth/2.0, 4, LabelWidth, LabelHeight)];
    growhtNum.textColor = [UIColor whiteColor];
//-----------------------------1.涨跌幅------------------------
    UILabel *rateLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, (ViewHeight-LabelHeight)/6.0, LabelWidth, LabelHeight)];
    rateLabel.textColor = [UIColor whiteColor];
    rateLabel.text = @"涨幅";
    UILabel *rateNum = [[UILabel alloc] initWithFrame:CGRectMake(5 + ViewWidth/2.0, (ViewHeight-LabelHeight)/6.0, LabelWidth, LabelHeight)];
    rateNum.textColor = [UIColor whiteColor];
//-----------------------------2.当前--------------------------
    UILabel *curDotLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, (ViewHeight-LabelHeight)/6.0 *2.0, LabelWidth, LabelHeight)];
    curDotLabel.textColor = [UIColor whiteColor];
    curDotLabel.text = @"当前";
    UILabel *curDot = [[UILabel alloc] initWithFrame:CGRectMake(5 + ViewWidth/2.0, (ViewHeight-LabelHeight)/6.0 *2.0, LabelWidth, LabelHeight)];
    curDot.textColor = [UIColor whiteColor];
//-----------------------------3.今开---------------------------
    UILabel *statDotLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, (ViewHeight-LabelHeight)/6.0 *3.0, LabelWidth, LabelHeight)];
    statDotLabel.textColor = [UIColor whiteColor];
    statDotLabel.text = @"今开";
    UILabel *startDot = [[UILabel alloc] initWithFrame:CGRectMake(5 + ViewWidth/2.0, (ViewHeight-LabelHeight)/6.0 *3.0, LabelWidth, LabelHeight)];
    startDot.textColor = [UIColor whiteColor];
//-----------------------------4.昨收---------------------------
    UILabel *closeDotLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, (ViewHeight-LabelHeight)/6.0 *4.0, LabelWidth, LabelHeight)];
    closeDotLabel.textColor = [UIColor whiteColor];
    closeDotLabel.text = @"昨收";
    UILabel *closeDot = [[UILabel alloc] initWithFrame:CGRectMake(5 + ViewWidth/2.0, (ViewHeight-LabelHeight)/6.0 *4.0, LabelWidth, LabelHeight)];
    closeDot.textColor = [UIColor whiteColor];
//------------------------------5.最高---------------------------
    UILabel *hDotLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, (ViewHeight-LabelHeight)/6.0 *5.0, LabelWidth, LabelHeight)];
    hDotLabel.textColor = [UIColor whiteColor];
    hDotLabel.text = @"今日最高";
    UILabel *hDot = [[UILabel alloc] initWithFrame:CGRectMake(5 + ViewWidth/2.0, (ViewHeight-LabelHeight)/6.0 *5.0, LabelWidth, LabelHeight)];
    hDot.textColor = [UIColor whiteColor];
//------------------------------6.最低---------------------------
    UILabel *lDotLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, (ViewHeight-LabelHeight)/6.0 *6.0, LabelWidth, LabelHeight)];
    lDotLabel.textColor = [UIColor whiteColor];
    lDotLabel.text = @"今日最低";
    UILabel *lDot = [[UILabel alloc] initWithFrame:CGRectMake(5 + ViewWidth/2.0, (ViewHeight-LabelHeight)/6.0 *6.0, LabelWidth, LabelHeight)];
    lDot.textColor = [UIColor whiteColor];
//-----------------------------网络请求------------------------
    NSString *requestURLString = @"http://apis.baidu.com/apistore/stockservice/hkstock";
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager.requestSerializer setValue:kAPIStoreKey forHTTPHeaderField:@"apikey"];
    [manager GET:requestURLString parameters:@{@"stockid":@"00168",@"list":@1} success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        NSDictionary *dic = (NSDictionary *)responseObject;
        NSDictionary *reDeats = [dic objectForKey:@"retData"];
        NSDictionary *markets = [reDeats objectForKey:@"market"];
        NSDictionary *dji = [markets objectForKey:@"DJI"];
//----------------------0.涨跌点数
        NSNumber *growth = [dji objectForKey:@"growth"];
        float growthFloat = [growth floatValue];
        NSString *growthString = [NSString stringWithFormat:@"%.2f", growthFloat];
        growhtNum.text = growthString;
//----------------------1.涨幅数据
        NSNumber *rate = [dji objectForKey:@"rate"];
        float rateFloat = [rate floatValue];
        NSString *rateString = [NSString stringWithFormat:@"%.2f%%", rateFloat];
        rateNum.text = rateString;
//----------------------2.当前点数数据
        NSNumber *curdot = [dji objectForKey:@"curdot"];
        float curdotFloat = [curdot floatValue];
        NSString *curdotString = [NSString stringWithFormat:@"%.2f", curdotFloat];
        curDot.text = curdotString;
//----------------------3.今开数据
        NSNumber *startdot = [dji objectForKey:@"startdot"];
        float startdotFloat = [startdot floatValue];
        NSString *startdotString = [NSString stringWithFormat:@"%.2f", startdotFloat];
        startDot.text = startdotString;
//----------------------4.昨收数据
        NSNumber *closedot = [dji objectForKey:@"closedot"];
        float closedotFloat = [closedot floatValue];
        NSString *closedotString = [NSString stringWithFormat:@"%.2f", closedotFloat];
        closeDot.text = closedotString;
//----------------------5.最高
        NSNumber *hdot = [dji objectForKey:@"hdot"];
        float hdotFloat = [hdot floatValue];
        NSString *hdotString = [NSString stringWithFormat:@"%.2f", hdotFloat];
        hDot.text = hdotString;
//----------------------6.最低
        NSNumber *ldot = [dji objectForKey:@"ldot"];
        float ldotFloat = [ldot floatValue];
        NSString *ldotString = [NSString stringWithFormat:@"%.2f", ldotFloat];
        lDot.text = ldotString;
//----------------------判断涨跌，显示不同的颜色
        if (growthFloat >= 0.0 && rateFloat >= 0.0) {
            djiView.backgroundColor = [UIColor redColor];
        } else {
            djiView.backgroundColor = [UIColor greenColor];
            marketNameLabel.textColor = [UIColor blackColor];
            rateLabel.textColor = [UIColor blackColor];
            curDotLabel.textColor = [UIColor blackColor];
            statDotLabel.textColor = [UIColor blackColor];
            closeDotLabel.textColor = [UIColor blackColor];
            hDotLabel.textColor = [UIColor blackColor];
            lDotLabel.textColor = [UIColor blackColor];
            growhtNum.textColor = [UIColor blackColor];
            rateNum.textColor = [UIColor blackColor];
            curDot.textColor = [UIColor blackColor];
            startDot.textColor = [UIColor blackColor];
            closeDot.textColor = [UIColor blackColor];
            hDot.textColor = [UIColor blackColor];
            lDot.textColor = [UIColor blackColor];
        }
        NSLog(@"=====成功了耶======%@======", dic);
    } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
        NSLog(@"----卧槽！竟然失败了！！！----");
    }];
    
//.........................添加视图.........................
    [djiView addSubview:marketNameLabel];
    [djiView addSubview:rateLabel];
    [djiView addSubview:curDotLabel];
    [djiView addSubview:statDotLabel];
    [djiView addSubview:closeDotLabel];
    [djiView addSubview:hDotLabel];
    [djiView addSubview:lDotLabel];
    [djiView addSubview:growhtNum];
    [djiView addSubview:rateNum];
    [djiView addSubview:curDot];
    [djiView addSubview:startDot];
    [djiView addSubview:closeDot];
    [djiView addSubview:hDot];
    [djiView addSubview:lDot];
    [self.view addSubview:djiView];
    
}


#pragma mark ==============纳斯达克======================
- (void)createIXICView {
    UIView *ixicView = [[UIView alloc] initWithFrame:CGRectMake(ViewWidth, 64 + ViewHeight, ViewWidth, ViewHeight)];
    ixicView.backgroundColor = [UIColor redColor];
//---------------股市名称------------------
    UILabel *marketNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 4, LabelWidth, LabelHeight)];
    marketNameLabel.textColor = [UIColor whiteColor];
    marketNameLabel.text = @"纳斯达克";
    marketNameLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:20];
//-----------------------------0.涨跌-------------------------
    UILabel *growhtNum = [[UILabel alloc] initWithFrame:CGRectMake(5 + ViewWidth/2.0, 4, LabelWidth, LabelHeight)];
    growhtNum.textColor = [UIColor whiteColor];
//-----------------------------1.涨跌幅------------------------
    UILabel *rateLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, (ViewHeight-LabelHeight)/6.0, LabelWidth, LabelHeight)];
    rateLabel.textColor = [UIColor whiteColor];
    rateLabel.text = @"涨幅";
    UILabel *rateNum = [[UILabel alloc] initWithFrame:CGRectMake(5 + ViewWidth/2.0, (ViewHeight-LabelHeight)/6.0, LabelWidth, LabelHeight)];
    rateNum.textColor = [UIColor whiteColor];
//-----------------------------2.当前--------------------------
    UILabel *curDotLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, (ViewHeight-LabelHeight)/6.0 *2.0, LabelWidth, LabelHeight)];
    curDotLabel.textColor = [UIColor whiteColor];
    curDotLabel.text = @"当前";
    UILabel *curDot = [[UILabel alloc] initWithFrame:CGRectMake(5 + ViewWidth/2.0, (ViewHeight-LabelHeight)/6.0 *2.0, LabelWidth, LabelHeight)];
    curDot.textColor = [UIColor whiteColor];
//-----------------------------3.今开---------------------------
    UILabel *statDotLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, (ViewHeight-LabelHeight)/6.0 *3.0, LabelWidth, LabelHeight)];
    statDotLabel.textColor = [UIColor whiteColor];
    statDotLabel.text = @"今开";
    UILabel *startDot = [[UILabel alloc] initWithFrame:CGRectMake(5 + ViewWidth/2.0, (ViewHeight-LabelHeight)/6.0 *3.0, LabelWidth, LabelHeight)];
    startDot.textColor = [UIColor whiteColor];
//-----------------------------4.昨收---------------------------
    UILabel *closeDotLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, (ViewHeight-LabelHeight)/6.0 *4.0, LabelWidth, LabelHeight)];
    closeDotLabel.textColor = [UIColor whiteColor];
    closeDotLabel.text = @"昨收";
    UILabel *closeDot = [[UILabel alloc] initWithFrame:CGRectMake(5 + ViewWidth/2.0, (ViewHeight-LabelHeight)/6.0 *4.0, LabelWidth, LabelHeight)];
    closeDot.textColor = [UIColor whiteColor];
//------------------------------5.最高---------------------------
    UILabel *hDotLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, (ViewHeight-LabelHeight)/6.0 *5.0, LabelWidth, LabelHeight)];
    hDotLabel.textColor = [UIColor whiteColor];
    hDotLabel.text = @"今日最高";
    UILabel *hDot = [[UILabel alloc] initWithFrame:CGRectMake(5 + ViewWidth/2.0, (ViewHeight-LabelHeight)/6.0 *5.0, LabelWidth, LabelHeight)];
    hDot.textColor = [UIColor whiteColor];
//------------------------------6.最低---------------------------
    UILabel *lDotLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, (ViewHeight-LabelHeight)/6.0 *6.0, LabelWidth, LabelHeight)];
    lDotLabel.textColor = [UIColor whiteColor];
    lDotLabel.text = @"今日最低";
    UILabel *lDot = [[UILabel alloc] initWithFrame:CGRectMake(5 + ViewWidth/2.0, (ViewHeight-LabelHeight)/6.0 *6.0, LabelWidth, LabelHeight)];
    lDot.textColor = [UIColor whiteColor];
//-----------------------------网络请求------------------------
    NSString *requestURLString = @"http://apis.baidu.com/apistore/stockservice/hkstock";
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager.requestSerializer setValue:kAPIStoreKey forHTTPHeaderField:@"apikey"];
    [manager GET:requestURLString parameters:@{@"stockid":@"00168",@"list":@1} success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        NSDictionary *dic = (NSDictionary *)responseObject;
        NSDictionary *reDeats = [dic objectForKey:@"retData"];
        NSDictionary *markets = [reDeats objectForKey:@"market"];
        NSDictionary *ixic = [markets objectForKey:@"IXIC"];
//----------------------0.涨跌点数
        NSNumber *growth = [ixic objectForKey:@"growth"];
        float growthFloat = [growth floatValue];
        NSString *growthString = [NSString stringWithFormat:@"%.2f", growthFloat];
        growhtNum.text = growthString;
//----------------------1.涨幅数据
        NSNumber *rate = [ixic objectForKey:@"rate"];
        float rateFloat = [rate floatValue];
        NSString *rateString = [NSString stringWithFormat:@"%.2f%%", rateFloat];
        rateNum.text = rateString;
//----------------------2.当前点数数据
        NSNumber *curdot = [ixic objectForKey:@"curdot"];
        float curdotFloat = [curdot floatValue];
        NSString *curdotString = [NSString stringWithFormat:@"%.2f", curdotFloat];
        curDot.text = curdotString;
//----------------------3.今开数据
        NSNumber *startdot = [ixic objectForKey:@"startdot"];
        float startdotFloat = [startdot floatValue];
        NSString *startdotString = [NSString stringWithFormat:@"%.2f", startdotFloat];
        startDot.text = startdotString;
//----------------------4.昨收数据
        NSNumber *closedot = [ixic objectForKey:@"closedot"];
        float closedotFloat = [closedot floatValue];
        NSString *closedotString = [NSString stringWithFormat:@"%.2f", closedotFloat];
        closeDot.text = closedotString;
//----------------------5.最高
        NSNumber *hdot = [ixic objectForKey:@"hdot"];
        float hdotFloat = [hdot floatValue];
        NSString *hdotString = [NSString stringWithFormat:@"%.2f", hdotFloat];
        hDot.text = hdotString;
//----------------------6.最低
        NSNumber *ldot = [ixic objectForKey:@"ldot"];
        float ldotFloat = [ldot floatValue];
        NSString *ldotString = [NSString stringWithFormat:@"%.2f", ldotFloat];
        lDot.text = ldotString;
//----------------------判断涨跌，显示不同的颜色
        if (growthFloat >= 0.0 && rateFloat >= 0.0) {
            ixicView.backgroundColor = [UIColor redColor];
        } else {
            ixicView.backgroundColor = [UIColor greenColor];
            marketNameLabel.textColor = [UIColor blackColor];
            rateLabel.textColor = [UIColor blackColor];
            curDotLabel.textColor = [UIColor blackColor];
            statDotLabel.textColor = [UIColor blackColor];
            closeDotLabel.textColor = [UIColor blackColor];
            hDotLabel.textColor = [UIColor blackColor];
            lDotLabel.textColor = [UIColor blackColor];
            growhtNum.textColor = [UIColor blackColor];
            rateNum.textColor = [UIColor blackColor];
            curDot.textColor = [UIColor blackColor];
            startDot.textColor = [UIColor blackColor];
            closeDot.textColor = [UIColor blackColor];
            hDot.textColor = [UIColor blackColor];
            lDot.textColor = [UIColor blackColor];
        }
        NSLog(@"=====成功了耶======%@======", dic);
    } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
        NSLog(@"----卧槽！竟然失败了！！！----");
    }];
    
//.........................添加视图.........................
    [ixicView addSubview:marketNameLabel];
    [ixicView addSubview:rateLabel];
    [ixicView addSubview:curDotLabel];
    [ixicView addSubview:statDotLabel];
    [ixicView addSubview:closeDotLabel];
    [ixicView addSubview:hDotLabel];
    [ixicView addSubview:lDotLabel];
    [ixicView addSubview:growhtNum];
    [ixicView addSubview:rateNum];
    [ixicView addSubview:curDot];
    [ixicView addSubview:startDot];
    [ixicView addSubview:closeDot];
    [ixicView addSubview:hDot];
    [ixicView addSubview:lDot];
    [self.view addSubview:ixicView];
    
}


#pragma mark ==============标普指数======================
- (void)createINXView {
    UIView *ixicView = [[UIView alloc] initWithFrame:CGRectMake(0, 64 + ViewHeight *2, ViewWidth, ViewHeight)];
    ixicView.backgroundColor = [UIColor redColor];
//---------------股市名称------------------
    UILabel *marketNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 4, LabelWidth, LabelHeight)];
    marketNameLabel.textColor = [UIColor whiteColor];
    marketNameLabel.text = @"标普指数";
    marketNameLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:20];
//-----------------------------0.涨跌-------------------------
    UILabel *growhtNum = [[UILabel alloc] initWithFrame:CGRectMake(5 + ViewWidth/2.0, 4, LabelWidth, LabelHeight)];
    growhtNum.textColor = [UIColor whiteColor];
//-----------------------------1.涨跌幅------------------------
    UILabel *rateLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, (ViewHeight-LabelHeight)/6.0, LabelWidth, LabelHeight)];
    rateLabel.textColor = [UIColor whiteColor];
    rateLabel.text = @"涨幅";
    UILabel *rateNum = [[UILabel alloc] initWithFrame:CGRectMake(5 + ViewWidth/2.0, (ViewHeight-LabelHeight)/6.0, LabelWidth, LabelHeight)];
    rateNum.textColor = [UIColor whiteColor];
//-----------------------------2.当前--------------------------
    UILabel *curDotLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, (ViewHeight-LabelHeight)/6.0 *2.0, LabelWidth, LabelHeight)];
    curDotLabel.textColor = [UIColor whiteColor];
    curDotLabel.text = @"当前";
    UILabel *curDot = [[UILabel alloc] initWithFrame:CGRectMake(5 + ViewWidth/2.0, (ViewHeight-LabelHeight)/6.0 *2.0, LabelWidth, LabelHeight)];
    curDot.textColor = [UIColor whiteColor];
//-----------------------------3.今开---------------------------
    UILabel *statDotLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, (ViewHeight-LabelHeight)/6.0 *3.0, LabelWidth, LabelHeight)];
    statDotLabel.textColor = [UIColor whiteColor];
    statDotLabel.text = @"今开";
    UILabel *startDot = [[UILabel alloc] initWithFrame:CGRectMake(5 + ViewWidth/2.0, (ViewHeight-LabelHeight)/6.0 *3.0, LabelWidth, LabelHeight)];
    startDot.textColor = [UIColor whiteColor];
//-----------------------------4.昨收---------------------------
    UILabel *closeDotLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, (ViewHeight-LabelHeight)/6.0 *4.0, LabelWidth, LabelHeight)];
    closeDotLabel.textColor = [UIColor whiteColor];
    closeDotLabel.text = @"昨收";
    UILabel *closeDot = [[UILabel alloc] initWithFrame:CGRectMake(5 + ViewWidth/2.0, (ViewHeight-LabelHeight)/6.0 *4.0, LabelWidth, LabelHeight)];
    closeDot.textColor = [UIColor whiteColor];
//------------------------------5.最高---------------------------
    UILabel *hDotLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, (ViewHeight-LabelHeight)/6.0 *5.0, LabelWidth, LabelHeight)];
    hDotLabel.textColor = [UIColor whiteColor];
    hDotLabel.text = @"今日最高";
    UILabel *hDot = [[UILabel alloc] initWithFrame:CGRectMake(5 + ViewWidth/2.0, (ViewHeight-LabelHeight)/6.0 *5.0, LabelWidth, LabelHeight)];
    hDot.textColor = [UIColor whiteColor];
//------------------------------6.最低---------------------------
    UILabel *lDotLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, (ViewHeight-LabelHeight)/6.0 *6.0, LabelWidth, LabelHeight)];
    lDotLabel.textColor = [UIColor whiteColor];
    lDotLabel.text = @"今日最低";
    UILabel *lDot = [[UILabel alloc] initWithFrame:CGRectMake(5 + ViewWidth/2.0, (ViewHeight-LabelHeight)/6.0 *6.0, LabelWidth, LabelHeight)];
    lDot.textColor = [UIColor whiteColor];
//-----------------------------网络请求------------------------
    NSString *requestURLString = @"http://apis.baidu.com/apistore/stockservice/hkstock";
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager.requestSerializer setValue:kAPIStoreKey forHTTPHeaderField:@"apikey"];
    [manager GET:requestURLString parameters:@{@"stockid":@"00168",@"list":@1} success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        NSDictionary *dic = (NSDictionary *)responseObject;
        NSDictionary *reDeats = [dic objectForKey:@"retData"];
        NSDictionary *markets = [reDeats objectForKey:@"market"];
        NSDictionary *inx = [markets objectForKey:@"INX"];
//----------------------0.涨跌点数
        NSNumber *growth = [inx objectForKey:@"growth"];
        float growthFloat = [growth floatValue];
        NSString *growthString = [NSString stringWithFormat:@"%.2f", growthFloat];
        growhtNum.text = growthString;
//----------------------1.涨幅数据
        NSNumber *rate = [inx objectForKey:@"rate"];
        float rateFloat = [rate floatValue];
        NSString *rateString = [NSString stringWithFormat:@"%.2f%%", rateFloat];
        rateNum.text = rateString;
//----------------------2.当前点数数据
        NSNumber *curdot = [inx objectForKey:@"curdot"];
        float curdotFloat = [curdot floatValue];
        NSString *curdotString = [NSString stringWithFormat:@"%.2f", curdotFloat];
        curDot.text = curdotString;
//----------------------3.今开数据
        NSNumber *startdot = [inx objectForKey:@"startdot"];
        float startdotFloat = [startdot floatValue];
        NSString *startdotString = [NSString stringWithFormat:@"%.2f", startdotFloat];
        startDot.text = startdotString;
//----------------------4.昨收数据
        NSNumber *closedot = [inx objectForKey:@"closedot"];
        float closedotFloat = [closedot floatValue];
        NSString *closedotString = [NSString stringWithFormat:@"%.2f", closedotFloat];
        closeDot.text = closedotString;
//----------------------5.最高
        NSNumber *hdot = [inx objectForKey:@"hdot"];
        float hdotFloat = [hdot floatValue];
        NSString *hdotString = [NSString stringWithFormat:@"%.2f", hdotFloat];
        hDot.text = hdotString;
//----------------------6.最低
        NSNumber *ldot = [inx objectForKey:@"ldot"];
        float ldotFloat = [ldot floatValue];
        NSString *ldotString = [NSString stringWithFormat:@"%.2f", ldotFloat];
        lDot.text = ldotString;
//----------------------判断涨跌，显示不同的颜色
        if (growthFloat >= 0.0 && rateFloat >= 0.0) {
            ixicView.backgroundColor = [UIColor redColor];
        } else {
            ixicView.backgroundColor = [UIColor greenColor];
            marketNameLabel.textColor = [UIColor blackColor];
            rateLabel.textColor = [UIColor blackColor];
            curDotLabel.textColor = [UIColor blackColor];
            statDotLabel.textColor = [UIColor blackColor];
            closeDotLabel.textColor = [UIColor blackColor];
            hDotLabel.textColor = [UIColor blackColor];
            lDotLabel.textColor = [UIColor blackColor];
            growhtNum.textColor = [UIColor blackColor];
            rateNum.textColor = [UIColor blackColor];
            curDot.textColor = [UIColor blackColor];
            startDot.textColor = [UIColor blackColor];
            closeDot.textColor = [UIColor blackColor];
            hDot.textColor = [UIColor blackColor];
            lDot.textColor = [UIColor blackColor];
        }
        NSLog(@"=====成功了耶======%@======", dic);
    } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
        NSLog(@"----卧槽！竟然失败了！！！----");
    }];
    
//.........................添加视图.........................
    [ixicView addSubview:marketNameLabel];
    [ixicView addSubview:rateLabel];
    [ixicView addSubview:curDotLabel];
    [ixicView addSubview:statDotLabel];
    [ixicView addSubview:closeDotLabel];
    [ixicView addSubview:hDotLabel];
    [ixicView addSubview:lDotLabel];
    [ixicView addSubview:growhtNum];
    [ixicView addSubview:rateNum];
    [ixicView addSubview:curDot];
    [ixicView addSubview:startDot];
    [ixicView addSubview:closeDot];
    [ixicView addSubview:hDot];
    [ixicView addSubview:lDot];
    [self.view addSubview:ixicView];
    
}


#pragma mark ==============恒生指数======================
- (void)createHSIView {
    UIView *ixicView = [[UIView alloc] initWithFrame:CGRectMake(ViewWidth, 64 + ViewHeight *2, ViewWidth, ViewHeight)];
    ixicView.backgroundColor = [UIColor redColor];
    //---------------股市名称------------------
    UILabel *marketNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 4, LabelWidth, LabelHeight)];
    marketNameLabel.textColor = [UIColor whiteColor];
    marketNameLabel.text = @"恒生指数";
    marketNameLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:20];
    //-----------------------------0.涨跌-------------------------
    UILabel *growhtNum = [[UILabel alloc] initWithFrame:CGRectMake(5 + ViewWidth/2.0, 4, LabelWidth, LabelHeight)];
    growhtNum.textColor = [UIColor whiteColor];
    //-----------------------------1.涨跌幅------------------------
    UILabel *rateLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, (ViewHeight-LabelHeight)/6.0, LabelWidth, LabelHeight)];
    rateLabel.textColor = [UIColor whiteColor];
    rateLabel.text = @"涨幅";
    UILabel *rateNum = [[UILabel alloc] initWithFrame:CGRectMake(5 + ViewWidth/2.0, (ViewHeight-LabelHeight)/6.0, LabelWidth, LabelHeight)];
    rateNum.textColor = [UIColor whiteColor];
    //-----------------------------2.当前--------------------------
    UILabel *curDotLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, (ViewHeight-LabelHeight)/6.0 *2.0, LabelWidth, LabelHeight)];
    curDotLabel.textColor = [UIColor whiteColor];
    curDotLabel.text = @"当前";
    UILabel *curDot = [[UILabel alloc] initWithFrame:CGRectMake(5 + ViewWidth/2.0, (ViewHeight-LabelHeight)/6.0 *2.0, LabelWidth, LabelHeight)];
    curDot.textColor = [UIColor whiteColor];
    //-----------------------------3.今开---------------------------
    UILabel *statDotLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, (ViewHeight-LabelHeight)/6.0 *3.0, LabelWidth, LabelHeight)];
    statDotLabel.textColor = [UIColor whiteColor];
    statDotLabel.text = @"今开";
    UILabel *startDot = [[UILabel alloc] initWithFrame:CGRectMake(5 + ViewWidth/2.0, (ViewHeight-LabelHeight)/6.0 *3.0, LabelWidth, LabelHeight)];
    startDot.textColor = [UIColor whiteColor];
    //-----------------------------4.昨收---------------------------
    UILabel *closeDotLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, (ViewHeight-LabelHeight)/6.0 *4.0, LabelWidth, LabelHeight)];
    closeDotLabel.textColor = [UIColor whiteColor];
    closeDotLabel.text = @"昨收";
    UILabel *closeDot = [[UILabel alloc] initWithFrame:CGRectMake(5 + ViewWidth/2.0, (ViewHeight-LabelHeight)/6.0 *4.0, LabelWidth, LabelHeight)];
    closeDot.textColor = [UIColor whiteColor];
    //------------------------------5.最高---------------------------
    UILabel *hDotLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, (ViewHeight-LabelHeight)/6.0 *5.0, LabelWidth, LabelHeight)];
    hDotLabel.textColor = [UIColor whiteColor];
    hDotLabel.text = @"今日最高";
    UILabel *hDot = [[UILabel alloc] initWithFrame:CGRectMake(5 + ViewWidth/2.0, (ViewHeight-LabelHeight)/6.0 *5.0, LabelWidth, LabelHeight)];
    hDot.textColor = [UIColor whiteColor];
    //------------------------------6.最低---------------------------
    UILabel *lDotLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, (ViewHeight-LabelHeight)/6.0 *6.0, LabelWidth, LabelHeight)];
    lDotLabel.textColor = [UIColor whiteColor];
    lDotLabel.text = @"今日最低";
    UILabel *lDot = [[UILabel alloc] initWithFrame:CGRectMake(5 + ViewWidth/2.0, (ViewHeight-LabelHeight)/6.0 *6.0, LabelWidth, LabelHeight)];
    lDot.textColor = [UIColor whiteColor];
    //-----------------------------网络请求------------------------
    NSString *requestURLString = @"http://apis.baidu.com/apistore/stockservice/hkstock";
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager.requestSerializer setValue:kAPIStoreKey forHTTPHeaderField:@"apikey"];
    [manager GET:requestURLString parameters:@{@"stockid":@"00168",@"list":@1} success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        NSDictionary *dic = (NSDictionary *)responseObject;
        NSDictionary *reDeats = [dic objectForKey:@"retData"];
        NSDictionary *markets = [reDeats objectForKey:@"market"];
        NSDictionary *hsi = [markets objectForKey:@"HSI"];
        //----------------------0.涨跌点数
        NSNumber *growth = [hsi objectForKey:@"growth"];
        float growthFloat = [growth floatValue];
        NSString *growthString = [NSString stringWithFormat:@"%.2f", growthFloat];
        growhtNum.text = growthString;
        //----------------------1.涨幅数据
        NSNumber *rate = [hsi objectForKey:@"rate"];
        float rateFloat = [rate floatValue];
        NSString *rateString = [NSString stringWithFormat:@"%.2f%%", rateFloat];
        rateNum.text = rateString;
        //----------------------2.当前点数数据
        NSNumber *curdot = [hsi objectForKey:@"curdot"];
        float curdotFloat = [curdot floatValue];
        NSString *curdotString = [NSString stringWithFormat:@"%.2f", curdotFloat];
        curDot.text = curdotString;
        //----------------------3.今开数据
        NSNumber *startdot = [hsi objectForKey:@"startdot"];
        float startdotFloat = [startdot floatValue];
        NSString *startdotString = [NSString stringWithFormat:@"%.2f", startdotFloat];
        startDot.text = startdotString;
        //----------------------4.昨收数据
        NSNumber *closedot = [hsi objectForKey:@"closedot"];
        float closedotFloat = [closedot floatValue];
        NSString *closedotString = [NSString stringWithFormat:@"%.2f", closedotFloat];
        closeDot.text = closedotString;
        //----------------------5.最高
        NSNumber *hdot = [hsi objectForKey:@"hdot"];
        float hdotFloat = [hdot floatValue];
        NSString *hdotString = [NSString stringWithFormat:@"%.2f", hdotFloat];
        hDot.text = hdotString;
        //----------------------6.最低
        NSNumber *ldot = [hsi objectForKey:@"ldot"];
        float ldotFloat = [ldot floatValue];
        NSString *ldotString = [NSString stringWithFormat:@"%.2f", ldotFloat];
        lDot.text = ldotString;
        //----------------------判断涨跌，显示不同的颜色
        if (growthFloat >= 0.0 && rateFloat >= 0.0) {
            ixicView.backgroundColor = [UIColor redColor];
        } else {
            ixicView.backgroundColor = [UIColor greenColor];
            marketNameLabel.textColor = [UIColor blackColor];
            rateLabel.textColor = [UIColor blackColor];
            curDotLabel.textColor = [UIColor blackColor];
            statDotLabel.textColor = [UIColor blackColor];
            closeDotLabel.textColor = [UIColor blackColor];
            hDotLabel.textColor = [UIColor blackColor];
            lDotLabel.textColor = [UIColor blackColor];
            growhtNum.textColor = [UIColor blackColor];
            rateNum.textColor = [UIColor blackColor];
            curDot.textColor = [UIColor blackColor];
            startDot.textColor = [UIColor blackColor];
            closeDot.textColor = [UIColor blackColor];
            hDot.textColor = [UIColor blackColor];
            lDot.textColor = [UIColor blackColor];
        }
        NSLog(@"=====成功了耶======%@======", dic);
    } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
        NSLog(@"----卧槽！竟然失败了！！！----");
    }];
    
    //.........................添加视图.........................
    [ixicView addSubview:marketNameLabel];
    [ixicView addSubview:rateLabel];
    [ixicView addSubview:curDotLabel];
    [ixicView addSubview:statDotLabel];
    [ixicView addSubview:closeDotLabel];
    [ixicView addSubview:hDotLabel];
    [ixicView addSubview:lDotLabel];
    [ixicView addSubview:growhtNum];
    [ixicView addSubview:rateNum];
    [ixicView addSubview:curDot];
    [ixicView addSubview:startDot];
    [ixicView addSubview:closeDot];
    [ixicView addSubview:hDot];
    [ixicView addSubview:lDot];
    [self.view addSubview:ixicView];
    
}







- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
