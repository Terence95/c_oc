//
//  TrendsViewController.m
//  Fake_keep2.0
//
//  Created by Terence on 16/6/30.
//  Copyright © 2016年 Terence. All rights reserved.
//

#import "TrendsViewController.h"
#define FRAME_SIZE self.view.frame.size
@interface TrendsViewController ()

@property(nonatomic, strong)UIScrollView* trendScrollView;
@property(nonatomic, strong)UIButton* titleViewBtn1;
@property(nonatomic, strong)UIButton* titleViewBtn2;
@property(nonatomic, strong)UIView* titleBtnView;

@end

@implementation TrendsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
     self.view.backgroundColor = [UIColor whiteColor];
    [self initUI];
    [self trendScrollViewWithSth];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
}

-(void)initUI{
    [self.view addSubview:self.trendScrollView];
    [self initTitleView];
}

-(UIScrollView*)trendScrollView{
    if (!_trendScrollView) {
        _trendScrollView = [[UIScrollView alloc] initWithFrame:[UIScreen mainScreen].bounds];
        [self.view addSubview:self.trendScrollView];
        _trendScrollView.contentSize = CGSizeMake(2 * FRAME_SIZE.width, FRAME_SIZE.height);
        _trendScrollView.showsHorizontalScrollIndicator = NO;
        _trendScrollView.pagingEnabled = YES;
        _trendScrollView.bounces = NO;
        _trendScrollView.alwaysBounceVertical = YES;
        
    }
    return _trendScrollView;
}


-(void)trendScrollViewWithSth{
    UIView* view1 = [[UIView alloc] initWithFrame:CGRectMake(0*FRAME_SIZE.width, 0, FRAME_SIZE.width, 1000)];
//    view1.backgroundColor = [UIColor redColor];
    UILabel* label1 = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    [label1 setText:@"分组界面"];
    [view1 addSubview:label1];
    
    
    UIView* view2 = [[UIView alloc] initWithFrame:CGRectMake(1*FRAME_SIZE.width, 0, FRAME_SIZE.width, FRAME_SIZE.height)];
    UILabel* label2 = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    [label2 setText:@"小组界面"];
    [view2 addSubview:label2];
//    view2.backgroundColor = [UIColor blueColor];
    
    [self.trendScrollView addSubview:view1];
    [self.trendScrollView addSubview:view2];
    
}


//// btn控制两个scrollview
//UIView* titleBtnView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 120, 40)];
////    titleBtnView.backgroundColor = [UIColor greenColor];
//UIButton* titleBtn1 = [[UIButton alloc] initWithFrame:CGRectMake((titleBtnView.frame.size.width - 110)/2, 0, 55, 40)];
////    titleBtn1.backgroundColor = [UIColor redColor];
//[titleBtn1 setTitle:@"已关注" forState:UIControlStateNormal];
//[titleBtn1.titleLabel setFont:[UIFont systemFontOfSize:14.f]];
//UIButton* titleBtn2 = [[UIButton alloc] initWithFrame:CGRectMake((titleBtnView.frame.size.width - 110)/2+55, 0, 55, 40)];
////    titleBtn2.backgroundColor = [UIColor blueColor];
//[titleBtn2 setTitle:@"小组" forState:UIControlStateNormal];
//[titleBtn2.titleLabel setFont:[UIFont systemFontOfSize:14.f]];
//[titleBtnView addSubview:titleBtn1];
//[titleBtnView addSubview:titleBtn2];
//trendsvc.navigationItem.titleView = titleBtnView;

-(void)initTitleView{
    
    [self.titleBtnView addSubview:self.titleViewBtn1];
    [self.titleBtnView addSubview:self.titleViewBtn2];
    self.navigationItem.titleView = self.titleBtnView;
    
}

-(UIButton*)titleViewBtn1{
    if (!_titleViewBtn1) {
        _titleViewBtn1 = [[UIButton alloc] initWithFrame:CGRectMake((self.titleBtnView.frame.size.width - 110)/2, 0, 55, 40)];
        [_titleViewBtn1 setTitle:@"已关注" forState:UIControlStateNormal];
        [_titleViewBtn1.titleLabel setFont:[UIFont systemFontOfSize:14.f]];
    }
    return _titleViewBtn1;
}


-(UIButton*)titleViewBtn2{
    if (!_titleViewBtn2) {
        _titleViewBtn2 = [[UIButton alloc] initWithFrame:CGRectMake((self.titleBtnView.frame.size.width - 110)/2+55, 0, 55, 40)];
        [_titleViewBtn2 setTitle:@"小组" forState:UIControlStateNormal];
        [_titleViewBtn2.titleLabel setFont:[UIFont systemFontOfSize:14.f]];
    }
    return _titleViewBtn2;
}

-(UIView*)titleBtnView{
    if (!_titleBtnView) {
        _titleBtnView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 120, 40)];
    }
    return _titleBtnView;
}


@end
