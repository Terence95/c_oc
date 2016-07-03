//
//  FocusTableViewCell.h
//  Fake_keep2.0
//
//  Created by Terence on 16/7/3.
//  Copyright © 2016年 Terence. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol FocusTableViewCellDelegate <NSObject>



@end

@class focusViewData;
@interface FocusTableViewCell : UITableViewCell

-(void)showFocusCell;

@property(nonatomic, strong)focusViewData* data;
@property(nonatomic, weak)id<FocusTableViewCellDelegate> delegate;

@end
