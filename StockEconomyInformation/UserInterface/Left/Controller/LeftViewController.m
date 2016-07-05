//
//  LeftViewController.m
//  StockEconomyInformation
//
//  Created by 陆金鑫 on 16/1/9.
//  Copyright © 2016年 陆金鑫. All rights reserved.
//

#import "LeftViewController.h"
#import "SDImageCache.h"
#import "MainTableViewCell.h"

@interface LeftViewController () {
    
    NSArray *_array;
    UITableView *_moreTableView;
//    UILabel *_cacheLabel;
}

@end

@implementation LeftViewController
    
    

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"leftright_bg"]]];
    
    [self createMoreTableView];
    
    [self createTitle];
    
    [self createCopyRightView];
    
}


- (void)createTitle {
//------------标题
    UILabel *titleLabe = [[UILabel alloc] initWithFrame:CGRectMake(10, 20, 300 -20, 40)];
    titleLabe.text = @"更多";
    titleLabe.textColor = [UIColor whiteColor];
    titleLabe.textAlignment = NSTextAlignmentCenter;
    titleLabe.font = [UIFont fontWithName:@"Helvetica-Bold" size:20.0];
    [self.view addSubview:titleLabe];
}

//-----------TableView
- (void)createMoreTableView {
    
    _array = @[@"清理缓存", @"意见反馈", @"商务合作", @"给个评价", @"检查更新", @"关于作者", @"关于软件"];
    _moreTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, 260, KScreenHeight -64) style:UITableViewStyleGrouped];
    _moreTableView.delegate = self;
    _moreTableView.dataSource = self;
    _moreTableView.backgroundColor = [UIColor clearColor];
    
//    _moreTableView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:_moreTableView];
    
    //创建约束
    NSString *tableViewH = @"H:|-speace-[_moreTableView]-speace-|";
    NSString *tableViewV = @"V:|-speace-[_moreTableView]-speace-|";
    
    //编译约束
    NSArray *tHs = [NSLayoutConstraint constraintsWithVisualFormat:tableViewH options:NSLayoutFormatDirectionLeadingToTrailing metrics:@{@"speace":@0} views:NSDictionaryOfVariableBindings(_moreTableView)];
    NSArray *tVs = [NSLayoutConstraint constraintsWithVisualFormat:tableViewV options:NSLayoutFormatDirectionLeadingToTrailing metrics:@{@"speace":@0} views:NSDictionaryOfVariableBindings(_moreTableView)];
    
    //添加约束
    [self.view addConstraints:tHs];
    [self.view addConstraints:tVs];
    
}

//-----------TableView 代理方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _array.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"moreCell";
    MainTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        //没有，创建
        cell = [[MainTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
        cell.textLabel.textColor = [UIColor whiteColor];
        cell.backgroundColor = [UIColor clearColor];
    }
    if (indexPath.row == 0) {
        cell.cacheLabel.text = [self getCacheSize];
        NSLog(@"%@",[self getCacheSize]);
        
    }else{
    
//        cacheLabel.text = nil;
    }
    //有，直接使用
    cell.textLabel.text = _array[indexPath.row];
    return cell;
}


//-----------TableView 点击事件
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row == 0) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"真的要清理缓存吗？" delegate:self cancelButtonTitle:@"不要" otherButtonTitles:@"清理", nil];
        alert.tag = 2000;
        [alert show];
    }
    
    if (indexPath.row == 1) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@" 有意见？" message:@"不接受你的意见！" delegate:self cancelButtonTitle:@"鄙视！" otherButtonTitles:@"还是鄙视！", nil];
        alert.tag = 2001;
        [alert show];
    }
    
    if (indexPath.row == 2) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@" 想要合作？" message:@"不跟你合作！" delegate:self cancelButtonTitle:@"点右边👉" otherButtonTitles:@"👈点左边", nil];
        alert.tag = 2002;
        [alert show];
    }
    
    if (indexPath.row == 3) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@" 想给差评？" message:@"来啊，给个差评！" delegate:self cancelButtonTitle:@"给个好评！" otherButtonTitles:@"不，给两个！", nil];
        alert.tag = 2003;
        [alert show];
    }
    
    if (indexPath.row == 4) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@" 想要更新？" message:@"还没上架！" delegate:self cancelButtonTitle:@"打款支持！" otherButtonTitles:@"砸锅卖铁！", nil];
        alert.tag = 2004;
        [alert show];
    }
    
    if (indexPath.row == 5) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@" 想撩我？" message:@"你确定要撩我？" delegate:self cancelButtonTitle:@"对啊！" otherButtonTitles:@"不然呢！", nil];
        alert.tag = 2005;
        [alert show];
    }
    
    if (indexPath.row == 6) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"关于 " message:@"下面没了！" delegate:self cancelButtonTitle:@"真的没了！" otherButtonTitles:@"真的！！！", nil];
        alert.tag = 2006;
        [alert show];
    }
    
}

//---------AlertView 点击事件
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 1) {
        
        NSFileManager *filemanager = [NSFileManager defaultManager];
        NSString *cacheFilePath = [NSHomeDirectory() stringByAppendingPathComponent:@"Library/Caches/com.hackemist.SDWebImageCache.default"];
        [filemanager removeItemAtPath:cacheFilePath error:nil];
        
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:0 inSection:0];
        [_moreTableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        [[SDImageCache sharedImageCache] clearDisk];
        
        [_moreTableView reloadData];
        
        
//        if ([self.view viewWithTag:2001].tag == 2001) {
//            
//        }
        
    }
    
//    if ([self.view viewWithTag:2001].tag == 2001) {
//        if (buttonIndex == 1) {
//            
//        }
//    }
    
}


//--------计算缓存大小
- (NSString *)getCacheSize {
    long long sum = 0;
    // 1.获取缓存图片所在的文件地址
    NSLog(@"%@",NSHomeDirectory());
    NSString *filePath = [NSHomeDirectory() stringByAppendingPathComponent:@"Library/Caches/com.hackemist.SDWebImageCache.default"];
    // 2.计算文件的大小
    NSFileManager *fileManager = [NSFileManager defaultManager];
    // 01 获取当前文件夹下所有的文件
    NSArray *subPaths = [fileManager subpathsAtPath:filePath];
    // 遍历所有图片的路径
    for (NSString *subPath in subPaths) {
        // 获取图片的完整路径
        NSString *imagePath = [filePath stringByAppendingPathComponent:subPath];
        // 获取当前图片的大小
        NSDictionary *imageDic = [fileManager attributesOfItemAtPath:imagePath error:nil];
        sum += [imageDic fileSize];
    }
    
    NSLog(@"这是万恶的缓存：%lld", sum);
    return [NSString stringWithFormat:@"%.2fM", sum /(1000.0 *1000.0)];
    
    
}


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    [_moreTableView reloadData];
    
}

- (void)createCopyRightView {
    
    UILabel *copyRightLb = [[UILabel alloc] initWithFrame:CGRectMake(0, KScreenHeight -36, 260, 20)];
    
    copyRightLb.text = @"—Designed by Lu_Sir—";
    copyRightLb.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:copyRightLb];
    
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

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
