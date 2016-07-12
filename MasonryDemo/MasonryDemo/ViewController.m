//
//  ViewController.m
//  MasonryDemo
//
//  Created by Terence on 16/7/12.
//  Copyright (c) 2016 Terence. All rights reserved.
//


#import "ViewController.h"
#import "Masonry.h"

@interface ViewController ()

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIView *redView = [[UIView alloc] init];
    redView.backgroundColor = [UIColor redColor];
    [self.view addSubview:redView];

    UIView *blueView = [[UIView alloc] init];
    blueView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:blueView];


    UIView *yellowView = [[UIView alloc] init];
    yellowView.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:yellowView];

    UIView *greenView = [[UIView alloc] init];
    greenView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:greenView];

    [redView mas_makeConstraints:^(MASConstraintMaker *make) {
       make.left.equalTo(self.view.mas_left).offset(10); //左边等于self.view的左边,间距为0
        make.top.equalTo(self.view.mas_top).offset(0); //顶部与self.view的顶部间距为0
        make.width.equalTo(self.view.mas_width).multipliedBy(0.5); //宽度为self.view的一半
        make.height.equalTo(self.view.mas_height).multipliedBy(0.5); //设置高度为self.view高度的一半

        // 这一套配置之后,相当于给redView的 x, y, Width, Height 都设定了
    }];

    [blueView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(redView);
        make.height.equalTo(redView);
        make.top.equalTo(redView.mas_top);
        make.left.equalTo(redView.mas_right);
    }];

    [yellowView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(redView);
        make.height.equalTo(redView);
        make.top.equalTo(redView.mas_bottom);
    }];

    [greenView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(redView);
        make.height.equalTo(redView);
        make.top.equalTo(blueView.mas_bottom);
        make.left.equalTo(yellowView.mas_right);
    }];



}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end