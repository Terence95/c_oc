//
//  HomeViewController.m
//  WXTabBarDemo
//
//  Created by Terence on 16/6/27.
//  Copyright © 2016年 Terence. All rights reserved.
//


#import "HomeViewController.h"
#import "Student.h"
#import "EngineInterface.h"
#import "HomeDetailViewController.h"
#import "SDCycleScrollView.h"
#import "HomeHeadView.h"
#import "Public.h"
#define FRAME_SIZE self.view.frame.size
#define FEATURE_COUNT 4

@interface HomeViewController () <UITableViewDataSource, UITableViewDelegate>

@property(nonatomic, strong)UITableView* uitableView;
@property (nonatomic, strong)NSArray* dataArray;
@property(nonatomic, strong)UIScrollView* headview;
@property(nonatomic, strong)HomeHeadView* homeheadview;

@end

@implementation HomeViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 这段解决了，navigationbar遮挡内容的问题
    if([[[UIDevice currentDevice]systemVersion]floatValue]>=7.0)
    {
        self.edgesForExtendedLayout = UIRectEdgeNone;
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    
    [self.view addSubview:self.uitableView];
    [self headviewWithImage];
    
    self.dataArray = [[EngineInterface shareInstances] homePageWithData];
    
    if (self.dataArray && self.dataArray.count > 0) {
        [self.uitableView reloadData];
    }
    
    
    // 这个得封装到 createhead里面
//    self.uitableView.tableHeaderView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 20, FRAME_SIZE.width, 180)];
//    self.uitableView.tableHeaderView.backgroundColor = [UIColor redColor];
    
}

// uitableview 的get方法
-(UITableView*)uitableView{
    if (!_uitableView) {
        _uitableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, FRAME_SIZE.width, FRAME_SIZE.height) style:UITableViewStylePlain];
        _uitableView.showsVerticalScrollIndicator = NO;
        _uitableView.showsHorizontalScrollIndicator = NO;
//        _uitableView.editing = YES;
        _uitableView.dataSource = self;
        _uitableView.delegate = self;
//        _uitableView.tableHeaderView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 20, FRAME_SIZE.width, 180)];
        
//        _uitableView.tableHeaderView = self.headview;
        _uitableView.tableHeaderView = self.homeheadview;
    }
    
    return _uitableView;
}


-(UIScrollView*)headview{
    if (!_headview) {
        _headview = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 20, FRAME_SIZE.width, 180)];
        _headview.backgroundColor = [UIColor redColor];
        self.headview.delegate = self;
        
        self.headview.contentSize = CGSizeMake(4*FRAME_SIZE.width, 180);
        self.headview.pagingEnabled = YES;
        self.headview.showsVerticalScrollIndicator = NO;
        self.headview.showsHorizontalScrollIndicator = NO;
    }
    
    return _headview;
}

-(HomeHeadView*)homeheadview{
    if (!_homeheadview) {
        _homeheadview = [[HomeHeadView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_FRAME.width, 100)];
    }
    
    return _homeheadview;
}

-(void)headviewWithImage{
    for (int i = 0; i < FEATURE_COUNT; i++) {
        NSString* imageName = [NSString stringWithFormat:@"NF_0%d.jpg", i+1];
        UIImageView* imageView = [[UIImageView alloc] initWithFrame:CGRectMake(i*FRAME_SIZE.width, 0, FRAME_SIZE.width, 180)];
        
        imageView.image = [UIImage imageNamed:imageName];
        [self.headview addSubview:imageView];
    }
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat result = 20.0f;
    if ([tableView isEqual:_uitableView]) {
        result = 50.0f;
    }
    
    
    return result;
}



#pragma mark- UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}

#pragma mark- UITableViewDelegate
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString* cellIndentifier = @"tercell";
    
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:cellIndentifier];
    
    if (!cell) {
        // alloc cell
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIndentifier];
    }
    
    if ((indexPath.row >= 0) && (indexPath.row < self.dataArray.count)) {
        Student* st = (Student*)[self.dataArray objectAtIndex:indexPath.row];
        cell.imageView.image = [UIImage imageNamed:st.imageName];
        cell.imageView.userInteractionEnabled = YES;
        
        
        cell.textLabel.text = st.name;
        cell.detailTextLabel.text = st.address;
        
        // 给图片加点击
        UITapGestureRecognizer* ut = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageclick)];
        [cell.imageView addGestureRecognizer:ut];
    }
    
    return cell;
}

-(void)imageclick{
    NSLog(@"img clicked");
}
// cell点击
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    HomeDetailViewController* hdvc = [[HomeDetailViewController alloc] init];
//    对象之间传递数据, 不应该传对象，这样是对内存关系的考虑，
    int count = (int)self.dataArray.count;
//    注意判断传入参数的合理性
    if ((indexPath.row >= 0) && (indexPath.row < count)) {
        hdvc.currentIndex = (int)indexPath.row;
        hdvc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:hdvc animated:YES];
    }
    
    
    
    
}


@end
