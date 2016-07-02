//
//  DiscoverViewController.m
//  Fake_keep2.0
//
//  Created by Terence on 16/6/30.
//  Copyright © 2016年 Terence. All rights reserved.
//

#import "DiscoverViewController.h"

@interface DiscoverViewController ()

@end

@implementation DiscoverViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
     self.view.backgroundColor = [UIColor colorWithRed:0.909  green:0.921  blue:0.942 alpha:1];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self initUI];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
}

-(void)initUI{
    [self initNavigationBarRightItem:@"searchicon.png"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)initNavigationBarRightItem:(NSString*)imgName{
    UIBarButtonItem* discoveryNavRightBtn = [[UIBarButtonItem alloc] init];
    UIImage* discoveryRightbtnImg = [UIImage imageNamed:imgName];
    discoveryRightbtnImg = [discoveryRightbtnImg imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [discoveryNavRightBtn setImage:discoveryRightbtnImg];
    self.navigationItem.rightBarButtonItem = discoveryNavRightBtn;
}


@end
