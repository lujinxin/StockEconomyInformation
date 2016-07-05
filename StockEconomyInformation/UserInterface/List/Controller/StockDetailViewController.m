//
//  StockDetailViewController.m
//  StockEconomyInformation
//
//  Created by 陆金鑫 on 16/4/30.
//  Copyright © 2016年 陆金鑫. All rights reserved.
//

#import "StockDetailViewController.h"
#import "AFNetworking.h"
#import "UIImageView+WebCache.h"
#import "FivePriceView.h"


#import "DBManager.h"
#import "SelectedStock.h"


@interface StockDetailViewController () {
    
    UIScrollView *_bgView;
    UIImageView *_kLineImageView;
    NSMutableArray *_dataArray;
    FivePriceView *_fivePriceView;
}

@end

@implementation StockDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = [NSString stringWithFormat:@"%@", _listModel.name];
    
    [self requestStockInfo];
    
    [self createBgView];
    
    [self createFivePriceView];
    
    [self createKSelectView];
    
    [self createRefreshBtn];
    
    [self createAddBtn];
    
    
}

#pragma mark -----------------创建背景图片-----------
- (void)createBgView {
    
    _bgView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, KScreenHeight)];
    
//    _bgView.contentSize = CGSizeMake(0, KScreenHeight -64);
//    _bgView.showsVerticalScrollIndicator = NO;
    _bgView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_bgView];
}

#pragma mark ------------------创建k线选择条-----------------------
- (void)createKSelectView {
    
    //选择条
    UIView *kSelectView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, 40)];
    
    //-----------------------------------1.实时按钮
    UIButton *realtimeButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth/4.0, 40)];
    realtimeButton.backgroundColor = [UIColor purpleColor];
    [realtimeButton setTitle:@"实时" forState:UIControlStateNormal];
    
    [realtimeButton addTarget:self action:@selector(realtimeBtnAct:) forControlEvents:UIControlEventTouchDown];
    
    [kSelectView addSubview:realtimeButton];
    
    
    //-----------------------------------2.日k按钮
    UIButton *kDailyButton = [[UIButton alloc] initWithFrame:CGRectMake(KScreenWidth/4.0, 0, KScreenWidth/4.0, 40)];
    kDailyButton.backgroundColor = [UIColor purpleColor];
    [kDailyButton setTitle:@"日k" forState:UIControlStateNormal];
    
    [kDailyButton addTarget:self action:@selector(kDailyBtnAct:) forControlEvents:UIControlEventTouchDown];
    
    [kSelectView addSubview:kDailyButton];
    
    
    //-----------------------------------3.周k按钮
    UIButton *kWeeklyButton = [[UIButton alloc] initWithFrame:CGRectMake(KScreenWidth/4.0 *2, 0, KScreenWidth/4.0, 40)];
    kWeeklyButton.backgroundColor = [UIColor purpleColor];
    [kWeeklyButton setTitle:@"周k" forState:UIControlStateNormal];
    
    [kWeeklyButton addTarget:self action:@selector(kWeeklyBtnAct:) forControlEvents:UIControlEventTouchDown];
    
    [kSelectView addSubview:kWeeklyButton];
    
    
    //-----------------------------------4.月k按钮
    UIButton *kMonthlyButton = [[UIButton alloc] initWithFrame:CGRectMake(KScreenWidth/4.0 *3, 0, KScreenWidth/4.0, 40)];
    kMonthlyButton.backgroundColor = [UIColor purpleColor];
    [kMonthlyButton setTitle:@"月k" forState:UIControlStateNormal];
    
    [kMonthlyButton addTarget:self action:@selector(kMonthlyBtnAct:) forControlEvents:UIControlEventTouchDown];
    
    [kSelectView addSubview:kMonthlyButton];
    
    [_bgView addSubview:kSelectView];
    
    
}


#pragma mark -----------k线图片
- (void)createkLineView:(NSString *)urlStr{
    
    _kLineImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 40, KScreenWidth, 230)];
    
//    _stockDetailModel = [_dataArray lastObject];
//    urlStr = _stockDetailModel.minurl;
    
    [_kLineImageView sd_setImageWithURL:[NSURL URLWithString:urlStr] placeholderImage:[UIImage imageNamed:@"stock_bg@2x.gif"]];
    
    NSLog(@"111111111111111111111_stockDetailModel.minurl::%@", _stockDetailModel.minurl);
    
    [_bgView addSubview:_kLineImageView];
}


#pragma mark ------------五档视图
- (void)createFivePriceView {
    
    NSBundle *rootBundle = [NSBundle mainBundle];
    _fivePriceView = [[rootBundle loadNibNamed:@"FivePriceView" owner:nil options:nil] lastObject];
    _fivePriceView.frame = CGRectMake(0, 260, KScreenWidth /2.0, 300);
    
    [_bgView addSubview:_fivePriceView];
    
}



#pragma mark ---------------网络请求
- (void)requestStockInfo {
    
    NSString *urlString = @"http://web.juhe.cn:8080/finance/stock/hs";
    
    //获取点击的这个股票的代号
    NSString *gidStr = _listModel.symbol;
    NSLog(@"symbol::::::::::::%@:::::::::::", gidStr);
    
    _stockDetailModel = [[StockDetailModel alloc] init];

    _dataArray = [NSMutableArray array];
    
    [[AFHTTPSessionManager manager] GET:urlString parameters:@{@"gid":gidStr, @"key":kJHGuPiaoShuJuKey} success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        NSDictionary *dic = (NSDictionary *)responseObject;
        NSArray *result = [dic objectForKey:@"result"];
        NSDictionary *result2 = [result lastObject];
        
        NSDictionary *data = [result2 objectForKey:@"data"];
        [_stockDetailModel setValuesForKeysWithDictionary:data];
        [_dataArray addObject:_stockDetailModel];
        
        NSDictionary *dapandata = [result2 objectForKey:@"dapandata"];
        [_stockDetailModel setValuesForKeysWithDictionary:dapandata];
        [_dataArray addObject:_stockDetailModel];
        
        NSDictionary *gopicture = [result2 objectForKey:@"gopicture"];
        [_stockDetailModel setValuesForKeysWithDictionary:gopicture];
        [_dataArray addObject:_stockDetailModel];
        
        //有两个数据是错的，这里找两个对的替换
        _stockDetailModel.increPri = _listModel.pricechange;
        _stockDetailModel.increase = _listModel.changepercent;
        [_dataArray addObject:_stockDetailModel];
        
        //NSLog(@"dic:%@", dic);
        //NSLog(@"result:%@", result);
        NSLog(@"这是五档数据和今开今收最高最低：：data:%@", data);
        NSLog(@"--------------------大盘数据：%@-------------", dapandata);
        NSLog(@"-=-=-=-=-=-=-=-=-=-图片地址：%@-=-=-=-=-=-=-=-", gopicture);
        
        _fivePriceView.datas = [_dataArray copy];
        
        NSLog(@"模型模型_stockDetailModel:::::::%@", _stockDetailModel);
        
        [self createkLineView:_stockDetailModel.minurl];
        
        
    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        
        NSLog(@"requestStockInfo失败！！！");
    }];
}


#pragma mark ---------------------k线按钮点击事件
- (void)realtimeBtnAct:(UIButton *)sender {
    [_kLineImageView removeFromSuperview];
    [self createkLineView:_stockDetailModel.minurl];
}

- (void)kDailyBtnAct:(UIButton *)sender {
    [_kLineImageView removeFromSuperview];
    [self createkLineView:_stockDetailModel.dayurl];
}

- (void)kWeeklyBtnAct:(UIButton *)sender {
    [_kLineImageView removeFromSuperview];
    [self createkLineView:_stockDetailModel.weekurl];
}

- (void)kMonthlyBtnAct:(UIButton *)sender {
    [_kLineImageView removeFromSuperview];
    [self createkLineView:_stockDetailModel.monthurl];
}


#pragma mark ------------------刷新按钮
- (void)createRefreshBtn {
    
    UIButton *refreshButton = [[UIButton alloc] initWithFrame:CGRectMake(KScreenWidth -50, KScreenHeight -64 -49 -50 -40, 40, 40)];
    
    [refreshButton setImage:[UIImage imageNamed:@"refresh_btn@2x.png"] forState:UIControlStateNormal];
    [refreshButton addTarget:self action:@selector(refreshAct:) forControlEvents:UIControlEventTouchDown];
    [_bgView addSubview:refreshButton];
    
}



- (void)refreshAct:(UIButton *)sender {
    
    [_kLineImageView removeFromSuperview];
    
    [_fivePriceView removeFromSuperview];
    
    [self requestStockInfo];
    
    [self createFivePriceView];
    
    [self createKSelectView];
   
}








#pragma mark -------------------加自选按钮
- (void)createAddBtn {
    UIButton *addButton = [[UIButton alloc] initWithFrame:CGRectMake(KScreenWidth -50, KScreenHeight -64 -49 -50, 40, 40)];
//    [addButton setTitle:@"加" forState:UIControlStateNormal];
    [addButton setImage:[UIImage imageNamed:@"add_btn@2x.png"] forState:UIControlStateNormal];
    [addButton addTarget:self action:@selector(addOptionAct:) forControlEvents:UIControlEventTouchDown];
    [_bgView addSubview:addButton];
}

#pragma mark -------------------加自选按钮点击事件
- (void)addOptionAct:(UIButton *)sender {
    
    NSLog(@"开始加自选");
    
    DBManager *manager = [DBManager shareDBManager];
    NSArray *databaseArray = [manager quaryWithName:@"SelectedStock" withPredicate:nil];
    //遍历数据库，看是否已经存在
    for (SelectedStock *selectedTemp in databaseArray) {
        if ([selectedTemp.stockCode isEqualToString:_listModel.symbol]) {
            NSLog(@"已存在！");
            tipWithMessage(@"该股票已添加，请勿重复添加！");
            return;
        }
    }
    //不存在，创建并添加
    SelectedStock *selectedStock = (SelectedStock *)[manager createMO:@"SelectedStock"];
    selectedStock.stockCode = _listModel.symbol;
    selectedStock.stockName = _listModel.name;
    selectedStock.stockPrice = [_listModel.trade floatValue];
    selectedStock.pricecChange = [_listModel.pricechange floatValue];
    selectedStock.changePercent = [_listModel.changepercent floatValue];
    
    [manager addManagerObject:selectedStock];
    
    tipWithMessage(@"加入自选成功！");
    NSLog(@"加入自选完成！！！");
    
    NSLog(@"沙盒：：：：%@：：：：",NSHomeDirectory());
    
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
