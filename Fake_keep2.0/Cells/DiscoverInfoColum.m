//
//  DiscoverInfoColum.m
//  Fake_keep2.0
//
//  Created by Terence on 16/7/4.
//  Copyright © 2016年 Terence. All rights reserved.
//

#import "DiscoverInfoColum.h"

@implementation DiscoverInfoColum


-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame))];
        _scrollView.delegate = self;// 设置代理UIScrollViewDelegate
        _scrollView.backgroundColor = [UIColor purpleColor];
    }
    
    return self;
}

@end
