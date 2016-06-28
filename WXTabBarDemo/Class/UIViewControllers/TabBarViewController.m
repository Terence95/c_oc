//
//  TabBarViewController.m
//  WXTabBarDemo
//
//  Created by Terence on 16/6/27.
//  Copyright © 2016年 Terence. All rights reserved.
//

#import "TabBarViewController.h"
#import "HomeViewController.h"
#import "ContantViewController.h"
#import "FindViewController.h"
#import "MineViewController.h"
#import "GuideViewController.h"
#import "NavigationController.h"

#define WX_TabBar_Color(r, g, b)  [UIColor colorWithRed:(r)/255. green:(g)/255. blue:(b)/255. alpha:1.]
@interface TabBarViewController ()

@end

@implementation TabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initTabBarCtrls];
}

-(void)initTabBarCtrls{
    HomeViewController* home = [[HomeViewController alloc] init];
    [self initTabBarWithViewController:home title:@"Wechat" image:@"tabbar_mainframe.png"  selectedImg:@"tabbar_mainframeHL.png"];
    
    ContantViewController* contant = [[ContantViewController alloc] init];
    [self initTabBarWithViewController:contant title:@"contant" image:@"tabbar_contacts.png" selectedImg:@"tabbar_contactsHL.png"];
    
    
    FindViewController* find = [[FindViewController alloc] init];
    [self initTabBarWithViewController:find title:@"find" image:@"tabbar_discover.png" selectedImg:@"tabbar_discoverHL.png"];
    
    MineViewController* mine = [[MineViewController alloc] init];
    [self initTabBarWithViewController:mine title:@"wo" image:@"tabbar_me.png" selectedImg:@"tabbar_meHL.png"];
}


-(void)initTabBarWithViewController:(UIViewController*)vc title:(NSString*)title image:(NSString*)imageName selectedImg:(NSString*)selectedImageName{
    //1.取消系统自带的渲染模式
    vc.tabBarItem.image = [[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    vc.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    //2.修改tabbar 文字的颜色
    NSMutableDictionary* dic = [NSMutableDictionary dictionary];
    dic[NSForegroundColorAttributeName] = WX_TabBar_Color(9, 187, 7);
    [vc.tabBarItem setTitleTextAttributes:dic forState:UIControlStateSelected];
    dic[NSForegroundColorAttributeName] = WX_TabBar_Color(168, 179, 168);
    [vc.tabBarItem setTitleTextAttributes:dic forState:UIControlStateNormal];
    
    NavigationController* navi = [[NavigationController alloc] initWithRootViewController:vc];
    
    
    vc.title = title;
    
    [self addChildViewController:navi];
    
}

-(void)initViewControllers{
    
}


-(void)buildTabBarWithController:(UIViewController*)viewController{
    
}



@end
