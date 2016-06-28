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


/**
 *  初始化一级控制器
 */
-(void)initTabBarCtrls{
    HomeViewController* home = [[HomeViewController alloc] init];
    [self initTabBarWithViewController:home title:@"微信" image:@"tabbar_mainframe.png"  selectedImg:@"tabbar_mainframeHL.png"];
     home.tabBarItem.badgeValue = @"99+";
    
    ContantViewController* contant = [[ContantViewController alloc] init];
    [self initTabBarWithViewController:contant title:@"通讯录" image:@"tabbar_contacts.png" selectedImg:@"tabbar_contactsHL.png"];
     contant.tabBarItem.badgeValue = @"99+";
    
    FindViewController* find = [[FindViewController alloc] init];
    [self initTabBarWithViewController:find title:@"发现" image:@"tabbar_discover.png" selectedImg:@"tabbar_discoverHL.png"];
     find.tabBarItem.badgeValue = @"99+";
    
    MineViewController* mine = [[MineViewController alloc] init];
    [self initTabBarWithViewController:mine title:@"我" image:@"tabbar_me.png" selectedImg:@"tabbar_meHL.png"];
    
    
    CGFloat version = [[UIDevice currentDevice].systemVersion floatValue];
    
    if (version>8.0) {
        UIUserNotificationSettings* setting = [UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeBadge categories:nil];
        
        [[UIApplication sharedApplication] registerUserNotificationSettings:setting];
    }
    
    [UIApplication sharedApplication].applicationIconBadgeNumber = 999;
}

/**
 *  构建tabbarview
 *
 *  @param vc                <#vc description#>
 *  @param title             <#title description#>
 *  @param imageName         <#imageName description#>
 *  @param selectedImageName <#selectedImageName description#>
 */
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



@end
