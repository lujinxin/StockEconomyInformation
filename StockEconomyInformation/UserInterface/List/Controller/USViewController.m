//
//  USViewController.m
//  StockEconomyInformation
//
//  Created by 陆金鑫 on 16/4/27.
//  Copyright © 2016年 陆金鑫. All rights reserved.
//

#import "USViewController.h"
#import "AFNetworking.h"
#import "MJRefresh.h"

static NSString *idenSZ = @"ListCell";


@interface USViewController () {
    
    ListModel *_tempModel;
    
}

@end

@implementation USViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self requestUSListData];
    
    [self createSearchBar];
    
    [self createListHeader];
    
    [self createUSListTableView];
    
    
}




#pragma mark ----------------------创建搜索条(40)-----------------------
- (void)createSearchBar {
    
    //搜索条
    UIView *searchBarView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, 40)];
    searchBarView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"search_bg@2x.png"]];
    //搜索框
    _searchTextField = [[UITextField alloc] initWithFrame:CGRectMake(8, 3, KScreenWidth -8 -20 -15 -45, 35)];
    _searchTextField.backgroundColor = [UIColor whiteColor];
    _searchTextField.borderStyle = UITextBorderStyleRoundedRect;
    _searchTextField.placeholder = @"🔍输入股票代码以搜索,仅支持沪深";
    _searchTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    _searchTextField.keyboardType = UIKeyboardTypeNumberPad;
    
    [searchBarView addSubview:_searchTextField];
    
    //搜索按钮
    UIButton *searchButton = [[UIButton alloc] initWithFrame:CGRectMake(KScreenWidth - 85, 0, 75, 40)];
    [searchButton setTitle:@"搜索" forState: UIControlStateNormal];
    [searchButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [searchButton setImage:[UIImage imageNamed:@"search_btn@2x.png"] forState:UIControlStateNormal];
    
#pragma TODO 添加点击事件！！！
    [searchButton addTarget:self action:@selector(searchBtnAct:) forControlEvents:UIControlEventTouchUpInside];
    
    [searchBarView addSubview:searchButton];
    [self.view addSubview:searchBarView];
    
}




#pragma mark ---------------------创建列表头(30 +40)-----------------------
- (void)createListHeader {
    
    //表头条
    UIView *listHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 40, KScreenWidth, 30)];
    listHeaderView.backgroundColor = [UIColor grayColor];
    //股票名称
    UILabel *stockNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 110, 30)];
    stockNameLabel.text = @"股票名称";
    stockNameLabel.textAlignment = NSTextAlignmentCenter;
    //现价
    UILabel *stockPriceLabel = [[UILabel alloc] initWithFrame:CGRectMake(108, 0, 80, 30)];
    stockPriceLabel.text = @"现价";
    stockPriceLabel.textAlignment = NSTextAlignmentCenter;
    //涨跌
    UILabel *stockUpDownLabel = [[UILabel alloc] initWithFrame:CGRectMake(195, 0, 80, 30)];
    stockUpDownLabel.text = @"涨跌";
    stockUpDownLabel.textAlignment = NSTextAlignmentCenter;
    //涨跌幅
    UILabel *stockUpdownPercentLabel = [[UILabel alloc] initWithFrame:CGRectMake(285, 0, 80, 30)];
    stockUpdownPercentLabel.text = @"涨幅";
    stockUpdownPercentLabel.textAlignment = NSTextAlignmentCenter;
    
    [listHeaderView addSubview:stockNameLabel];
    [listHeaderView addSubview:stockPriceLabel];
    [listHeaderView addSubview:stockUpDownLabel];
    [listHeaderView addSubview:stockUpdownPercentLabel];
    [self.view addSubview:listHeaderView];
}


//-------------------创建沪股列表 tableview
- (void)createUSListTableView {
    
    _usListTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 70, KScreenWidth, KScreenHeight -64 -44 -49 -70) style:UITableViewStylePlain];
    _usListTableView.delegate = self;
    _usListTableView.dataSource = self;
    
    [_usListTableView registerNib:[UINib nibWithNibName:@"ListCell" bundle:nil] forCellReuseIdentifier:idenSZ];
    
    _usListTableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self requestUSListData];
        [_usListTableView reloadData];
        [_usListTableView.header endRefreshing];
    }];
    
    _usListTableView.footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        
        [_usListTableView.footer endRefreshing];
    }];
    
    _usListTableView.rowHeight = 60;
    
    [self.view addSubview:_usListTableView];
}

//-----------------tableview代理方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return _usListArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ListCell *listCell = [tableView dequeueReusableCellWithIdentifier:idenSZ forIndexPath:indexPath];
    
    listCell.listModel = _usListArray[indexPath.row];
    _tempModel = listCell.listModel;
    
    return listCell;
}

#pragma mark ------------------------单元格点击事件-------------------------
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    _hkusDetailVC = [[HKUSDetailViewController alloc] init];
    
    _hkusDetailVC.listModel =_usListArray[indexPath.row];
    
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:_hkusDetailVC];
    
    nav.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self.navigationController pushViewController:_hkusDetailVC animated:YES];
    [_searchTextField resignFirstResponder];
}

//------------------网络请求
- (void)requestUSListData {
    
    _usListArray = [NSMutableArray array];
    
    [[AFHTTPSessionManager manager] GET:@"http://web.juhe.cn:8080/finance/stock/usaall" parameters:@{@"type":@4,@"key":kJHGuPiaoShuJuKey,@"page":@1} success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        
        NSDictionary *dic = (NSDictionary *)responseObject;
        NSDictionary *result = [dic objectForKey:@"result"];
        NSArray *data = [result objectForKey:@"data"];
        for (NSDictionary *dics in data) {
            
            ListModel *model = [[ListModel alloc] init];
            [model setValuesForKeysWithDictionary:dics];
            [_usListArray addObject:model];
        }
        
        
        [_usListTableView reloadData];
        
    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        
        NSLog(@"美股列表请求失败！！！");
        
    }];
    
    [_searchTextField resignFirstResponder];
}


#pragma mark ---------------搜索按钮点击事件
- (void)searchBtnAct:(UIButton *)sender {
    
    NSLog(@"美股美股美股美股      搜索按钮被点击！！！");
    NSString *senderStr = _searchTextField.text;
    NSString *gidStr = [[NSString alloc] init];
    
    if ([senderStr hasPrefix:@"6"] && (senderStr.length == 6)) {
        gidStr = [NSString stringWithFormat:@"sh%@", senderStr];
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:_stockDetailVC];
        _stockDetailVC = [[StockDetailViewController alloc] init];
        
        _tempModel.symbol = gidStr;
        _stockDetailVC.listModel = _tempModel;
        nav.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
        [self.navigationController pushViewController:_stockDetailVC animated:YES];
        [_searchTextField resignFirstResponder];
    } else if ([senderStr hasPrefix:@"0"] && (senderStr.length == 6)) {
        gidStr = [NSString stringWithFormat:@"sz%@", senderStr];
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:_stockDetailVC];
        _stockDetailVC = [[StockDetailViewController alloc] init];
        _tempModel.symbol = gidStr;
        _stockDetailVC.listModel = _tempModel;
        nav.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
        [self.navigationController pushViewController:_stockDetailVC animated:YES];
        [_searchTextField resignFirstResponder];
    } else {
        tipWithMessage(@"请输入正确的股票代码！");
        _searchTextField.text = @"";
        return;
    }
    
    
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
    [self.view resignFirstResponder];
    [_searchTextField resignFirstResponder];
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
