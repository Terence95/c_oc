//
//  HomeViewController.m
//  WeicoPrj
//
//  Created by Terence on 16/6/27.
//  Copyright © 2016年 Terence. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self createNavigationBar];
    [self createNavLeftWriteBtn];
    [self createNavRightBtn];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.title = @"WeiCo";
    [self initUI];
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
}

-(void)initUI{
    
}

- (void)createNavigationBar{
    self.navigationController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"aa" style:UIBarButtonItemStylePlain target:self action:@selector(backItem)];
}

-(void)createNavLeftWriteBtn{
    UIBarButtonItem* btn1 = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"group_btn_write_on_title@2x.png"] style:UIBarButtonItemStylePlain target:self action:@selector(gotoWriteText)];
    
    
    UIBarButtonItem* btn2 = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"searchIcon@2x.png"] style:UIBarButtonItemStylePlain target:self action:@selector(gotoWriteText)];
    
    
    self.navigationItem.leftBarButtonItems = @[btn1, btn2];
    
    
}

-(void)createNavRightBtn{
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"button_icon_refresh@2x.png"] style:UIBarButtonItemStylePlain target:self action:@selector(refreshControl)];
}

-(void)gotoWriteText{
    
}

-(void)refreshControl{
    
}




@end
