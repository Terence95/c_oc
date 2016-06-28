//
//  ThirdViewController.m
//  NavigationDemo
//
//  Created by Terence on 16/6/27.
//  Copyright © 2016年 Terence. All rights reserved.
//

#import "ThirdViewController.h"
#import "ViewController.h"
@interface ThirdViewController ()

@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.view.backgroundColor = [UIColor whiteColor];
    UILabel* label = [[UILabel alloc] initWithFrame:CGRectMake(30, 100, 100, 40)];
    [label setText:@"aaaa"];
    [self.view addSubview:label];
    [self createNavigationBarLeftBtn];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
}

-(void)createNavigationBarLeftBtn{
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"backtoroot" style:UIBarButtonItemStylePlain target:self action:@selector(backHome)];
}

-(void)leftBtnClick{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)backHome{
    [self.navigationController popToRootViewControllerAnimated:YES];
}


@end
