//
//  AboutMeTableViewCell.m
//  Fake_keep2.0
//
//  Created by Terence on 16/7/2.
//  Copyright © 2016年 Terence. All rights reserved.
//

#import "AboutMeTableViewCell.h"

@interface AboutMeTableViewCell ()

@property(strong, nonatomic) UIImageView* headLogo;


@end

@implementation AboutMeTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


+(instancetype)GetCellWithTableView:(UITableView*)tableView{
    static NSString* identifire = @"aboutMeCell";
    
    AboutMeTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:identifire];
    
    if (!cell) {
        cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
    }
    return cell;
}
@end
