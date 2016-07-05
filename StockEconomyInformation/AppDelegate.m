//
//  AppDelegate.m
//  StockEconomyInformation
//
//  Created by 陆金鑫 on 15/12/24.
//  Copyright © 2015年 陆金鑫. All rights reserved.
//

#import "AppDelegate.h"
#import "MMDrawerController.h"
#import "MainTabBarController.h"
#import "LeftViewController.h"
#import "RightViewController.h"

@interface AppDelegate ()<UIScrollViewDelegate> {
    
    UIScrollView *_welcomeView;
    MMDrawerController *_drawCtrl;
}


@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    //创建左侧控制器
    //    LeftViewController *leftCtrl = [[LeftViewController alloc] init];
    UIStoryboard *leftSB = [UIStoryboard storyboardWithName:@"Left" bundle:nil];
    LeftViewController *leftCtrl = [leftSB instantiateViewControllerWithIdentifier:@"LeftViewController"];
    
    //创建中间控制器
    MainTabBarController *mainCtrl = [[MainTabBarController alloc] init];
    
    //创建右侧控制器
    //    RightViewController *rightCtrl = [[RightViewController alloc] init];
    UIStoryboard *rightSB = [UIStoryboard storyboardWithName:@"Right" bundle:nil];
    LeftViewController *rightCtrl = [rightSB instantiateViewControllerWithIdentifier:@"RightViewController"];
    
    //创建 MMDrawerCtrl
    _drawCtrl = [[MMDrawerController alloc] initWithCenterViewController:mainCtrl leftDrawerViewController:leftCtrl rightDrawerViewController:rightCtrl];
    
    //设置左侧和右侧的宽度
    [_drawCtrl setMaximumLeftDrawerWidth:260];
    [_drawCtrl setMaximumRightDrawerWidth:300];
    
    //设置手势作用域
    [_drawCtrl setOpenDrawerGestureModeMask:MMOpenDrawerGestureModeBezelPanningCenterView];
    [_drawCtrl setCloseDrawerGestureModeMask:MMCloseDrawerGestureModeAll];
    
    
    self.window.rootViewController = _drawCtrl;
    
    //window 管理 MMDrawerCtrl
//    self.window.rootViewController = drawCtrl;
    
//    self.window.rootViewController = [[StartViewController alloc] init];
    
    //根据当前版本号来确定是否显示引导页
    
    //1.获取当前的版本
    double currentVersion = [[[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"] doubleValue];
    
    NSLog(@"当前版本号是%f",currentVersion);
    
    //用这个对象存储一些系统的配置信息
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    double lastVersion = [[userDefaults objectForKey:@"version"] doubleValue];
    if(currentVersion > lastVersion){
        //已经更新，显示引导页
        
        [userDefaults setObject:@(currentVersion) forKey:@"version"];
        
        _welcomeView = [[UIScrollView alloc] initWithFrame:[UIScreen mainScreen].bounds];
        
        UIViewController *welcomeCtrl = [[UIViewController alloc] init];
        
        for(int i = 0; i <3; i ++){
            
            UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(KScreenWidth *i, 0, KScreenWidth, KScreenHeight)];
            UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"welcome%d@2x.png", i+1]];
            imageView.image = image;
            
            [_welcomeView addSubview:imageView];
            
            //创建分页视图
            UIImageView *pageImg = [[UIImageView alloc] initWithFrame:CGRectMake((KScreenWidth-230)/2, KScreenHeight -100, 230, 18)];
            UIImage *pageImage = [UIImage imageNamed:[NSString stringWithFormat:@"page%d.png",i+1]];
            pageImg.image = pageImage;
            [imageView addSubview:pageImg];
            
        }
        _welcomeView.contentSize = CGSizeMake(3*KScreenWidth, KScreenHeight);
        //设置分页效果
        _welcomeView.pagingEnabled = YES;
        _welcomeView.showsHorizontalScrollIndicator = NO;
        _welcomeView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"start"]];
        _welcomeView.delegate = self;
        
        welcomeCtrl.view = _welcomeView;
        
        self.window.rootViewController = welcomeCtrl;
        
    }else{
        
//        self.window.rootViewController = _drawCtrl;
        return YES;
    }
    
    return YES;
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    if(_welcomeView.contentOffset.x > KScreenWidth *2 +80){
        
//        [UIApplication sharedApplication].keyWindow.rootViewController = [[MainTabBarController alloc] init];
//        AppDelegate *app = (AppDelegate *)[UIApplication sharedApplication].delegate;
//        app.window.rootViewController = _drawCtrl;
        
        self.window.rootViewController = _drawCtrl;
    }
    
}




- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
