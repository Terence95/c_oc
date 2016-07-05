//
//  DiscoverInfoColum.h
//  Fake_keep2.0
//
//  Created by Terence on 16/7/4.
//  Copyright © 2016年 Terence. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DiscoverInfoColum : UIView <UIScrollViewDelegate>{
    NSTimer* _timer;
}

//信息展示scrollview
@property(nonatomic, strong) UIScrollView* scrollView;
//@property(nonatomic, strong)
@property(nonatomic, strong) UILabel* imagNum;
@property(nonatomic) NSInteger totalNum;
@property(nonatomic, strong)UIPageControl* pageControl;

-(void)setArray:(NSArray*)imgArray;

-(void)openTimer;
-(void)closeTimer;



@end
