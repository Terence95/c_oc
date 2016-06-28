//
//  CustomTabBarController.m
//  CustomTabBar
//
//  Created by Terence on 16/6/28.
//  Copyright © 2016年 Terence. All rights reserved.
//

#import "CustomTabBarController.h"
#import "TabBarButton.h"
@interface CustomTabBarController ()

@property(nonatomic, strong)UIButton* btn;

@end

@implementation CustomTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    
    // 删除现有的tabbar，CGRect结构在屏幕上定义了一个矩形,而且是在tabbar的位置
    CGRect rect = self.tabBar.frame;
    
    // 移除现有的tabbar
    [self.tabBar removeFromSuperview];
    
    // 自己添加视图
    UIView *myview = [[UIView alloc] init];
    myview.frame = rect;
    myview.backgroundColor = [UIColor clearColor];
    [self.view addSubview:myview];
    
    
    // train
    TabBarButton *btntrain = [[TabBarButton alloc] init];
    
    NSString* imageNameTrain = @"train.png";
    NSString* imageNameTrainOn = @"train_on.png";
    [btntrain setImage:[UIImage imageNamed:imageNameTrain] forState:UIControlStateNormal];
    [btntrain setImage:[UIImage imageNamed:imageNameTrainOn] forState:UIControlStateSelected];
    CGFloat x1 = 0 * myview.frame.size.width / 4;
    btntrain.frame = CGRectMake(x1, 0, myview.frame.size.width/4, myview.frame.size.height);
    [myview addSubview:btntrain];
    btntrain.tag = 0;
    
    [btntrain addTarget:self action:@selector(trainBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    
    //
    TabBarButton *btnDiscovery = [[TabBarButton alloc] init];
    NSString* imageNameDiscovery = @"discovery.png";
    NSString* imageNameDiscoveryOn = @"discovery_on.png";
    [btnDiscovery setImage:[UIImage imageNamed:imageNameDiscovery] forState:UIControlStateNormal];
    [btnDiscovery setImage:[UIImage imageNamed:imageNameDiscoveryOn] forState:UIControlStateSelected];
    CGFloat x2 = 1 * myview.frame.size.width / 4;
    btnDiscovery.frame = CGRectMake(x2, 0, myview.frame.size.width/4, myview.frame.size.height);
    [myview addSubview:btnDiscovery];
    btnDiscovery.tag = 1;
    
    [btntrain addTarget:self action:@selector(trainBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    TabBarButton *btnTrends = [[TabBarButton alloc] init];
    NSString* imageNameTrends = @"trends.png";
    NSString* imageNameTrendsOn = @"trends_on.png";
    [btnTrends setImage:[UIImage imageNamed:imageNameTrends] forState:UIControlStateNormal];
    [btnTrends setImage:[UIImage imageNamed:imageNameTrendsOn] forState:UIControlStateSelected];
    CGFloat x3 = 2 * myview.frame.size.width / 4;
    btnTrends.frame = CGRectMake(x3, 0, myview.frame.size.width/4, myview.frame.size.height);
    [myview addSubview:btnTrends];
    btnTrends.tag = 2;
    
    [btnTrends addTarget:self action:@selector(trainBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    TabBarButton *btnPersonal = [[TabBarButton alloc] init];
    NSString* imageNamePersonal = @"personal.png";
    NSString* imageNamePersonalOn = @"personal_on.png";
    [btnPersonal setImage:[UIImage imageNamed:imageNamePersonal] forState:UIControlStateNormal];
    [btnPersonal setImage:[UIImage imageNamed:imageNamePersonalOn] forState:UIControlStateSelected];
    CGFloat x4 = 3 * myview.frame.size.width / 4;
    btnPersonal.frame = CGRectMake(x4, 0, myview.frame.size.width/4, myview.frame.size.height);
    [myview addSubview:btnPersonal];
    btnPersonal.tag = 3;
    
    [btntrain addTarget:self action:@selector(trainBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


// func日志
-(void)LogFun{
    NSLog(@"%s", __func__);
}

// 打印出所有子视图和，frame
-(void)LogSubViews:(UIView*)view{
    NSLog(@"%@", self.view.subviews);
}

// clicked function
-(void)trainBtnClicked{
    NSLog(@"TrainBtn");
}

@end
