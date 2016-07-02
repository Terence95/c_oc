//
//  AboutMeTableViewCell.m
//  Fake_keep2.0
//
//  Created by Terence on 16/7/2.
//  Copyright © 2016年 Terence. All rights reserved.
//

#import "AboutMeTableViewCell.h"
#define SCREEN_W [UIScreen mainScreen].bounds.size.width
#define SCREEN_H [UIScreen mainScreen].bounds.size.height
@interface AboutMeTableViewCell ()

@property(nonatomic, strong) UIImageView* headLogo;

@property(nonatomic, strong) UIView* btnView;
@property(nonatomic, strong) UIButton* trendsBtn;


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

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        [self initUI];
    }
    return self;
}

-(void)initUI{
    self.contentView.backgroundColor = [UIColor whiteColor];
    
    UIView* maskView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_W, 300)];
    maskView.backgroundColor = [UIColor yellowColor];
    [self.contentView addSubview:maskView];
    
    [maskView addSubview:self.headLogo];
}

-(UIImageView*)headLogo{
    if (!_headLogo) {
        _headLogo = [[UIImageView alloc] initWithFrame:CGRectMake(10, 20, 40, 40)];
        _headLogo.image = [UIImage imageNamed:@"headlogo.png"];
    }
    return _headLogo;
}

-(void)showHomeCell{
    
}

@end
