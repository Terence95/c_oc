//
//  TeamTableViewCell.m
//  Fake_keep2.0
//
//  Created by Terence on 16/7/3.
//  Copyright © 2016年 Terence. All rights reserved.
//

#import "TeamTableViewCell.h"
#import "teamTableViewData.h"
#define SCREEN_W [UIScreen mainScreen].bounds.size.width
#define SCREEN_H [UIScreen mainScreen].bounds.size.height

@interface TeamTableViewCell ()

@property(nonatomic, strong)UIImageView* headView;
@property(nonatomic, strong)UILabel* nameLabel;
@property(nonatomic, strong)UILabel* detailLabel;

//@property(nonatomic, strong)UILabel

@end

@implementation TeamTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        [self initUI];
    }
    
    return self;
}

-(void)initUI{
//    self.contentView.backgroundColor = [UIColor redColor];
    
   UIView* maskView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_W, 80)];
    
    [self.contentView addSubview:maskView];
    
    [maskView addSubview:self.headView];
    [maskView addSubview:self.nameLabel];
    [maskView addSubview:self.detailLabel];
}


-(UILabel*)detailLabel{
    
    if (!_detailLabel) {
        _detailLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.headView.frame)+5, CGRectGetMaxY(self.nameLabel.frame)-5, SCREEN_W, 30)];
//        _detailLabel.backgroundColor = [UIColor grayColor];
        [_detailLabel setTextColor:[UIColor grayColor]];
        [_detailLabel setFont:[UIFont systemFontOfSize:11.f]];
    }
    return _detailLabel;
}



-(UIImageView*)headView{
    if (!_headView) {
        _headView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 20, 50, 50)];
        _headView.backgroundColor = [UIColor blueColor];
    }
    return _headView;
}

-(UILabel*)nameLabel{
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.headView.frame)+5, 15, SCREEN_W, 30)];
//        _nameLabel.backgroundColor = [UIColor yellowColor];
        [_nameLabel setFont:[UIFont systemFontOfSize:15.f]];
    }
    return _nameLabel;
}



// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

-(void)showTeamCell{
    self.headView.image = [UIImage imageNamed:self.data.imageName];
    self.nameLabel.text = self.data.nameText;
    self.detailLabel.text = self.data.detailText;
//    self.dateLabel.text = self.data.dateText;
}
@end
