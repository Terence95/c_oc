//
//  AboutMeHeaderView.h
//  Fake_keep2.0
//
//  Created by Terence on 16/7/2.
//  Copyright © 2016年 Terence. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol AboutMeHeaderViewDelegate <NSObject>

@end

@interface AboutMeHeaderView : UIView

@property(nonatomic, weak)id <AboutMeHeaderViewDelegate> delegate;

@end
