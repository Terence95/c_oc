//
//  DiscoverViewController.m
//  Fake_keep2.0
//
//  Created by Terence on 16/6/30.
//  Copyright © 2016年 Terence. All rights reserved.
//

#import "DiscoverViewController.h"
#import "DiscoverCollectionViewCell.h"

#define SCREEN_W [UIScreen mainScreen].bounds.size.width
#define SCREEN_H [UIScreen mainScreen].bounds.size.height

static float INFO_height = 200;

@interface DiscoverViewController ()

@end

@implementation DiscoverViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
     self.view.backgroundColor = [UIColor colorWithRed:0.909  green:0.921  blue:0.942 alpha:1];
    [self.view addSubview:self.collectionView];
    // 初始化headerview
    _headerView = [[DiscoverInfoColum alloc] initWithFrame:CGRectMake(0, 10, SCREEN_W, INFO_height)];
    _headerView.backgroundColor = [UIColor redColor];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self initUI];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
}

-(void)initUI{
    [self initNavigationBarRightItem:@"searchicon.png"];
}


// 发现的右导航button
-(void)initNavigationBarRightItem:(NSString*)imgName{
    UIBarButtonItem* discoveryNavRightBtn = [[UIBarButtonItem alloc] init];
    UIImage* discoveryRightbtnImg = [UIImage imageNamed:imgName];
    discoveryRightbtnImg = [discoveryRightbtnImg imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [discoveryNavRightBtn setImage:discoveryRightbtnImg];
    self.navigationItem.rightBarButtonItem = discoveryNavRightBtn;
}


#pragma mark- 创建collectionView并设置代理
-(UICollectionView*)collectionView{
    if (_collectionView == nil) {
        UICollectionViewFlowLayout* flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.headerReferenceSize = CGSizeMake(SCREEN_W, INFO_height+10);
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_W, SCREEN_H) collectionViewLayout:flowLayout];
        
        
        // 定义每个UICollectionView的大小
        flowLayout.itemSize = CGSizeMake((SCREEN_W-30)/2, (SCREEN_W-30)/2+50);
        // 定义每个UICollectionView横向间距
        flowLayout.minimumLineSpacing = 10;
        // 定义每个UICollectionView纵向间距
        flowLayout.minimumInteritemSpacing = 0;
        // 定义边距
        flowLayout.sectionInset = UIEdgeInsetsMake(10, 10, 5, 10); // 上左下右
        
        
        //注册cell和ReusableView（相当于头部）
        [_collectionView registerClass:[DiscoverCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
        [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"ReusableView"];
        
        
        // 设置代理
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        
        // 背景色
//        _collectionView.backgroundColor = [UIColor colorWithRed:0.909  green:0.921  blue:0.942 alpha:1];
        _collectionView.backgroundColor = [UIColor whiteColor];
        
        // 自适应大小
        _collectionView.autoresizingMask =  UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    }
    
    return _collectionView;
}

#pragma mark 定义展示的UICollectionViewCell的个数
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
//    return [_cellArray count];
    return 4;
}

#pragma mark 定义展示的Section的个数
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

#pragma mark 每个UICollectionView展示的内容
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identify = @"cell";
    DiscoverCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identify forIndexPath:indexPath];
    [cell sizeToFit];
    
//    cell.imgView.image = [UIImage imageNamed:_cellArray[indexPath.item]];
    cell.imgView.image = [UIImage imageNamed:@"headlogo.png"];
//    cell.text.text = [NSString stringWithFormat:@"Cell %ld",indexPath.item];
    cell.text.text = @"aaa";
    //按钮事件就不实现了……
    return cell;
}

#pragma mark 头部显示的内容
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    UICollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:
                                            UICollectionElementKindSectionHeader withReuseIdentifier:@"ReusableView" forIndexPath:indexPath];
    
    [headerView addSubview:_headerView];//头部广告栏
    return headerView;
}


#pragma mark UICollectionView被选中时调用的方法
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"选择%ld",indexPath.item);
}

@end
