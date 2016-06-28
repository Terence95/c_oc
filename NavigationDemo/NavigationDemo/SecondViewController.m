//
//  SecondViewController.m
//  NavigationDemo
//
//  Created by Terence on 16/6/27.
//  Copyright © 2016年 Terence. All rights reserved.
//

#import "SecondViewController.h"
#import "ThirdViewController.h"
@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self createNavigationRightButton];
    [self createNavigationBarLeftBtn];
    [self initUI];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
}

-(void)createNavigationRightButton{
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"searchIcon@2x.png"] style:UIBarButtonItemStylePlain target:self action:@selector(searchBtnClicked:)];
    
}

-(void)searchBtnClicked:(id)sender{
    
}

-(void)createNavigationBarLeftBtn{
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"back" style:UIBarButtonItemStylePlain target:self action:@selector(leftBtnClick)];
}

-(void)leftBtnClick{
    [self.navigationController popViewControllerAnimated:YES];
}



-(void)initUI{
    UIButton* btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 100, 200, 44)];
    [btn setTitle:@"second" forState:UIControlStateNormal];
    
    btn.backgroundColor = [UIColor redColor];
    [btn addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:btn];
}

-(void)btnClicked:(id)sender{
    ThirdViewController* third = [[ThirdViewController alloc] init];
    
    [self.navigationController pushViewController:third animated:YES];
}

@end
