//
//  DiscoverCollectionViewCell.h
//  Fake_keep2.0
//
//  Created by Terence on 16/7/4.
//  Copyright © 2016年 Terence. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "collectionCellData.h"
@interface DiscoverCollectionViewCell : UICollectionViewCell

@property(nonatomic, strong)UIImageView* imgView;
@property(nonatomic, strong)UILabel* text;

@property(nonatomic, strong)UIImageView* praise;
@property(nonatomic, strong)UILabel* praiseNum;

@property(nonatomic, strong)UIImageView* common;
@property(nonatomic, strong)UILabel* commonNum;

-(void)showDiscoverCollectionCell;

@property(nonatomic, strong)collectionCellData* data;

@end
