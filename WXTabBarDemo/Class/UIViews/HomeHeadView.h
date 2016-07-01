//
//  HomeHeadView.h
//  WXTabBarDemo
//
//  Created by Terence on 16/6/29.
//  Copyright © 2016年 Terence. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol HomeHeadViewDelegate <NSObject>



@end

@interface HomeHeadView : UIView

@property(nonatomic, weak)id<HomeHeadViewDelegate> delegate;

@end
