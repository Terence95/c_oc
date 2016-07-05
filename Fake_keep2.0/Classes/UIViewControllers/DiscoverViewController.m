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

static float INFO_height = 260;

@interface DiscoverViewController ()

//@property(nonatomic, strong)NSArray* collectionImg;
@property(nonatomic, strong)NSArray* dataArray;

@end

@implementation DiscoverViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
     self.view.backgroundColor = [UIColor colorWithRed:0.909  green:0.921  blue:0.942 alpha:1];
    [self.view addSubview:self.collectionView];
    // 初始化headerview
    _headerView = [[DiscoverInfoColum alloc] initWithFrame:CGRectMake(0, 0, SCREEN_W, INFO_height)];
//    _headerView.backgroundColor = [UIColor redColor];
    
    NSArray* imgArray = [NSArray arrayWithObjects:@"scroll1.png", @"scroll2.png", @"scroll3.png", @"scroll4.png", @"scroll5.png", nil];
    [_headerView setArray:imgArray];
    
    
    NSArray* collectionInfo = @[@[@"discover1.png",@"#我要上精选# 自律", @"190", @"200"],
                                @[@"discover1.png",@"#我要上精选# 自律", @"190", @"200"],
                                @[@"discover1.png",@"#我要上精选# 自律", @"190", @"200"],
                                @[@"discover1.png",@"#我要上精选# 自律", @"190", @"200"]];
    
//    NSLog(@"%@", collectionInfo);
    
//    _cellArray = [collectionInfo mutableCopy];
    
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [_headerView openTimer];
    });
    [self initUI];
    
//    NSLog(@"%@", _dataArray);
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    
    if (_headerView.totalNum > 1) {
        [_headerView closeTimer];
    }
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
        flowLayout.itemSize = CGSizeMake((SCREEN_W-30)/2, (SCREEN_W-30)/2+70);
        // 定义每个UICollectionView横向间距
        flowLayout.minimumLineSpacing = 10;
        // 定义每个UICollectionView纵向间距
        flowLayout.minimumInteritemSpacing = 0;
        // 定义边距
        flowLayout.sectionInset = UIEdgeInsetsMake(30, 10, 5, 10); // 上左下右
        
        
        UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(10, INFO_height+5, 100, 30)];
//        title.backgroundColor = [UIColor yellowColor];
        [title setText:@"精选动态"];
        [title setTextColor:[UIColor colorWithRed:0.671  green:0.671  blue:0.671 alpha:1]];
        [title setFont:[UIFont systemFontOfSize:13.f]];
        [_collectionView addSubview:title];
        
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
    
    NSArray* array = @[@[@"discover1.png",@"#我要上精选# 自律给我自由# 加油七月！", @"190", @"201"],
                       @[@"discover2.png",@"听说今天美国独立日...", @"100", @"202"],
                       @[@"discover3.png",@"#瘦身经历#...", @"...", @"203"],
                       @[@"discover4.png",@"#健身计划#俄挺训练第三个月，简单倒立", @"190", @"..."]];
    
    NSArray* array1 = array[indexPath.row];
    
    cell.imgView.image = [UIImage imageNamed:array1[0]];
    cell.text.text = array1[1];
    cell.praiseNum.text = array1[2];
    cell.commonNum.text = array1[3];

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

#pragma mark- 定时滚动scrollview
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    [_headerView closeTimer];
}

- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset {
    if (_headerView.totalNum>1) {
        [_headerView openTimer];//开启定时器
    }
}

-(NSArray*)dataArray{
    return _dataArray = @[@[@"discover1.png",@"#我要上精选# 自律", @"190", @"200"],
                          @[@"discover1.png",@"#我要上精选# 自律", @"190", @"200"],
                          @[@"discover1.png",@"#我要上精选# 自律", @"190", @"200"],
                          @[@"discover1.png",@"#我要上精选# 自律", @"190", @"200"]];
}

@end
