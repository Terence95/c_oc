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


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        [self initUI];
    }
    return self;
}

-(void)initUI{
    self.contentView.backgroundColor = [UIColor whiteColor];
    
    
    UIView* maskView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_W, 80)];
    maskView.backgroundColor = [UIColor yellowColor];
    [self.contentView addSubview:maskView];
    
    [maskView addSubview:self.headLogo];
    [maskView addSubview:self.btnView];
    
}

-(UIImageView*)headLogo{
    if (!_headLogo) {
        _headLogo = [[UIImageView alloc] initWithFrame:CGRectMake(10, 29, 40, 40)];
        _headLogo.image = [UIImage imageNamed:@"headlogo.png"];
    }
    return _headLogo;
}

-(void)showHomeCell{
    
}

-(UIView*)btnView{
    if (!_btnView) {
        _btnView = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.headLogo.frame)+5, 15, 100, 30)];
        _btnView.backgroundColor = [UIColor blueColor];
    }
    return _btnView;
}


@end
