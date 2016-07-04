//
//  DiscoverViewController.h
//  Fake_keep2.0
//
//  Created by Terence on 16/6/30.
//  Copyright © 2016年 Terence. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DiscoverInfoColum.h"
@interface DiscoverViewController : UIViewController <UICollectionViewDelegate, UICollectionViewDataSource>
{
    DiscoverInfoColum* _headerView;
    NSMutableArray* _cellArray; // collection数据
}

@property(nonatomic, strong)UICollectionView* collectionView;

@end
