//
//  FocusTableViewCell.m
//  Fake_keep2.0
//
//  Created by Terence on 16/7/3.
//  Copyright © 2016年 Terence. All rights reserved.
//

#import "FocusTableViewCell.h"
#import "focusViewData.h"

#define SCREEN_W [UIScreen mainScreen].bounds.size.width
#define SCREEN_H [UIScreen mainScreen].bounds.size.height

@interface FocusTableViewCell ()

@property(nonatomic, strong)UIImageView* headView;
@property(nonatomic, strong)UILabel* nameLabel;
@property(nonatomic, strong)UILabel* detailLabel;
@property(nonatomic, strong)UIButton* likeBtn;
@property(nonatomic, strong)UIButton* commonBtn;
@property(nonatomic, strong)UIButton* shareBtn;
@property(nonatomic, strong)UIView* topBar;
@property(nonatomic, strong)UIButton* moreBtn;
//@property(nonatomic, strong)UIView* downBar;

@end


@implementation FocusTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        [self initUI];
    }
    
    return self;
}

-(void)initUI{
//    self.contentView.backgroundColor = [UIColor redColor];
    
    UIView* maskView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_W, 100)];
    
    [self.contentView addSubview:maskView];
    [maskView addSubview:self.topBar];
    [maskView addSubview:self.headView];
    [maskView addSubview:self.nameLabel];
    [maskView addSubview:self.detailLabel];
    [maskView addSubview:self.likeBtn];
    [maskView addSubview:self.commonBtn];
    [maskView addSubview:self.shareBtn];
    [maskView addSubview:self.moreBtn];
    
}

-(void)showFocusCell{
    
}

-(UIView*)topBar{
    if (!_topBar) {
        _topBar = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_W, 10)];
        _topBar.backgroundColor = [UIColor colorWithRed:0.909  green:0.921  blue:0.942 alpha:1];
    }
    
    return _topBar;
}

-(UIImageView*)headView{
    if (!_headView) {
        _headView = [[UIImageView alloc] initWithFrame:CGRectMake(15, 20, 40, 40)];
//        _headView.backgroundColor = [UIColor yellowColor];
        [_headView setImage:[UIImage imageNamed:@"headlogo.png"]];
        _headView.layer.cornerRadius = 8;
        _headView.layer.masksToBounds=YES;
        
    }
    return _headView;
}

-(UILabel*)nameLabel{
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.headView.frame)+5, 30, 100, 20)];
//        _nameLabel.backgroundColor = [UIColor blueColor];
        [_nameLabel setText:@"Terence"];
    }
    return _nameLabel;
}


-(UILabel*)detailLabel{
    if (!_detailLabel) {
        _detailLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.headView.frame)+10, SCREEN_W, 30)];
//        _detailLabel.backgroundColor = [UIColor grayColor];
        [_detailLabel setText:@"完成腹肌撕裂训练进阶第33次"];
        _detailLabel.backgroundColor = [UIColor colorWithRed:0.976  green:0.977  blue:0.976 alpha:0.7];
        _detailLabel.textColor = [UIColor colorWithRed:0.671  green:0.671  blue:0.671 alpha:1];
        _detailLabel.textAlignment = NSTextAlignmentCenter;
        [_detailLabel setFont:[UIFont systemFontOfSize:14.f]];
    }
    return _detailLabel;
}

-(UIButton*)likeBtn{
    if (!_likeBtn) {
        _likeBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.detailLabel.frame)+5, SCREEN_W/4, 30)];
//        _likeBtn.backgroundColor = [UIColor blueColor];
        [_likeBtn setImage:[UIImage imageNamed:@"praise.png"] forState:UIControlStateNormal];
    }
    
    return _likeBtn;
}


-(UIButton*)commonBtn{
    if (!_commonBtn) {
        _commonBtn = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_W/4, CGRectGetMaxY(self.detailLabel.frame)+5, SCREEN_W/4, 30)];
        [_commonBtn setImage:[UIImage imageNamed:@"reply.png"] forState:UIControlStateNormal];
    }
    
    return _commonBtn;
}


-(UIButton*)shareBtn{
    if (!_shareBtn) {
       _shareBtn = [[UIButton alloc] initWithFrame:CGRectMake(2*SCREEN_W/4, CGRectGetMaxY(self.detailLabel.frame)+5, SCREEN_W/4, 30)];
        [_shareBtn setImage:[UIImage imageNamed:@"sharebtn_on.png"] forState:UIControlStateNormal];
    }
    
    return _shareBtn;
}

-(UIButton*)moreBtn{
    if (!_moreBtn) {
        _moreBtn = [[UIButton alloc] initWithFrame:CGRectMake(3*SCREEN_W/4, CGRectGetMaxY(self.detailLabel.frame)+5, SCREEN_W/4, 30)];
        [_moreBtn setImage:[UIImage imageNamed:@"moredotnav.png"] forState:UIControlStateNormal];
    }
    
    return _moreBtn;
}



@end
