//
//  FindTableViewCell.m
//  WXTabBarDemo
//
//  Created by Terence on 16/6/29.
//  Copyright © 2016年 Terence. All rights reserved.
//

#import "FindTableViewCell.h"
#import "FindPageData.h"
#define SCREEN [UIScreen mainScreen].bounds.size
@interface FindTableViewCell ()

@property(nonatomic, strong)UIImageView *headView;
@property(nonatomic, strong)UILabel* nameLabel;
@property(nonatomic, strong)UILabel* detailLabel;

@property(nonatomic, strong)UILabel* dateLabel;
@property(nonatomic, strong)FindPageData* data;

@end


@implementation FindTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        [self initUI];
    }
    
    return self;
}

-(void)initUI{
    self.contentView.backgroundColor = [UIColor whiteColor];
    UIView* maskView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN.width, 80)];
    
    [self.contentView addSubview:maskView];
    [self addSubview:self.headView];
    [self addSubview:self.nameLabel];
    [self addSubview:self.detailLabel];
}


-(UIImageView*)headView{
    if (!_headView) {
        _headView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 39, 39)];
        _headView.backgroundColor = [UIColor redColor];
    }
    return _headView;
}

-(UILabel*)nameLabel{
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.headView.frame)+5, 10, 100, 30)];
        _nameLabel.backgroundColor = [UIColor blueColor];
    }
    
    return _nameLabel;
}

-(UILabel*)detailLabel{
    if (!_detailLabel) {
        _nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.headView.frame)+5, 10, 100, 30)];
        _nameLabel.backgroundColor = [UIColor purpleColor];
    }
    
    return _detailLabel;
}

-(void)showFindCell{
    self.headView.image = [UIImage imageNamed:self.data.imagename];
    self.nameLabel.text = self.data.name;
    self.detailLabel.text = self.data.detail;
}
@end
