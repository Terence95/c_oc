//
//  DiscoverInfoColum.m
//  Fake_keep2.0
//
//  Created by Terence on 16/7/4.
//  Copyright © 2016年 Terence. All rights reserved.
//

#import "DiscoverInfoColum.h"
#define SCREEN_W [UIScreen mainScreen].bounds.size.width
#define SCREEN_H [UIScreen mainScreen].bounds.size.height

@interface DiscoverInfoColum ()

@property(nonatomic, strong)UIView* topBar;
@property(nonatomic, strong)UIView* scrollViewContent;

@property(nonatomic, strong)UIButton* topic;
@property(nonatomic, strong)UILabel* topicLabel;

@property(nonatomic, strong)UIButton* sameCityBtn;
@property(nonatomic, strong)UILabel* cityLabel;

@property(nonatomic, strong)UIButton* groupBtn;
@property(nonatomic, strong)UILabel* groupLabel;

@property(nonatomic, strong)UIButton* equipmentBtn;
@property(nonatomic, strong)UILabel* equipmentLabel;

@property(nonatomic, strong)UIView* downBar;

@end

@implementation DiscoverInfoColum


-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
        
        [self addSubview:self.scrollViewContent];
        [self addSubview:self.topBar];
        [self addSubview:self.downBar];
        [self addSubview:self.topic];
        [self addSubview:self.sameCityBtn];
        [self addSubview:self.groupBtn];
        [self addSubview:self.equipmentBtn];
        [self.scrollViewContent addSubview:self.scrollView];
        
        [self.topic addSubview:self.topicLabel];
        [self.sameCityBtn addSubview:self.cityLabel];
        [self.groupBtn addSubview:self.groupLabel];
        [self.equipmentBtn addSubview:self.equipmentLabel];
        
        // 页码
        _pageControl.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;//貌似不起作用呢
        _pageControl.currentPage = 0; //初始页码为0
        
        
        // 配置定时器，自动滚动
        _timer = [NSTimer scheduledTimerWithTimeInterval:3.0 target:self selector:@selector(timerAction:) userInfo:nil repeats:YES];
        [[NSRunLoop currentRunLoop] addTimer:_timer forMode:NSDefaultRunLoopMode];
        [_timer setFireDate:[NSDate distantFuture]]; //关闭定时器
    }
    
    return self;
}

-(void)timerAction:(NSTimer*)timer{
    if (_totalNum > 1) {
        CGPoint newOffset = _scrollView.contentOffset;
        newOffset.x = newOffset.x + CGRectGetWidth(_scrollView.frame);
        
        if (newOffset.x > (CGRectGetWidth(_scrollView.frame)*(_totalNum-1))) {
            newOffset.x = 0;
        }
        
        int index = newOffset.x / CGRectGetWidth(_scrollView.frame);
        newOffset.x = index * CGRectGetWidth(_scrollView.frame);
        [_scrollView setContentOffset:newOffset animated:YES];
        
    }else{
        [_timer setFireDate:[NSDate distantFuture]];
    }
}

-(UIView*)topBar{
    if (!_topBar) {
        _topBar = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_W, 10)];
        _topBar.backgroundColor = [UIColor colorWithRed:0.909  green:0.921  blue:0.942 alpha:1];
    }
    
    return _topBar;
}

-(UIView*)downBar{
    if (!_downBar) {
        _downBar = [[UIView alloc] initWithFrame:CGRectMake(0, 250, SCREEN_W, 10)];
        _downBar.backgroundColor = [UIColor colorWithRed:0.909  green:0.921  blue:0.942 alpha:1];
    }
    
    return _downBar;
}

-(UIScrollView*)scrollView{
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.frame),180)];
        _scrollView.delegate = self;// 设置代理UIScrollViewDelegate
//        _scrollView.backgroundColor = [UIColor yellowColor];
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.pagingEnabled = YES;
        _scrollView.alwaysBounceHorizontal = YES;
        _scrollView.bounces = NO;
    }
    
    return _scrollView;
}

-(UIView*)scrollViewContent{
    if (!_scrollViewContent) {
        _scrollViewContent = [[UIView alloc] initWithFrame:CGRectMake(0, 10, SCREEN_W, 180)];
//        _scrollViewContent.backgroundColor = [UIColor grayColor];
        _scrollView.delegate = self;
        _scrollView.bounces = NO;
    }
    
    return _scrollViewContent;
}


-(UIButton*)topic{
    if (!_topic) {
        _topic = [[UIButton alloc] initWithFrame:CGRectMake(0, self.scrollView.frame.size.height+10, SCREEN_W/4, 50)];
//        _topic.backgroundColor = [UIColor blueColor];
        [_topic setImage:[UIImage imageNamed:@"topic.png"] forState:UIControlStateNormal];
//        UILabel* topicLabel = [[UILabel alloc] initWithFrame:CGRectMake( 35,38, _topic.frame.size.width, 10)];
        
//        [_topic addSubview:topicLabel];
    }
    
    return _topic;
}


-(UILabel*)topicLabel{
    if (!_topicLabel) {
        _topicLabel = [[UILabel alloc] initWithFrame:CGRectMake( 35,38, _topic.frame.size.width, 10)];
        [_topicLabel setText:@"话题"];
        [_topicLabel setFont:[UIFont systemFontOfSize:10.f]];
        [_topicLabel setTextColor:[UIColor colorWithRed:0.671  green:0.671  blue:0.671 alpha:1]];
    }
    
    return _topicLabel;
}


-(UIButton*)sameCityBtn{
    if (!_sameCityBtn) {
        _sameCityBtn = [[UIButton alloc] initWithFrame:CGRectMake(1*SCREEN_W/4, self.scrollView.frame.size.height+10, SCREEN_W/4, 50)];
        [_sameCityBtn setImage:[UIImage imageNamed:@"topic.png"] forState:UIControlStateNormal];
    }
    return _sameCityBtn;
}
-(UILabel*)cityLabel{
    if (!_cityLabel) {
        _cityLabel = [[UILabel alloc] initWithFrame:CGRectMake( 35,38, _topic.frame.size.width, 10)];
        [_cityLabel setText:@"同城"];
        [_cityLabel setFont:[UIFont systemFontOfSize:10.f]];
        [_cityLabel setTextColor:[UIColor colorWithRed:0.671  green:0.671  blue:0.671 alpha:1]];
    }
    
    return _cityLabel;

}

-(UIButton*)groupBtn{
    if (!_groupBtn) {
        _groupBtn = [[UIButton alloc] initWithFrame:CGRectMake(2*SCREEN_W/4, self.scrollView.frame.size.height+10, SCREEN_W/4, 50)];
        [_groupBtn setImage:[UIImage imageNamed:@"group.png"] forState:UIControlStateNormal];
    }
    return _groupBtn;
}
-(UILabel*)groupLabel{
    if (!_groupLabel) {
        _groupLabel = [[UILabel alloc] initWithFrame:CGRectMake( 35,38, _topic.frame.size.width, 10)];
        [_groupLabel setText:@"小组"];
        [_groupLabel setFont:[UIFont systemFontOfSize:10.f]];
        [_groupLabel setTextColor:[UIColor colorWithRed:0.671  green:0.671  blue:0.671 alpha:1]];

    }
    
    return _groupLabel;
}

-(UIButton*)equipmentBtn{
    if (!_equipmentBtn) {
        _equipmentBtn = [[UIButton alloc] initWithFrame:CGRectMake(3*SCREEN_W/4, self.scrollView.frame.size.height+10, SCREEN_W/4, 50)];
        [_equipmentBtn setImage:[UIImage imageNamed:@"group.png"] forState:UIControlStateNormal];

    }
    return _equipmentBtn;
}

-(UILabel*)equipmentLabel{
    if (!_equipmentLabel) {
        _equipmentLabel = [[UILabel alloc] initWithFrame:CGRectMake( 35,38, _topic.frame.size.width, 10)];
        [_equipmentLabel setText:@"装备"];
        [_equipmentLabel setFont:[UIFont systemFontOfSize:10.f]];
        [_equipmentLabel setTextColor:[UIColor colorWithRed:0.671  green:0.671  blue:0.671 alpha:1]];
        
    }
    return _equipmentLabel;
}



#pragma mark- PageControl 绑定 ScrollView
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if ([scrollView isMemberOfClass:[UITableView class]]) {
        
    }else {
        int index = fabs(scrollView.contentOffset.x) / scrollView.frame.size.width;   //当前是第几个视图
        _pageControl.currentPage = index;
        for (UIView *view in scrollView.subviews) {
            if(view.tag == index){
                
            }else{
                
            }
        }
    }
}


-(void)setArray:(NSArray *)imgArray{
    _totalNum = [imgArray count];
    if (_totalNum > 0) {
        for (int i = 0; i < _totalNum; i++) {
            UIImageView *img = [[UIImageView alloc]initWithFrame:CGRectMake(i*CGRectGetWidth(_scrollView.frame), 0, CGRectGetWidth(_scrollView.frame), CGRectGetHeight(_scrollView.frame))];
            img.contentMode = UIViewContentModeScaleAspectFill;
            img.image = [UIImage imageNamed:imgArray[i]];
            [img setTag:i];
            [_scrollView addSubview:img];
        }
    }else{
        UIImageView *img = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(_scrollView.frame), CGRectGetHeight(_scrollView.frame))];
        [img setImage:[UIImage imageNamed:@"comment_gray"]];
        img.userInteractionEnabled = YES;
        [_scrollView addSubview:img];
        _imagNum.text = @"提示：滚动栏无数据。";
    }
    _scrollView.contentSize = CGSizeMake(CGRectGetWidth(_scrollView.frame)*_totalNum,CGRectGetHeight(_scrollView.frame));
}

- (void)openTimer{
    [_timer setFireDate:[NSDate distantPast]];//开启定时器
}
- (void)closeTimer{
    [_timer setFireDate:[NSDate distantFuture]];//关闭定时器
}

@end
