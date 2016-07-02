//
//  ViewController.m
//  Fake_keep2.0
//
//  Created by Terence on 16/6/29.
//  Copyright © 2016年 Terence. All rights reserved.
//

#import "ViewController.h"
#import <MediaPlayer/MediaPlayer.h>
#import <AVFoundation/AVFoundation.h>
#import "TabBarViewController.h"
#import "AppDelegate.h"

#define SCREEN_SIZE [UIScreen mainScreen].bounds.size
#define FRAME_SIZE self.view.frame.size
#define FEATURE_COUNT 4

@interface ViewController () <UIScrollViewDelegate>
@property(nonatomic,strong)MPMoviePlayerController *moviePlayer;
@property(nonatomic ,strong)NSTimer *timer;
@property (nonatomic, weak)UIView *alpaView;

@property(nonatomic, strong)UIButton* regiset;
@property(nonatomic, strong)UIButton* login;

@property(nonatomic, strong)UIScrollView *scrollView;
@property(nonatomic, strong)UIPageControl* pageControl;

@property(nonatomic ,strong)AVAudioSession* avaudioSession;

@property(nonatomic, strong)UIImageView* keeplogo;


@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self showVideo];
}


-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self initUI];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
}


-(void)initUI{
    [_moviePlayer.view addSubview:_alpaView];
    
    [_moviePlayer.view addSubview:self.regiset];
    
    [_moviePlayer.view addSubview:self.login];
    
    [_moviePlayer.view addSubview:self.scrollView];
    
    [_moviePlayer.view addSubview:self.pageControl];
    
    [_moviePlayer.view addSubview:self.keeplogo];
    
    [self scrollViewWithLabel];
}

-(void)playbackStateChanged{
    
    
    //取得目前状态
    MPMoviePlaybackState playbackState = [_moviePlayer playbackState];
    
    //状态类型
//    switch (playbackState) {
//        case MPMoviePlaybackStateStopped:
//            [_moviePlayer play];
//            break;
//            
//        case MPMoviePlaybackStatePlaying:
//            NSLog(@"播放中");
//            break;
//            
//        case MPMoviePlaybackStatePaused:
//            [_moviePlayer play];
//            break;
//            
//        case MPMoviePlaybackStateInterrupted:
//            NSLog(@"播放被中断");
//            break;
//            
//        case MPMoviePlaybackStateSeekingForward:
//            NSLog(@"往前快转");
//            break;
//            
//        case MPMoviePlaybackStateSeekingBackward:
//            NSLog(@"往后快转");
//            break;
//            
//        default:
//            NSLog(@"无法辨识的状态");
//            break;
//    }
}


-(void)showVideo{
    self.avaudioSession = [AVAudioSession sharedInstance];
    NSError *error = nil;
    [self.avaudioSession setCategory:AVAudioSessionCategoryAmbient error:&error];
    
    NSString *urlStr = [[NSBundle mainBundle]pathForResource:@"1.mp4" ofType:nil];
    
    NSURL *url = [NSURL fileURLWithPath:urlStr];
    
    _moviePlayer = [[MPMoviePlayerController alloc]initWithContentURL:url];
    //    _moviePlayer.controlStyle = MPMovieControlStyleDefault;
    [_moviePlayer play];
    [_moviePlayer.view setFrame:self.view.bounds];
    
    [self.view addSubview:_moviePlayer.view];
    _moviePlayer.shouldAutoplay = YES;
    [_moviePlayer setControlStyle:MPMovieControlStyleNone];
    [_moviePlayer setFullscreen:YES];
    
    [_moviePlayer setRepeatMode:MPMovieRepeatModeOne];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(playbackStateChanged) name:MPMoviePlayerPlaybackStateDidChangeNotification object:_moviePlayer];
}

//ios以后隐藏状态栏
//-(BOOL)prefersStatusBarHidden{
//    
//    return YES;
//}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

// 估计是个定时器
//-(void)setupTimer{
//    
//    self.timer = [NSTimer timerWithTimeInterval:3.0f target:self selector:@selector(timerChanged) userInfo:nil repeats:YES];
//    
//    [[NSRunLoop currentRunLoop]addTimer:self.timer forMode:NSRunLoopCommonModes];
//    
//}

//-(void)pageChanged:(UIPageControl *)pageControl{
//    
//    CGFloat x = (pageControl.currentPage) * [UIScreen mainScreen].bounds.size.width;
//    
//    [self.scrollView setContentOffset:CGPointMake(x, 0) animated:YES];
//    
//    
//}
//

//-(void)timerChanged{
//    int page  = (self.pageControl.currentPage +1) %4;
//    
//    self.pageControl.currentPage = page;
//    
//    [self pageChanged:self.pageControl];
//    
//    
//}
//
//- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
//    double page = self.scrollView.contentOffset.x / self.scrollView.bounds.size.width;
//    self.pageControl.currentPage = page;
//    
//    if (page== - 1)
//    {
//        self.pageControl.currentPage = 3;// 序号0 最后1页
//    }
//    else if (page == 4)
//    {
//        self.pageControl.currentPage = 0; // 最后+1,循环第1页
//        [self.scrollView setContentOffset:CGPointMake(0, 0) animated:YES];
//    }
//}
//
//- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
//    [self.timer invalidate];
//}
//
//- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
//    
//    [self setupTimer];
//    
//}
//
-(UIButton*)regiset{
    if (!_regiset) {
        _regiset = [[UIButton alloc] initWithFrame:CGRectMake((SCREEN_SIZE.width - 300)/2 - 20, SCREEN_SIZE.height-100, 150, 50)];
        _regiset.backgroundColor = [UIColor redColor];
        [_regiset setTitle:@"注册" forState:UIControlStateNormal];
        [_regiset setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _regiset.backgroundColor = [UIColor blackColor];
        _regiset.layer.cornerRadius = 3.0f;
        _regiset.alpha = 0.6f;
        [_regiset addTarget:self action:@selector(registerClicked) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _regiset;
}

-(void)registerClicked{
    NSLog(@"clicked");
}



-(UIButton*)login{
    if (!_login) {
        _login = [[UIButton alloc] initWithFrame:CGRectMake((SCREEN_SIZE.width - 300)/2 + 150 + 20, SCREEN_SIZE.height-100, 150, 50)];
        _login.backgroundColor = [UIColor clearColor];
        [_login setTitle:@"登录" forState:UIControlStateNormal];
        [_login setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _login.backgroundColor = [UIColor whiteColor];
        _login.layer.cornerRadius = 3.0f;
        _login.alpha = 0.6f;
        [_login addTarget:self action:@selector(loginClicked) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _login;
}


-(void)loginClicked{
    NSLog(@"loginclicked");
    TabBarViewController* tabbarvc = [[TabBarViewController alloc] init];
    AppDelegate* tempdelegate = [UIApplication sharedApplication].delegate;
    tempdelegate.window.rootViewController = tabbarvc;
    
}


-(UIImageView*)keeplogo{
    if (!_keeplogo) {
        _keeplogo = [[UIImageView alloc] initWithFrame:CGRectMake((SCREEN_SIZE.width-200)/2, self.scrollView.frame.size.height-300, 200, 80)];
        _keeplogo.backgroundColor = [UIColor clearColor];
        [_keeplogo setImage:[UIImage imageNamed:@"keep6.png"]];
    }
    
    return _keeplogo;
}



-(UIScrollView*)scrollView{
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_SIZE.width, SCREEN_SIZE.height - 130)];
        _scrollView.backgroundColor = [UIColor clearColor];
        
        _scrollView.contentSize = CGSizeMake(4 * FRAME_SIZE.width, SCREEN_SIZE.height - 150);
        
        self.scrollView.pagingEnabled = YES;
        self.scrollView.showsVerticalScrollIndicator = NO;
        self.scrollView.showsHorizontalScrollIndicator = NO;
        
        _scrollView.delegate = self;
    }
    return _scrollView;
}

-(void)scrollViewWithLabel{
   
    UILabel* label1 = [[UILabel alloc] initWithFrame:CGRectMake(0*FRAME_SIZE.width, 460, SCREEN_SIZE.width, 100)];
    label1.text = @"每个动作都精确规范";
    label1.textColor = [UIColor whiteColor];
    [label1 setFont:[UIFont systemFontOfSize:21.f]];
    label1.textAlignment = NSTextAlignmentCenter;
    [self.scrollView addSubview:label1];
    
    UILabel* label2 = [[UILabel alloc] initWithFrame:CGRectMake(1*FRAME_SIZE.width, 460, SCREEN_SIZE.width, 100)];
    label2.text = @"规划陪伴你的训练课程";
    label2.textColor = [UIColor whiteColor];
    [label2 setFont:[UIFont systemFontOfSize:21.f]];
    label2.textAlignment = NSTextAlignmentCenter;
    [self.scrollView addSubview:label2];
    
    UILabel* label3 = [[UILabel alloc] initWithFrame:CGRectMake(2*FRAME_SIZE.width, 460, SCREEN_SIZE.width, 100)];
    label3.text = @"分享汗水后你的性感";
    label3.textColor = [UIColor whiteColor];
    [label3 setFont:[UIFont systemFontOfSize:21.f]];
    label3.textAlignment = NSTextAlignmentCenter;
    [self.scrollView addSubview:label3];
    
    UILabel* label4 = [[UILabel alloc] initWithFrame:CGRectMake(3*FRAME_SIZE.width, 460, SCREEN_SIZE.width, 100)];
    label4.text = @"全程记录你的健身数据";
    label4.textColor = [UIColor whiteColor];
    [label4 setFont:[UIFont systemFontOfSize:21.f]];
    label4.textAlignment = NSTextAlignmentCenter;
    [self.scrollView addSubview:label4];
}

-(UIPageControl*)pageControl{
    if (!_pageControl) {
        _pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake((SCREEN_SIZE.width - 100)/2, self.scrollView.frame.size.height - 50, 100, 100)];
        _pageControl.backgroundColor = [UIColor clearColor];
        _pageControl.numberOfPages = FEATURE_COUNT;
        _pageControl.currentPage = 0;
    }
    
    return _pageControl;
}

#pragma mark - UIScrollViewDelegate
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat pageWidth = scrollView.frame.size.width;
    
    int page = (floor((scrollView.contentOffset.x - pageWidth/2))/pageWidth+1);
    
    self.pageControl.currentPage = page;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

