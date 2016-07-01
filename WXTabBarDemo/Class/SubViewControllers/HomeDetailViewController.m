//
//  HomeDetailViewController.m
//  WXTabBarDemo
//
//  Created by Terence on 16/6/29.
//  Copyright © 2016年 Terence. All rights reserved.
//

#import "HomeDetailViewController.h"
#import "Student.h"
#import "EngineInterface.h"
@interface HomeDetailViewController ()

@property(nonatomic, strong)UILabel* namelabel;
@property(nonatomic, strong)Student* stu;
@end

@implementation HomeDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    _stu = [[EngineInterface shareInstances] homeDetailDataWithIndex:self.currentIndex];

    NSLog(@"%@", _stu.name);

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
}

-(void)showViewWithStudent:(Student*)stu{
    NSLog(@"%@", stu.name);
    NSLog(@"%@", stu.address);
    NSLog(@"%@", stu.sex);
}


@end
