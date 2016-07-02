//
//  AboutMeTableViewCell.h
//  Fake_keep2.0
//
//  Created by Terence on 16/7/2.
//  Copyright © 2016年 Terence. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol AboutMeTableViewCellDelegate <NSObject>

@end

@interface AboutMeTableViewCell : UITableViewCell

@property (nonatomic, weak)id<AboutMeTableViewCellDelegate> delegate;

-(void)showHomeCell;

@end
