//
//  MineViewController.m
//  Fake_keep2.0
//
//  Created by Terence on 16/6/30.
//  Copyright © 2016年 Terence. All rights reserved.
//

#import "MineViewController.h"
//屏幕的宽高
#define SCREEN_W [UIScreen mainScreen].bounds.size.width
#define SCREEN_H [UIScreen mainScreen].bounds.size.height
@interface MineViewController () <UITableViewDelegate, UITableViewDataSource>

@property(nonatomic, strong)UITableView* tableview;
@property(nonatomic, strong)NSMutableArray* aboutTrain;
@property(nonatomic, strong)NSMutableArray* aboutFavourite;
@property(nonatomic, strong)NSMutableArray* aboutShopping;
@property(nonatomic, strong)NSMutableArray* aboutMyself;

@property(nonatomic, strong)NSMutableArray* titleArray;


@end

@implementation MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithRed:0.909  green:0.921  blue:0.942 alpha:1];
}

-(void)initUI{
    [self initNavigationBarRightItem:@"install.png"];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self initUI];
    [self.view addSubview:self.tableview];

    // uitableview array
    _aboutTrain = [[NSMutableArray alloc] initWithObjects:@"训练历史", @"训练等级", @"我的徽章",@"跑步等级", nil];
    
    _aboutFavourite = [[NSMutableArray alloc] initWithObjects:@"我的收藏", nil];
    
    _aboutShopping = [[NSMutableArray alloc] initWithObjects:@"购物车", @"我的订单", nil];
    
    _aboutMyself = [[NSMutableArray alloc] initWithObjects:@"个人资料", nil];
    _titleArray = [[NSMutableArray alloc] initWithObjects:@"abouttrain", @"aboutfavourite", @"aboutshopping", @"aboutmyself", nil];
    
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
}

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

-(UITableView*)tableview{
    if (!_tableview) {
        _tableview = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_W, SCREEN_H) style:UITableViewStyleGrouped];
        _tableview.backgroundColor = [UIColor clearColor];
        _tableview.showsHorizontalScrollIndicator = NO;
        _tableview.dataSource = self;
        _tableview.delegate = self;
        
    }
    return _tableview;
}


#pragma -mark UITableViewDelegate

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return [_titleArray count];
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    switch (section) {
        case 0:
            return [_aboutTrain count];
            break;
        case 1:
            return [_aboutFavourite count];
            break;
        case 2:
            return [_aboutShopping count];
            break;
        case 3:
            return [_aboutMyself count];
            break;
        default:
            return 0;
            break;
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString* CellIndentifier = @"cell";
    UITableViewCell* cell = (UITableViewCell*)[tableView dequeueReusableCellWithIdentifier:CellIndentifier];
    
    UIFont *newFont = [UIFont fontWithName:@"Arial" size:14.0];

    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithFrame:CGRectZero];
        cell.textLabel.font = newFont;
    }
    
    switch (indexPath.section) {
        case 0:
            [[cell textLabel] setText:[_aboutTrain objectAtIndex:indexPath.row]];
            break;
        case 1:
            [[cell textLabel] setText:[_aboutFavourite objectAtIndex:indexPath.row]];
            break;
        case 2:
            [[cell textLabel] setText:[_aboutShopping objectAtIndex:indexPath.row]];
            break;
        case 3:
            [[cell textLabel] setText:[_aboutMyself objectAtIndex:indexPath.row]];
            break;
        default:
            [[cell textLabel]  setText:@"Unknown"];
            break;
    }
    
    return cell;
}

// section之间的间隔
//-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
//   
//    return 1;
//}


-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 1;
}
@end
