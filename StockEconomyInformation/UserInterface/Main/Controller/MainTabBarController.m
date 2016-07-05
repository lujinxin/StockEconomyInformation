//
//  MainTabBarController.m
//  StockEconomyInformation
//
//  Created by 陆金鑫 on 16/1/8.
//  Copyright © 2016年 陆金鑫. All rights reserved.
//

#import "MainTabBarController.h"

@interface MainTabBarController () {
    
//    UIImageView *_tabBarView;
    UIImageView *_selectedImgView;
    UIButton *_button;
    NSMutableArray *_buttons;
}

@end

@implementation MainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self _createViewControllers];
    
    [self _removeTabBarSubviews];
    
    [self _createTabBarView];
    
}

//------------------------------创建子控制器----------------------------
- (void)_createViewControllers {
    
    //故事版的名字
    NSArray *storyboardNames = @[@"Home", @"List", @"Options", @"News", @"More"];
    //五个控制器
    NSMutableArray *viewCtrls = [NSMutableArray arrayWithCapacity:storyboardNames.count];
    for (int i = 0; i < storyboardNames.count; i++) {
        NSString *sbName = [storyboardNames objectAtIndex:i];
        UIStoryboard *sb = [UIStoryboard storyboardWithName:sbName bundle:nil];
        //从故事版加载
        UIViewController *viewCtrl = [sb instantiateInitialViewController];
        
        [viewCtrls addObject:viewCtrl];
    }
    
    self.viewControllers = viewCtrls;
    
}


//--------------------------移除 TabBar 上的默认的按钮------------------------
- (void)_removeTabBarSubviews {
    
    NSArray *subviews = self.tabBar.subviews;
    
    for (UIView *view in subviews) {
        
        //定义 UITabBarButton 类
        Class tabBarButtonClass = NSClassFromString(@"UITabBarButton");
        if ([view isKindOfClass:tabBarButtonClass]) {
            [view removeFromSuperview];
        }
    }
    
}


//----------------------------创建 TabBar 上的按钮-------------------------
- (void)_createTabBarView {
    self.tabBar.backgroundImage = [UIImage imageNamed:@"tabBar_bg@2x.png"];
    
//    self.tabBar.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"tabBar_bg"]];
//    [self.tabBar setTintColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"tabBar_bg"]]];
    
//    _tabBarView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, 49)];
//    _tabBarView.image = [UIImage imageNamed:@"tabBar_bg"];
//    _tabBarView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"tabBar_bg"]];
    
    
//    [self.tabBar addSubview:_tabBarView];
    CGFloat buttonWidth = KScreenWidth/5.0;
    _selectedImgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, buttonWidth, 49)];
    _selectedImgView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"tab_selected"]];
//    _selectedImgView.image = [UIImage imageNamed:@"tab_selected"];
//    _selectedImgView.alpha = 0.8;
    [self.tabBar addSubview:_selectedImgView];
    NSArray *imgNames = @[@"tab_home", @"tab_list", @"tab_options", @"tab_news", @"tab_more"];
    NSArray *selectedImgNames = @[@"tab_home1", @"tab_list1", @"tab_options1", @"tab_news1", @"tab_more1"];
    _buttons = [NSMutableArray array];
    for (int i = 0; i <imgNames.count; i++) {
        NSString *imgName = imgNames[i];
        NSString *selectedImgName = selectedImgNames[i];
        _button = [[UIButton alloc] initWithFrame:CGRectMake(buttonWidth * i, 0, buttonWidth, 49)];
        _button.tag = i +1000;
        _button.selected = NO;
        [_button setImage:[UIImage imageNamed:imgName] forState:UIControlStateNormal];
        [_button setImage:[UIImage imageNamed:selectedImgName] forState:UIControlStateSelected];
        [_button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        [_buttons addObject:_button];
        [self.tabBar addSubview:_button];
    }
    _button = (UIButton *)[self.view viewWithTag:1000];
    _button.selected = YES;
}


- (void)buttonAction:(UIButton *)button {
    
    self.selectedIndex = button.tag -1000;
    
    button.selected = !button.selected;
    for (UIButton *btn in _buttons) {
        btn.selected = NO;
        
    }
    
    button.selected = YES;
    
    [UIView animateWithDuration:.3 animations:^{
        _selectedImgView.center = button.center;
    }];
    
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
