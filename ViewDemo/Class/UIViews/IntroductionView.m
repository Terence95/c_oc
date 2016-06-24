//
//  IntroductionView.m
//  ViewDemo
//
//  Created by Terence on 16/6/23.
//  Copyright © 2016年 Terence. All rights reserved.
//

#import "IntroductionView.h"

@implementation IntroductionView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    
    if (self) {
        self.backgroundColor = [UIColor yellowColor];
        self.alpha = .7f;
    }
    
    return self;
}




@end
