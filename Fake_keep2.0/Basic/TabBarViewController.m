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
    
    DiscoverViewController* discovervc = [[DiscoverViewController alloc] init];
    [self initTabbarWithViewController:discovervc title:@"发现" image:@"discovery.png" selectedImgName:@"discovery_on.png"];
    
    
    TrendsViewController* trendsvc = [[TrendsViewController alloc] init];
    [self initTabbarWithViewController:trendsvc title:@"关注" image:@"trends.png" selectedImgName:@"trends_on.png"];
    
    MineViewController* minevc = [[MineViewController alloc] init];
    [self initTabbarWithViewController:minevc title:@"我" image:@"personal.png" selectedImgName:@"personal_on.png"];
    

}

-(void)initTabbarWithViewController:(UIViewController*)viewController title:(NSString*)title image:(NSString*)imageName selectedImgName:(NSString*)selectedImgName{
    
    
    // 取消系统自带渲染
    viewController.tabBarItem.image = [[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    viewController.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImgName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    
    NavigationController* navi = [[NavigationController alloc] initWithRootViewController:viewController];
    
    [navi.navigationBar setBackgroundImage:[UIImage imageNamed:@"background.png"] forBarMetrics:UIBarMetricsDefault];
    
    viewController.title = title;
    
    [self addChildViewController:viewController];
    
    
    
}

@end
