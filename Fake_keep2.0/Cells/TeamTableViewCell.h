//
//  TeamTableViewCell.h
//  Fake_keep2.0
//
//  Created by Terence on 16/7/3.
//  Copyright © 2016年 Terence. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol TeamTableViewCellDelegate <NSObject>



@end

@class teamTableViewData;
@interface TeamTableViewCell : UITableViewCell

-(void)showTeamCell;

@property(nonatomic, strong)teamTableViewData* data;
@property(nonatomic, weak) id<TeamTableViewCellDelegate> delegate;


@end
