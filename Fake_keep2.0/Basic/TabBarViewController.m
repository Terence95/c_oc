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
    
//    TrainViewController* trainvc = [[TrainViewController alloc] init];
//    [self initTabbarWithViewController:trainvc title:@"训练" image:@"train.png" selectedImgName:@"train_on.png"];
    
    TrainViewController* trainvc = [[TrainViewController alloc] init];
    [self initTrainTabbarWithViewController:trainvc image:@"train.png" selectedImgName:@"train_on.png"];
    
    
    // 发现view的初始化和设置它的右btn
    DiscoverViewController* discovervc = [[DiscoverViewController alloc] init];
    [self initTabbarWithViewController:discovervc title:@"发现" image:@"discovery.png" selectedImgName:@"discovery_on.png"];
    UIBarButtonItem* discoveryNavRightBtn = [[UIBarButtonItem alloc] init];
    UIImage* discoveryRightbtnImg = [UIImage imageNamed:@"searchicon.png"];
    discoveryRightbtnImg = [discoveryRightbtnImg imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [discoveryNavRightBtn setImage:discoveryRightbtnImg];
    discovervc.navigationItem.rightBarButtonItem = discoveryNavRightBtn;
    
    
    TrendsViewController* trendsvc = [[TrendsViewController alloc] init];
    [self initTabbarWithViewController:trendsvc title:@"关注" image:@"trends.png" selectedImgName:@"trends_on.png"];
    UIBarButtonItem* trendsLeftBtn = [[UIBarButtonItem alloc] init];
    UIImage* trendsLeftBtnImg = [UIImage imageNamed:@"add.png"];
    trendsLeftBtnImg = [trendsLeftBtnImg imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [trendsLeftBtn setImage:trendsLeftBtnImg];
    trendsvc.navigationItem.leftBarButtonItem = trendsLeftBtn;
    
    UIBarButtonItem* trendsRightBtn = [[UIBarButtonItem alloc] init];
    UIImage* trendsRightBtnImg = [UIImage imageNamed:@"news.png"];
    trendsRightBtnImg = [trendsRightBtnImg imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [trendsRightBtn setImage:trendsRightBtnImg];
    trendsvc.navigationItem.rightBarButtonItem = trendsRightBtn;
    
//    // btn控制两个scrollview
//    UIView* titleBtnView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 120, 40)];
////    titleBtnView.backgroundColor = [UIColor greenColor];
//    UIButton* titleBtn1 = [[UIButton alloc] initWithFrame:CGRectMake((titleBtnView.frame.size.width - 110)/2, 0, 55, 40)];
////    titleBtn1.backgroundColor = [UIColor redColor];
//    [titleBtn1 setTitle:@"已关注" forState:UIControlStateNormal];
//    [titleBtn1.titleLabel setFont:[UIFont systemFontOfSize:14.f]];
//    UIButton* titleBtn2 = [[UIButton alloc] initWithFrame:CGRectMake((titleBtnView.frame.size.width - 110)/2+55, 0, 55, 40)];
////    titleBtn2.backgroundColor = [UIColor blueColor];
//    [titleBtn2 setTitle:@"小组" forState:UIControlStateNormal];
//    [titleBtn2.titleLabel setFont:[UIFont systemFontOfSize:14.f]];
//    [titleBtnView addSubview:titleBtn1];
//    [titleBtnView addSubview:titleBtn2];
//    trendsvc.navigationItem.titleView = titleBtnView;
    
    
    
    
    
    
    // “我”界面的初始化和导航栏右边btn的设置
    MineViewController* minevc = [[MineViewController alloc] init];
    [self initTabbarWithViewController:minevc title:@"我" image:@"personal.png" selectedImgName:@"personal_on.png"];
    
    UIBarButtonItem* mineNavRightBtn = [[UIBarButtonItem alloc] init];
    UIImage* mineRightbtnImg = [UIImage imageNamed:@"install.png"];
    mineRightbtnImg = [mineRightbtnImg imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [mineNavRightBtn setImage:mineRightbtnImg];
    minevc.navigationItem.rightBarButtonItem = mineNavRightBtn;
    
    
    
    
    

}

-(void)initTabbarWithViewController:(UIViewController*)viewController title:(NSString*)title image:(NSString*)imageName selectedImgName:(NSString*)selectedImgName{
    
    
    // 取消系统自带渲染
    viewController.tabBarItem.image = [[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    viewController.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImgName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    
    NSMutableDictionary* dic = [NSMutableDictionary dictionary];
//    dic[NSForegroundColorAttributeName] = KEEP_TABBAR_COLOR(9, 187, 7);
    dic[NSForegroundColorAttributeName] = KEEP;
//    [UIColor colorWithRed:0.341  green:0.306  blue:0.376 alpha:1]
    [viewController.tabBarItem setTitleTextAttributes:dic forState:UIControlStateSelected];
    dic[NSForegroundColorAttributeName] = KEEP_TABBAR_COLOR(168, 179, 168);
    [viewController.tabBarItem setTitleTextAttributes:dic forState:UIControlStateNormal];
    
    NavigationController* navi = [[NavigationController alloc] initWithRootViewController:viewController];
    
    [navi.navigationBar setBackgroundImage:[UIImage imageNamed:@"background1.png"] forBarMetrics:UIBarMetricsDefault];
    
    viewController.title = title;
    
    //选择自己喜欢的颜色
    UIColor * color = [UIColor whiteColor];
    
    //这里我们设置的是颜色，还可以设置shadow等，具体可以参见api
    NSDictionary * dict = [NSDictionary dictionaryWithObject:color forKey:NSForegroundColorAttributeName];
    navi.navigationBar.titleTextAttributes = dict;
    //大功告成
    [self addChildViewController:navi];
    
    
}

-(void)initTrainTabbarWithViewController:(UIViewController*)viewController image:(NSString*)imageName selectedImgName:(NSString*)selectedImgName{
    // 取消系统自带渲染
    viewController.tabBarItem.image = [[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    viewController.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImgName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    
    
    
    
    NSMutableDictionary* dic = [NSMutableDictionary dictionary];
    dic[NSForegroundColorAttributeName] = KEEP;
    [viewController.tabBarItem setTitleTextAttributes:dic forState:UIControlStateSelected];
    dic[NSForegroundColorAttributeName] = KEEP_TABBAR_COLOR(168, 179, 168);
    [viewController.tabBarItem setTitleTextAttributes:dic forState:UIControlStateNormal];
    
    NavigationController* navi = [[NavigationController alloc] initWithRootViewController:viewController];
    UIImageView* titleLogoView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"keep_logo.png"]];
    
//    navi.navigationItem.titleView = titleLogoView;
    [navi.navigationBar setBackgroundImage:[UIImage imageNamed:@"background1.png"] forBarMetrics:UIBarMetricsDefault];
//    viewController.title = @"训练";
    
    viewController.tabBarItem.title = @"训练";
    viewController.navigationItem.titleView = titleLogoView;
    UIBarButtonItem* rightbarbutton = [[UIBarButtonItem alloc] init];
    UIImage* rightimg = [UIImage imageNamed:@"plusbtn_on.png"];
    // 取消系统自带渲染
    rightimg = [rightimg imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [rightbarbutton setImage:rightimg];
    viewController.navigationItem.rightBarButtonItem = rightbarbutton;
    
    
    
    UIBarButtonItem* leftbarbutton = [[UIBarButtonItem alloc] init];
    UIImage* leftimg = [UIImage imageNamed:@"run_data_list_run.png"];
//    [leftbarbutton setImage:[UIImage imageNamed:@"run_data_list_run.png"]];
    
    leftimg = [leftimg imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    [leftbarbutton setImage:leftimg];
    viewController.navigationItem.leftBarButtonItem = leftbarbutton;
    //选择自己喜欢的颜色
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
