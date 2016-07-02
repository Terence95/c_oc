//
//  TabBarViewController.m
//  Fake_keep2.0
//
//  Created by Terence on 16/6/30.
//  Copyright © 2016年 Terence. All rights reserved.
//

#import "TabBarViewController.h"
#import "TrainViewController.h"
#import "DiscoverViewController.h"
#import "TrendsViewController.h"
#import "MineViewController.h"
#import "NavigationController.h"
#import "Public.h"

@interface TabBarViewController ()

@end

@implementation TabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initTabBarControllers];
}

-(void)initTabBarControllers{
    
    TrainViewController* trainvc = [[TrainViewController alloc] init];
    [self initTabbarWithViewController:trainvc title:@"训练" image:@"train.png" selectedImgName:@"train_on.png"];
    
    // 发现view的初始化和设置它的右btn
    DiscoverViewController* discovervc = [[DiscoverViewController alloc] init];
    [self initTabbarWithViewController:discovervc title:@"发现" image:@"discovery.png" selectedImgName:@"discovery_on.png"];
    
    
    TrendsViewController* trendsvc = [[TrendsViewController alloc] init];
    [self initTabbarWithViewController:trendsvc title:@"关注" image:@"trends.png" selectedImgName:@"trends_on.png"];
    
    
    // “我”界面的初始化和导航栏右边btn的设置
    MineViewController* minevc = [[MineViewController alloc] init];
    [self initTabbarWithViewController:minevc title:@"我" image:@"personal.png" selectedImgName:@"personal_on.png"];

}

-(void)initTabbarWithViewController:(UIViewController*)viewController title:(NSString*)title image:(NSString*)imageName selectedImgName:(NSString*)selectedImgName{
    
    // 取消系统自带渲染
    viewController.tabBarItem.image = [[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    viewController.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImgName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    
    NSMutableDictionary* dic = [NSMutableDictionary dictionary];
    dic[NSForegroundColorAttributeName] = KEEP;
    [viewController.tabBarItem setTitleTextAttributes:dic forState:UIControlStateSelected];
    dic[NSForegroundColorAttributeName] = KEEP_TABBAR_COLOR(168, 179, 168);
    [viewController.tabBarItem setTitleTextAttributes:dic forState:UIControlStateNormal];
    
    NavigationController* navi = [[NavigationController alloc] initWithRootViewController:viewController];
    
    
    // 这个是navigationbar的背景
    [navi.navigationBar setBackgroundImage:[UIImage imageNamed:@"background1.jpeg"] forBarMetrics:UIBarMetricsDefault];
    
    viewController.title = title;
    
    
    /**
     * 设置navibar上面的title的字体颜色
     */
    UIColor * color = [UIColor whiteColor];
    //这里我们设置的是颜色，还可以设置shadow等，具体可以参见api
    NSDictionary * dict = [NSDictionary dictionaryWithObject:color forKey:NSForegroundColorAttributeName];
    navi.navigationBar.titleTextAttributes = dict;
    //大功告成
    [self addChildViewController:navi];
    
    
}

-(void)setCustomerTabBarColor{
    
}
@end
