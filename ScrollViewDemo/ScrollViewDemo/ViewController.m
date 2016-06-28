//
//  ViewController.m
//  ScrollViewDemo
//
//  Created by Terence on 16/6/25.
//  Copyright © 2016年 Terence. All rights reserved.
//

#import "ViewController.h"
#import "TabBarViewController.h"

@interface ViewController ()
@property(nonatomic, strong)UIScrollView* scrollview;
@property(nonatomic, strong)UIPageControl* pageview;
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
//    self.navigationController.navigationBarHidden = YES;
//    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    
}

-(void)initUI{
    [self.view addSubview:self.scrollview];
    [self scrollViewWithImage];
    [self.view addSubview:self.pageview];
    
}

-(UIScrollView*)scrollview{
    if (!_scrollview) {
        _scrollview = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        
        // 将垂直的滚动条删了
        _scrollview.showsVerticalScrollIndicator = NO;
        
        // 水平滚动条设置
        _scrollview.showsHorizontalScrollIndicator = NO;
        
        // 分页
        _scrollview.pagingEnabled = YES;
        
        //
        _scrollview.contentOffset = CGPointZero;
        
        _scrollview.delegate = self;
    }
    
    return _scrollview;
}

// 给scrollview添加图片
-(void)scrollViewWithImage{
    
    self.scrollview.contentSize = CGSizeMake((SCREEN_WIDTH*5), SCREEN_HEIGHT);
    
    for (int i = 0; i < 5; i++) {
        NSString* imageName = [NSString stringWithFormat:@"img%d.jpeg", i+1];
        UIImageView* imageview = [[UIImageView alloc] initWithFrame:CGRectMake(i*SCREEN_WIDTH, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        imageview.image = [UIImage imageNamed:imageName];
        
        [self.scrollview addSubview:imageview];
        
        if (i == (IMAGE_COUNT - 1)) {
            // uiimage获得点击事件
            imageview.userInteractionEnabled = YES;
            
            UIButton* btn = [[UIButton alloc] initWithFrame:CGRectMake((SCREEN_WIDTH-300)/2, SCREEN_HEIGHT-44-30, 300, 30)];
            [btn setTitle:@"Welcome" forState:UIControlStateNormal];
//            btn.backgroundColor = [UIColor blueColor];
            
            [btn addTarget:self action:@selector(intoMain) forControlEvents:UIControlEventTouchUpInside];
            
            [imageview addSubview:btn];
        }
        
    }
}

// get pageview
-(UIPageControl*)pageview{
    if (!_pageview) {
        _pageview = [[UIPageControl alloc] initWithFrame:CGRectMake((SCREEN_WIDTH-300)/2, SCREEN_HEIGHT - 44, 300, 30)];
        _pageview.backgroundColor = [UIColor clearColor];
        _pageview.numberOfPages = IMAGE_COUNT;
        _pageview.currentPage = 0;
        
    }
    return _pageview;
}

-(void)intoMain{
    
    TabBarViewController* tbvc = [[TabBarViewController alloc] init];
    [self.navigationController pushViewController:tbvc animated:YES];
    NSLog(@"aaa");
    
}

#pragma mark - UIScrollViewDelegate
// 计算滑动页码数的代理
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    CGFloat pageWidth = scrollView.frame.size.width;
    
    // 计算当前的滑动页码数
    int page = (int)(floor((scrollView.contentOffset.x - pageWidth/2))/pageWidth+1);
    
    self.pageview.currentPage = page;
    
}

@end
