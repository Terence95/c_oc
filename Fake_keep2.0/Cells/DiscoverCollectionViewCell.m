//
//  DiscoverCollectionViewCell.m
//  Fake_keep2.0
//
//  Created by Terence on 16/7/4.
//  Copyright © 2016年 Terence. All rights reserved.
//

#import "DiscoverCollectionViewCell.h"
#import "collectionCellData.h"

@interface DiscoverCollectionViewCell ()



@end

@implementation DiscoverCollectionViewCell

-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
//        self.backgroundColor = [UIColor purpleColor];
        [self addSubview:self.imgView];
        [self addSubview:self.text];
        [self addSubview:self.praise];
        [self addSubview:self.praiseNum];
        [self addSubview:self.common];
        [self addSubview:self.commonNum];
    }
    
    return self;
}


-(UIImageView*) imgView{
    if (!_imgView) {
        _imgView = [[UIImageView alloc] initWithFrame:CGRectMake((self.frame.size.width-160)/2, 10, 160 ,160)];
        _imgView.backgroundColor = [UIColor redColor];
    }
    return _imgView;
}

-(UILabel*)text{
    if (!_text) {
        _text = [[UILabel alloc] initWithFrame:CGRectMake(5, self.imgView.frame.size.height+15, 160, 40)];
//        _text.backgroundColor = [UIColor blueColor];
        [_text setFont:[UIFont systemFontOfSize:12.f]];
        [_text setTextColor:[UIColor colorWithRed:0.671  green:0.671  blue:0.671 alpha:1]];
    }
    return _text;
}

-(UIImageView*)praise{
    if (!_praise) {
        _praise = [[UIImageView alloc] initWithFrame:CGRectMake(10, self.imgView.frame.size.height+55, 15, 15)];
//        _praise.backgroundColor = [UIColor yellowColor];
        [_praise setImage:[UIImage imageNamed:@"trend_tag_praise2.png"]];
    }
    
    return _praise;
}

-(UILabel*)praiseNum{
    if (!_praiseNum) {
        _praiseNum = [[UILabel alloc] initWithFrame:CGRectMake(35, self.imgView.frame.size.height+55, 30, 15)];
//        _praiseNum.backgroundColor = [UIColor redColor];
//        [_praiseNum setText:@"..."];
        [_praiseNum setFont:[UIFont systemFontOfSize:10.f]];
        [_praiseNum setTextColor:[UIColor colorWithRed:0.671  green:0.671  blue:0.671 alpha:1]];
    }
    
    return _praiseNum;
}

-(UIImageView*)common{
    if (!_common){
        _common = [[UIImageView alloc] initWithFrame:CGRectMake(75, self.imgView.frame.size.height+55, 15, 15)];
//        _common.backgroundColor = [UIColor greenColor];
//        [_common setImage:[UIImage imageNamed:@"trend_tag_reply2.png"]];
        [_common setImage:[UIImage imageNamed:@"trend_tag_reply2.png"]];
    }

    return _common;
}

-(UILabel*)commonNum{
    if (!_commonNum) {
        _commonNum = [[UILabel alloc] initWithFrame:CGRectMake(100, self.imgView.frame.size.height+55, 30, 15)];
        //        _praiseNum.backgroundColor = [UIColor redColor];
//        [_commonNum setText:@"..."];
        [_commonNum setFont:[UIFont systemFontOfSize:10.f]];
        [_commonNum setTextColor:[UIColor colorWithRed:0.671  green:0.671  blue:0.671 alpha:1]];
    }
    
    return _commonNum;
}


//-(void)showTeamCell{
//    self.headView.image = [UIImage imageNamed:self.data.imageName];
//    self.nameLabel.text = self.data.nameText;
//    self.detailLabel.text = self.data.detailText;
//    //    self.dateLabel.text = self.data.dateText;
//}


-(void)showDiscoverCollectionCell{
    self.imgView.image = [UIImage imageNamed:self.data.collectionImgName];
    self.text.text = self.data.text;
    self.praiseNum.text = self.data.praiseNum;
    self.commonNum.text = self.data.commonNum;
    
}
@end
