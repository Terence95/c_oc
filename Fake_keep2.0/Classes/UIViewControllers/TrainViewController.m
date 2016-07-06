//
//  TrainViewController.m
//  Fake_keep2.0
//
//  Created by Terence on 16/6/30.
//  Copyright © 2016年 Terence. All rights reserved.
//

#import "TrainViewController.h"
#import "trainViewHeaderView.h"

#define SCREEN_W [UIScreen mainScreen].bounds.size.width
#define SCREEN_H [UIScreen mainScreen].bounds.size.height

@interface TrainViewController ()

@property(nonatomic, strong)UITableView* trainTableView;
@property(nonatomic, strong)trainViewHeaderView* headerview;

@end

@implementation TrainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithRed:0.909  green:0.921  blue:0.942 alpha:1];
}

-(void)initUI{
    [self initNavigationBarLeftItem:@"run_data_list_run.png"];
    [self initNavigationBarRightItem:@"plusbtn_on.png"];
    [self setNaviBarTitleLogo:@"keep_logo.png"];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self initUI];
    [self.view addSubview:self.trainTableView];
    _headerview = [[trainViewHeaderView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_W, 260)];
    
//    _headerview.backgroundColor = [UIColor blueColor];
    self.trainTableView.tableHeaderView = _headerview;
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
}


/**
 *  下面两个方法可放到基类中被继承
 *
 *  @param imgName <#imgName description#>
 */
-(void)initNavigationBarLeftItem:(NSString*)imgName{
    UIBarButtonItem* trendsLeftBtn = [[UIBarButtonItem alloc] init];
    UIImage* trendsLeftBtnImg = [UIImage imageNamed:imgName];
    trendsLeftBtnImg = [trendsLeftBtnImg imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [trendsLeftBtn setImage:trendsLeftBtnImg];
    self.navigationItem.leftBarButtonItem = trendsLeftBtn;
}

-(void)initNavigationBarRightItem:(NSString*)imgName{
    UIBarButtonItem* discoveryNavRightBtn = [[UIBarButtonItem alloc] init];
    UIImage* discoveryRightbtnImg = [UIImage imageNamed:imgName];
    discoveryRightbtnImg = [discoveryRightbtnImg imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [discoveryNavRightBtn setImage:discoveryRightbtnImg];
    self.navigationItem.rightBarButtonItem = discoveryNavRightBtn;
}


/**
 *  <#Description#>
 *
 *  @param logoImgName <#logoImgName description#>
 */
-(void)setNaviBarTitleLogo:(NSString*)logoImgName{
    UIImageView* titleLogoView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:logoImgName]];
    [self.navigationItem setTitleView:titleLogoView];
}


/**
 *  init tableview
 */
-(UITableView*)trainTableView{
    if (!_trainTableView) {
        _trainTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_W, SCREEN_H) style:UITableViewStyleGrouped];
//        _trainTableView.backgroundColor = [UIColor yellowColor];
        _trainTableView.showsHorizontalScrollIndicator = NO;
//        _trainTableView.dataSource = self;
//        _trainTableView.delegate = self;
    }
    return _trainTableView;
}
@end
