//
//  AboutMeHeaderView.m
//  Fake_keep2.0
//
//  Created by Terence on 16/7/2.
//  Copyright © 2016年 Terence. All rights reserved.
//

#import "AboutMeHeaderView.h"
#define SCREEN_W [UIScreen mainScreen].bounds.size.width
#define SCREEN_H [UIScreen mainScreen].bounds.size.height
@interface AboutMeHeaderView ()

@property(nonatomic, strong)UIView* blankView;


@end


@implementation AboutMeHeaderView


-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    
    if (self) {
        self.backgroundColor = [UIColor blueColor];
    }
    
    return self;
}

-(void)initUI{
    [self addSubview:self.blankView];
}

-(UIView*)blankView{
    if (!_blankView) {
        _blankView = [[UIView alloc] initWithFrame:CGRectMake(0, self.frame.size.height, SCREEN_W, 10)];
        _blankView.backgroundColor = [UIColor blueColor];
    }
    
    return _blankView;
}


@end
