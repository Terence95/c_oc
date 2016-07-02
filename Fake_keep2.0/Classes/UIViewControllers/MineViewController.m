//
//  MineViewController.m
//  Fake_keep2.0
//
//  Created by Terence on 16/6/30.
//  Copyright © 2016年 Terence. All rights reserved.
//

#import "MineViewController.h"
#import "AboutMeTableViewCell.h"
//#import "AboutMeHeaderView.h"


//屏幕的宽高
#define SCREEN_W [UIScreen mainScreen].bounds.size.width
#define SCREEN_H [UIScreen mainScreen].bounds.size.height

@interface MineViewController () <UITableViewDelegate, UITableViewDataSource, AboutMeTableViewCellDelegate>

@property(nonatomic, strong)UITableView* tableview;

@property(nonatomic, strong)NSArray* dataArray;

//@property(nonatomic, strong)AboutMeHeaderView* aboutmeHeaderView;

@property(nonatomic, strong)UIView* blankView;


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
//    _tableview.tableHeaderView = self.aboutmeHeaderView;
//    [self.view addSubview:self.blankView];
    
    _dataArray = @[@[@"me_icon_history.png", @"训练历史"],@[@"u_center_grade.png", @"训练等级"], @[@"u_center_badge.png", @"我的徽章"], @[@"me_icon_runlevel.png", @"跑步等级"], @[@"u_center_collect.png", @"我的收藏"], @[@"shoppingcart_icon.png", @"购物车"], @[@"order.png", @"我的订单"], @[@"u_center_personal.png", @"个人资料"]];
    
    
    
}

//-(UIView*)blankView{
//    if (!_blankView) {
//        _blankView = [[UIView alloc] initWithFrame:CGRectMake(0, self.aboutmeHeaderView.frame.size.height, SCREEN_W, 20)];
//        _blankView.backgroundColor = [UIColor blueColor];
//    }
//    
//    return _blankView;
//}

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
    return 5;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    switch (section) {
        case 0:
            return 1;
        case 1:
            return 4;
            break;
        case 2:
            return 1;
            break;
        case 3:
            return 2;
            break;
        case 4:
            return 1;
            break;
        default:
            return 0;
            break;
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    
    
    UIFont *newFont = [UIFont fontWithName:@"Arial" size:14.0];
    
    if (indexPath.section == 0) {
        static NSString* aIndentifier = @"aTraincell";
        AboutMeTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:aIndentifier];
        if (!cell) {
            cell = [[AboutMeTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:aIndentifier];
            cell.delegate = self;
        }
        
        return cell;
    }else if (indexPath.section == 1) {
        static NSString* TrainCellIndentifier = @"aboutTraincell";
        UITableViewCell* cell = (UITableViewCell*)[tableView dequeueReusableCellWithIdentifier:TrainCellIndentifier];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:TrainCellIndentifier];
        }
        
        cell.textLabel.font = newFont;
        NSArray* array = _dataArray[indexPath.row];
        cell.imageView.image = [UIImage imageNamed:array[0]];
        cell.textLabel.text=array[1];
        cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
        
        return cell;
        
        
    }else if (indexPath.section == 2){
        static NSString* CollectionCellidentifier = @"aboutCollectioncell";
        UITableViewCell* cell = (UITableViewCell*)[tableView dequeueReusableCellWithIdentifier:CollectionCellidentifier];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CollectionCellidentifier];
            
        }
        
        cell.textLabel.font = newFont;
        NSArray* array = _dataArray[4];
        cell.imageView.image = [UIImage imageNamed:array[0]];
        cell.textLabel.text=array[1];
        cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
        
        return cell;
        
    }else if (indexPath.section == 3){
        static NSString* ShoppingCellidentifier = @"aboutShoppingcell";
        UITableViewCell* cell = (UITableViewCell*)[tableView dequeueReusableCellWithIdentifier:ShoppingCellidentifier];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ShoppingCellidentifier];
        }
        
        cell.textLabel.font = newFont;
        
        //        NSArray* array = [[NSArray alloc] initWithObjects:_dataArray[5], _dataArray[6], nil];
        NSArray* array = _dataArray[(indexPath.row)+5];
        cell.imageView.image = [UIImage imageNamed:array[0]];
        cell.textLabel.text=array[1];
        cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
        
        return cell;
        
    }else if (indexPath.section == 4){
        static NSString* aboutMeCellidentifier = @"aboutMecell";
        UITableViewCell* cell = (UITableViewCell*)[tableView dequeueReusableCellWithIdentifier:aboutMeCellidentifier];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:aboutMeCellidentifier];
        }
        
        cell.textLabel.font = newFont;
        
        //        NSArray* array = [[NSArray alloc] initWithObjects:_dataArray[5], _dataArray[6], nil];
        NSArray* array = _dataArray.lastObject;
        cell.imageView.image = [UIImage imageNamed:array[0]];
        cell.textLabel.text=array[1];
        cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
        
        return cell;
        
    }
    
    return nil;
}


// section之间的间隔
//-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
//   
//    return 1;
//}

//initHeaderview
//-(AboutMeHeaderView*)aboutmeHeaderView{
//    if (!_aboutmeHeaderView) {
//        _aboutmeHeaderView = [[AboutMeHeaderView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_W, 120)];
//        _aboutmeHeaderView.backgroundColor = [UIColor yellowColor];
//    }
//    return _aboutmeHeaderView;
//}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (scrollView == _tableview) {
        CGFloat sectionHeaderHeight = 36;;
        if (scrollView.contentOffset.y <= sectionHeaderHeight && scrollView.contentOffset.y >= 0) {
            scrollView.contentInset = UIEdgeInsetsMake(-scrollView.contentOffset.y, 0, 0, 0);
        } else if (scrollView.contentOffset.y >= sectionHeaderHeight) {
            scrollView.contentInset = UIEdgeInsetsMake(-sectionHeaderHeight, 0, 0, 0);
        }
    }
    return;
}


-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 1;
}
@end
