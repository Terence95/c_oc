//
//  ViewController.m
//  ScrollViewDemo
//
//  Created by Terence on 16/6/25.
//  Copyright © 2016年 Terence. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property(nonatomic, strong)UIScrollView* scrollview;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self initUI];
}

-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    
}

-(void)initUI{
    [self.view addSubview:self.scrollview];
}

-(UIScrollView*)scrollview{
    if (_scrollview == nil) {
        _scrollview = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 20, 320, 550)];
        
        // 添加子视图
//        UIImageView *myimage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 20, 320, 550)];
//        [_scrollview addSubview:myimage];
//        myimage.backgroundColor = [UIColor blueColor];
//        _scrollview.backgroundColor = [UIColor redColor];
        [_scrollview setContentSize:CGSizeMake(320*5, 240)];
        
        // 开启滚动分页功能
        [_scrollview setPagingEnabled:YES];
        
        // 隐藏滚动条
        [_scrollview setShowsVerticalScrollIndicator:NO];
        [_scrollview setShowsVerticalScrollIndicator:NO];
        
        [_scrollview setDelegate:self];
        
            // 添加图片按钮
        UIImageView *imageview1 = [[UIImageView alloc] initWithFrame:CGRectMake(0*320, 0, [UIScreen mainScreen].bounds.size.width, 550)];
        [imageview1 setImage:[UIImage imageNamed:@"img1.jpeg"]];
        
        UIImageView *imageview2 = [[UIImageView alloc] initWithFrame:CGRectMake(1*320, 0, 320, 550)];
        [imageview2 setImage:[UIImage imageNamed:@"img2.jpeg"]];
        
        
        UIImageView *imageview3 = [[UIImageView alloc] initWithFrame:CGRectMake(2*320, 0, 320, 550)];
        [imageview3 setImage:[UIImage imageNamed:@"img3.jpeg"]];
        
        
        UIImageView *imageview4 = [[UIImageView alloc] initWithFrame:CGRectMake(3*320, 0, 320, 550)];
        [imageview4 setImage:[UIImage imageNamed:@"img4.jpeg"]];
        
        
        UIImageView *imageview5 = [[UIImageView alloc] initWithFrame:CGRectMake(4*320, 0, 320, 550)];
        [imageview5 setImage:[UIImage imageNamed:@"img5.jpg"]];
        
        [_scrollview addSubview:imageview1];
        [_scrollview addSubview:imageview2];
        [_scrollview addSubview:imageview3];
        [_scrollview addSubview:imageview4];
        [_scrollview addSubview:imageview5];
        
        
    }
    
    return _scrollview;
}

@end
