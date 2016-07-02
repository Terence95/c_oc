//
//  TrendsViewController.m
//  Fake_keep2.0
//
//  Created by Terence on 16/6/30.
//  Copyright © 2016年 Terence. All rights reserved.
//

#import "TrendsViewController.h"
#define FRAME_SIZE self.view.frame.size
@interface TrendsViewController () <UIScrollViewDelegate>

@property(nonatomic, strong)UIScrollView* trendScrollView;
@property(nonatomic, strong)UIButton* titleViewBtn1;
@property(nonatomic, strong)UIButton* titleViewBtn2;
@property(nonatomic, strong)UIView* titleBtnView;
@property(nonatomic, strong)UIPageControl* pagecontrol;
@property(nonatomic, assign)NSInteger currentpage;
@property(nonatomic, assign) NSTimeInterval uxy_acceptEventInterval;




@end

static const char *UIControl_acceptEventInterval = "UIControl_acceptEventInterval";

@implementation TrendsViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithRed:0.909  green:0.921  blue:0.942 alpha:1];
    [self initUI];
    [self trendScrollViewWithSth];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
}

/**
 *  初始化所有UI组件
 */
-(void)initUI{
    [self.view addSubview:self.trendScrollView];
    [self initTitleView];
    [self initNavigationBarLeftItem:@"add.png"];
    [self initNavigationBarRightItem:@"news.png"];
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
        _trendScrollView.delegate = self;
        
    }
    return _trendScrollView;
}


-(void)trendScrollViewWithSth{
    UIView* view1 = [[UIView alloc] initWithFrame:CGRectMake(0*FRAME_SIZE.width, 0, FRAME_SIZE.width, 1000)];
//    view1.backgroundColor = [UIColor redColor];
    UILabel* label1 = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    [label1 setText:@"关注界面"];
    [view1 addSubview:label1];
    
    
    
    UIView* view2 = [[UIView alloc] initWithFrame:CGRectMake(1*FRAME_SIZE.width, 0, FRAME_SIZE.width, FRAME_SIZE.height)];
    UILabel* label2 = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    [label2 setText:@"小组界面"];
    [view2 addSubview:label2];
//    view2.backgroundColor = [UIColor blueColor];
    
    
    [self.trendScrollView addSubview:view1];
    [self.trendScrollView addSubview:view2];
    
}

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
        [_titleViewBtn1 addTarget:self action:@selector(attentionBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _titleViewBtn1;
}

-(IBAction)attentionBtnClicked:(UIButton*)sender{
    if (sender && [sender isKindOfClass:[UIButton class]]) {
        NSLog(@"关注btn被点击");
        sender.enabled = NO;
        CGPoint offset = self.trendScrollView.contentOffset;
        if (offset.x != 0) {
            
            offset.x -= FRAME_SIZE.width;
            [self.trendScrollView setContentOffset:offset animated:YES];
            offset.x = 0;
        }
        sender.enabled = YES;
    }
}

-(UIButton*)titleViewBtn2{
    if (!_titleViewBtn2) {
        _titleViewBtn2 = [[UIButton alloc] initWithFrame:CGRectMake((self.titleBtnView.frame.size.width - 110)/2+55, 0, 55, 40)];
        [_titleViewBtn2 setTitle:@"小组" forState:UIControlStateNormal];
        [_titleViewBtn2.titleLabel setFont:[UIFont systemFontOfSize:14.f]];
        [_titleViewBtn2 addTarget:self action:@selector(titleViewBtn2Clicked) forControlEvents:UIControlEventTouchUpInside];
    }
    return _titleViewBtn2;
}

-(void)titleViewBtn2Clicked{
    NSLog(@"小组btn被点击");
    CGPoint offset = self.trendScrollView.contentOffset;
    if (offset.x != FRAME_SIZE.width) {
        offset.x += FRAME_SIZE.width;
        [self.trendScrollView setContentOffset:offset animated:YES];
    }
}

-(UIView*)titleBtnView{
    if (!_titleBtnView) {
        _titleBtnView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 120, 40)];
    }
    return _titleBtnView;
}




-(void)initNavigationBarLeftItem:(NSString*)imgName{
    UIBarButtonItem* trendsLeftBtn = [[UIBarButtonItem alloc] init];
    UIImage* trendsLeftBtnImg = [UIImage imageNamed:imgName];
    trendsLeftBtnImg = [trendsLeftBtnImg imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [trendsLeftBtn setImage:trendsLeftBtnImg];
    self.navigationItem.leftBarButtonItem = trendsLeftBtn;
}

-(void)initNavigationBarRightItem:(NSString*)imgName{
    UIBarButtonItem* discoveryNavRightBtn = [[UIBarButtonItem alloc] init];
    UIImage* discoveryRightbtnImg = [UIImage imageNamed:imgName];
    discoveryRightbtnImg = [discoveryRightbtnImg imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [discoveryNavRightBtn setImage:discoveryRightbtnImg];
    self.navigationItem.rightBarButtonItem = discoveryNavRightBtn;
}

#pragma -mark UIScrollViewDelegate

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat pageWidth = scrollView.frame.size.width;
    
    int currentPage = floor((scrollView.contentOffset.x - pageWidth/2)/pageWidth)+1;
        
    if (currentPage == 0) {
        [self.titleViewBtn1 setTitleColor:[UIColor colorWithRed:1  green:1  blue:1 alpha:1] forState:UIControlStateNormal];
        [self.titleViewBtn2 setTitleColor:[UIColor colorWithRed:0.902  green:0.902  blue:0.902 alpha:0.5] forState:UIControlStateNormal];

    }else if (currentPage == 1){
        [self.titleViewBtn2 setTitleColor:[UIColor colorWithRed:1  green:1  blue:1 alpha:1] forState:UIControlStateNormal];
        [self.titleViewBtn1 setTitleColor:[UIColor colorWithRed:0.902  green:0.902  blue:0.902 alpha:0.5] forState:UIControlStateNormal];
    }
    
    [self setCurrentpage:currentPage];
    
}


-(void)setCurrentpage:(NSInteger)currentpage{
    if (currentpage) {
        _currentpage = currentpage;
    }
}


@end
