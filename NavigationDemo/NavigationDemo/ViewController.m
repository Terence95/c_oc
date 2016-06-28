//
//  ViewController.m
//  NavigationDemo
//
//  Created by Terence on 16/6/27.
//  Copyright © 2016年 Terence. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    [self createNavigationBar];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.title = @"root";
    [self initUI];
//    [self createNavigationRightButton];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
}


// 初始化navigationbar
-(void)createNavigationBar{
    self.navigationController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"hello" style:UIBarButtonItemStylePlain target:self action:@selector(backItem:)];
}

-(void)initUI{
    UIButton* btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 100, 200, 44)];
    [btn setTitle:@"btn" forState:UIControlStateNormal];
    
    btn.backgroundColor = [UIColor redColor];
    [btn addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:btn];
}

-(void)btnClicked:(id)sender{
    SecondViewController* second = [[SecondViewController alloc] init];
    
    [self.navigationController pushViewController:second animated:YES];
}


-(void)createNavigationRightButton{
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"searchIcon@2x.png"] style:UIBarButtonItemStylePlain target:self action:@selector(searchBtnClicked:)];
    
}

-(void)searchBtnClicked:(id)sender{
    
}

@end
