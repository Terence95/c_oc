//
//  trainViewHeaderView.m
//  Fake_keep2.0
//
//  Created by Terence on 16/7/5.
//  Copyright © 2016年 Terence. All rights reserved.
//

#import "trainViewHeaderView.h"
#define SCREEN_W [UIScreen mainScreen].bounds.size.width
#define SCREEN_H [UIScreen mainScreen].bounds.size.height

@interface trainViewHeaderView ()

@property(nonatomic, strong)UILabel* totalTrain;

@property(nonatomic, strong)UIImageView* nextPage;
@property(nonatomic, strong)UILabel* minuteNum;

@property(nonatomic, strong)UILabel* minuteChniese;

@property(nonatomic, strong)UILabel* finish;
@property(nonatomic, strong)UILabel* finshTime;
@property(nonatomic, strong)UILabel* finishChinese;

@property(nonatomic, strong)UILabel* total;
@property(nonatomic, strong)UILabel* totalDay;
@property(nonatomic, strong)UILabel* dayChinese;

@property(nonatomic, strong)UILabel* title;
@property(nonatomic, strong)UILabel* number;
@property(nonatomic, strong)UILabel* chineseChar;

@property(nonatomic, strong)UIView* upView;
@property(nonatomic, strong)UIView* middleView;
@property(nonatomic, strong)UIView* downView;

@end

@implementation trainViewHeaderView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    
    if (self) {
//        self.backgroundColor = [UIColor blueColor];
        self.backgroundColor = [UIColor whiteColor];
        [self initUI];
    }
    
    return self;
}

-(void)initUI{
    [self addSubview:self.upView];
    [self addSubview:self.middleView];
    [self addSubview:self.downView];
    [self.upView addSubview:self.totalTrain];
    [self.upView addSubview:self.nextPage];
    [self.upView addSubview:self.minuteNum];
    [self.upView addSubview:self.minuteChniese];
    UIView* view1 = [self setViewWithTitle:@"完成" Number:@"45" ChineseChar:@"次" Offset:0];
    UIView* view2 = [self setViewWithTitle:@"累计" Number:@"23" ChineseChar:@"天" Offset:1];
    UIView* view3 = [self setViewWithTitle:@"消耗" Number:@"2565" ChineseChar:@"千卡" Offset:2];
    [self.middleView addSubview:view1];
    [self.middleView addSubview:view2];
    [self.middleView addSubview:view3];
}

-(UIView*)upView{
    if (!_upView) {
        _upView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_W, 140)];
//        _upView.backgroundColor = [UIColor grayColor];
    }
    
    return _upView;
}

-(UIView*)middleView{
    if (!_middleView) {
        _middleView = [[UIView alloc] initWithFrame:CGRectMake(0, self.upView.frame.size.height-30, SCREEN_W, 60)];
//        _middleView.backgroundColor = [UIColor redColor];
    }
    
    return _middleView;
}

-(UIView*)downView{
    if (!_downView) {
        _downView = [[UIView alloc] initWithFrame:CGRectMake(0, 170, SCREEN_W, 60)];
        _downView.backgroundColor = [UIColor colorWithRed:0.649  green:0.260  blue:0.415 alpha:1];
    }
    return _downView;
}

-(UILabel*)totalTrain{
    if (!_totalTrain) {
        _totalTrain = [[UILabel alloc] initWithFrame:CGRectMake(10, 5, 80, 20)];
        [_totalTrain setText:@"总共训练"];
        [_totalTrain setFont:[UIFont systemFontOfSize:13.f]];
        [_totalTrain setTextColor:[UIColor colorWithRed:0.671  green:0.671  blue:0.671 alpha:1]];
//        _totalTrain.backgroundColor = [UIColor blueColor];
    }
    
    return _totalTrain;
}

-(UIImageView*)nextPage{
    if (!_nextPage) {
        _nextPage = [[UIImageView alloc] initWithFrame:CGRectMake(SCREEN_W-15, 12, 6, 14)];
        [_nextPage setImage:[UIImage imageNamed:@"web_next_on.png"]];
    }
    return _nextPage;
}

-(UILabel*)minuteNum{
    if (!_minuteNum) {
        _minuteNum = [[UILabel alloc] initWithFrame:CGRectMake((SCREEN_W-80)/2-15, 50, 80, 50)];
        [_minuteNum setText:@"726"];
        [_minuteNum setTextColor:[UIColor colorWithRed:0.342  green:0.304  blue:0.375 alpha:1]];
        [_minuteNum setFont:[UIFont systemFontOfSize:34.f weight:0.5]];
        _minuteNum.textAlignment = NSTextAlignmentCenter;
//        _minuteNum.backgroundColor = [UIColor blueColor];
    }
    return _minuteNum;
}

-(UILabel*)minuteChniese{
    if (!_minuteChniese) {
        _minuteChniese = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.minuteNum.frame)-5, 75, 20, 10)];
        [_minuteChniese setText:@"分钟"];
        [_minuteChniese setTextColor:[UIColor colorWithRed:0.342  green:0.304  blue:0.375 alpha:1]];
        [_minuteChniese setFont:[UIFont systemFontOfSize:10.f]];
//        _minuteChniese.backgroundColor = [UIColor blueColor];
    }
    return _minuteChniese;
}

-(UIView*)setViewWithTitle:(NSString*)title Number:(NSString*)number ChineseChar:(NSString*)chineseChar Offset:(int)offset{
    UIView* bottomView = [[UIView alloc] initWithFrame:CGRectMake(offset*SCREEN_W/3, 0, SCREEN_W/3, self.middleView.frame.size.height)];
    

    
    if (offset == 0) {
        UILabel* titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 10, 40, 20)];
        [titleLabel setText:title];
        titleLabel.textAlignment = NSTextAlignmentCenter;
        [titleLabel setTextColor:[UIColor colorWithRed:0.671  green:0.671  blue:0.671 alpha:1]];
        [titleLabel setFont:[UIFont systemFontOfSize:10.f]];
        
        UILabel* NumberLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 25, 40, 40)];
        [NumberLabel setText:number];
        //    NumberLabel.textAlignment = NSTextAlignmentCenter;
        [NumberLabel setTextColor:[UIColor colorWithRed:0.342  green:0.304  blue:0.375 alpha:1]];
        [NumberLabel setFont:[UIFont systemFontOfSize:25.f weight:0.3]];
        //    NumberLabel.backgroundColor = [UIColor grayColor];
        
        UILabel* chineseLabel = [[UILabel alloc] initWithFrame:CGRectMake(titleLabel.frame.size.width+15, 40, 20, 20)];
        [chineseLabel setText:chineseChar];
        [chineseLabel setTextColor:[UIColor colorWithRed:0.342  green:0.304  blue:0.375 alpha:1]];
        [chineseLabel setFont:[UIFont systemFontOfSize:10.f]];
//        chineseLabel.backgroundColor = [UIColor yellowColor];
//        titleLabel.backgroundColor = [UIColor greenColor];
//        
//        bottomView.backgroundColor = [UIColor purpleColor];
        
        [bottomView addSubview:titleLabel];
        [bottomView addSubview:NumberLabel];
        [bottomView addSubview:chineseLabel];
    }else if (offset == 1){
        UILabel* titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(40, 10, 40, 20)];
        [titleLabel setText:title];
        titleLabel.textAlignment = NSTextAlignmentCenter;
        [titleLabel setTextColor:[UIColor colorWithRed:0.671  green:0.671  blue:0.671 alpha:1]];

        [titleLabel setFont:[UIFont systemFontOfSize:10.f]];
        
        UILabel* NumberLabel = [[UILabel alloc] initWithFrame:CGRectMake(40, 25, 40, 40)];
        [NumberLabel setText:number];
        //    NumberLabel.textAlignment = NSTextAlignmentCenter;
        [NumberLabel setTextColor:[UIColor colorWithRed:0.342  green:0.304  blue:0.375 alpha:1]];
        [NumberLabel setFont:[UIFont systemFontOfSize:25.f weight:0.3]];
        //    NumberLabel.backgroundColor = [UIColor grayColor];
        
        UILabel* chineseLabel = [[UILabel alloc] initWithFrame:CGRectMake(titleLabel.frame.size.width+35, 40, 20, 20)];
        [chineseLabel setText:chineseChar];
        [chineseLabel setFont:[UIFont systemFontOfSize:10.f]];
        [chineseLabel setTextColor:[UIColor colorWithRed:0.342  green:0.304  blue:0.375 alpha:1]];
//        chineseLabel.backgroundColor = [UIColor yellowColor];
//        titleLabel.backgroundColor = [UIColor greenColor];
        
//        bottomView.backgroundColor = [UIColor purpleColor];
        
        [bottomView addSubview:titleLabel];
        [bottomView addSubview:NumberLabel];
        [bottomView addSubview:chineseLabel];
    }else if (offset == 2){
        UILabel* titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(65, 10, 40, 20)];
        [titleLabel setText:title];
        titleLabel.textAlignment = NSTextAlignmentCenter;
        [titleLabel setTextColor:[UIColor colorWithRed:0.671  green:0.671  blue:0.671 alpha:1]];
        [titleLabel setFont:[UIFont systemFontOfSize:10.f]];
        
        UILabel* NumberLabel = [[UILabel alloc] initWithFrame:CGRectMake(35, 25, 80, 40)];
        [NumberLabel setText:number];
        //    NumberLabel.textAlignment = NSTextAlignmentCenter;
        [NumberLabel setTextColor:[UIColor colorWithRed:0.342  green:0.304  blue:0.375 alpha:1]];
        [NumberLabel setFont:[UIFont systemFontOfSize:25.f weight:0.3]];
        //    NumberLabel.backgroundColor = [UIColor grayColor];
        
        UILabel* chineseLabel = [[UILabel alloc] initWithFrame:CGRectMake(titleLabel.frame.size.width+60, 40, 20, 20)];
        [chineseLabel setText:chineseChar];
        [chineseLabel setTextColor:[UIColor colorWithRed:0.342  green:0.304  blue:0.375 alpha:1]];
        [chineseLabel setFont:[UIFont systemFontOfSize:10.f]];
//        chineseLabel.backgroundColor = [UIColor yellowColor];
//        titleLabel.backgroundColor = [UIColor greenColor];
//        bottomView.backgroundColor = [UIColor purpleColor];
        
        [bottomView addSubview:titleLabel];
        [bottomView addSubview:NumberLabel];
        [bottomView addSubview:chineseLabel];
    }
    return bottomView;
}

@end
