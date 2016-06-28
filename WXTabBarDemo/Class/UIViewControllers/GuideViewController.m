//
//  GuideViewController.m
//  WXTabBarDemo
//
//  Created by Terence on 16/6/27.
//  Copyright © 2016年 Terence. All rights reserved.
//

#import "GuideViewController.h"
#import "AppDelegate.h"
#import "TabBarViewController.h"
#define FRAME_SIZE self.view.frame.size
#define FEATURE_COUNT 4
@interface GuideViewController () <UIScrollViewDelegate>

@property(nonatomic, strong) UIScrollView* scrollView;
@property(nonatomic, strong) UIButton* btn;
@property(nonatomic, strong) UIPageControl* pageCtrl;


@end

@implementation GuideViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self initUI];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
}

-(void)initUI{
    [self.view addSubview:self.scrollView];
    [self scrollViewWithImage];
}

/**
 *  创建guideview单例
 *
 *  @return <#return value description#>
 */
+(instancetype)sharedGuidVC{
    
    // 创建单例
    static GuideViewController *guideViewCtrl = nil;
    static dispatch_once_t oneToken;
    
    dispatch_once(&oneToken, ^{
        guideViewCtrl = [[GuideViewController alloc] init];
    });
    
    return guideViewCtrl;
}

-(UIScrollView*)scrollView{
    
    if (!_scrollView) {
        self.scrollView = [[UIScrollView alloc] initWithFrame:[UIScreen mainScreen].bounds];
        self.scrollView.delegate = self;// 代理
        [self.view addSubview:self.scrollView];
        
        
        // scrollView 的内容的size
        self.scrollView.contentSize = CGSizeMake(4 * FRAME_SIZE.width, FRAME_SIZE.height);
        self.scrollView.pagingEnabled = YES;
        self.scrollView.showsVerticalScrollIndicator = NO;
        self.scrollView.showsHorizontalScrollIndicator = NO;
        
    }
    
    return _scrollView;
    
}


-(void)scrollViewWithImage{
    for (int i = 0; i < FEATURE_COUNT; i++) {
        NSString* imageName = [NSString stringWithFormat:@"NF_0%d.jpg", i+1];
        UIImageView* imageView = [[UIImageView alloc] initWithFrame:CGRectMake(i*FRAME_SIZE.width, 0, FRAME_SIZE.width, FRAME_SIZE.height)];
        
        imageView.image = [UIImage imageNamed:imageName];
        [self.scrollView addSubview:imageView];
        
        
        if (i == (FEATURE_COUNT - 1)) {
            imageView.userInteractionEnabled = YES;
            
            UIButton* btn = [[UIButton alloc] initWithFrame:CGRectMake((FRAME_SIZE.width-100)/2, 180, 100, 30)];
            [btn setTitle:@"Welcome" forState:UIControlStateNormal];
            
            btn.backgroundColor = [UIColor clearColor];
            
            [btn addTarget:self action:@selector(gotoTabView) forControlEvents:UIControlEventTouchUpInside];
            
            btn.layer.borderWidth = 2;
            btn.layer.borderColor = [UIColor colorWithRed:0.656 green:0.688 blue:0.869 alpha:1.0].CGColor;
            btn.layer.cornerRadius = 5;
            [imageView addSubview:btn];
            
            
        }
       
    }
}

-(void)gotoTabView{
    NSLog(@"内容页");
    TabBarViewController* tbvc = [[TabBarViewController alloc] init];
    AppDelegate *tempDelegate = [UIApplication sharedApplication].delegate;
    tempDelegate.window.rootViewController = tbvc;
}
@end
