//
//  MineViewController.m
//  Fake_keep2.0
//
//  Created by Terence on 16/6/30.
//  Copyright © 2016年 Terence. All rights reserved.
//

#import "MineViewController.h"
#import "AboutMeTableViewCell.h"
#import "AboutMeHeaderView.h"
#import "SecondViewController.h"

//屏幕的宽高
#define SCREEN_W [UIScreen mainScreen].bounds.size.width
#define SCREEN_H [UIScreen mainScreen].bounds.size.height

@interface MineViewController () <UITableViewDelegate, UITableViewDataSource, AboutMeTableViewCellDelegate>

@property(nonatomic, strong)UITableView* tableview;
@property(nonatomic, strong)NSArray* dataArray;

@property(nonatomic, strong)AboutMeHeaderView* aboutmeHeaderView;
@property(nonatomic, strong)UIView* devideLine;

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
    _tableview.tableHeaderView = self.aboutmeHeaderView;
//    [self.view addSubview:self.blankView];
    _dataArray = @[@[@"me_icon_history.png", @"训练历史"],@[@"u_center_grade.png", @"训练等级"], @[@"u_center_badge.png", @"我的徽章"], @[@"me_icon_runlevel.png", @"跑步等级"], @[@"u_center_collect.png", @"我的收藏"], @[@"shoppingcart_icon.png", @"购物车"], @[@"order.png", @"我的订单"], @[@"u_center_personal.png", @"个人资料"]];
    
    
    
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
        _tableview = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_W, SCREEN_H + 500) style:UITableViewStyleGrouped];
        _tableview.backgroundColor = [UIColor clearColor];
        _tableview.showsHorizontalScrollIndicator = NO;
        _tableview.dataSource = self;
        _tableview.delegate = self;
        
    }
    return _tableview;
}


#pragma -mark UITableViewDelegate

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 4;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    switch (section) {
        case 0:
            return 4;
            break;
        case 1:
            return 1;
            break;
        case 2:
            return 2;
            break;
        case 3:
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
        
        
    }else if (indexPath.section == 1){
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
        
    }else if (indexPath.section == 2){
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
        
    }else if (indexPath.section == 3){
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

-(UIView*)devideLine{
    if (!_devideLine) {
        _devideLine = [[UIView alloc] initWithFrame:CGRectMake(0, self.aboutmeHeaderView.frame.size.height-20, SCREEN_W, 20)];
        _devideLine.backgroundColor = [UIColor colorWithRed:0.909  green:0.921  blue:0.942 alpha:1];
        
    }
    return _devideLine;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    SecondViewController* secVc = [[SecondViewController alloc] init];
    secVc.title = @"secondTitle";
    secVc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:secVc animated:YES];

}



//initHeaderview
-(AboutMeHeaderView*)aboutmeHeaderView{
    if (!_aboutmeHeaderView) {
        _aboutmeHeaderView = [[AboutMeHeaderView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_W, 180)];
        _aboutmeHeaderView.backgroundColor = [UIColor whiteColor];
        [_aboutmeHeaderView addSubview:self.devideLine];
        
        // 上半部分包含头像等 名字信息
        UIView* upView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_W, 100)];
        UIImageView* headlogo = [[UIImageView alloc] initWithFrame:CGRectMake(15, 15, 70, 70)];
        UILabel* nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 20, 100, 30)];
        [nameLabel setText:@"Terence"];
        headlogo.layer.cornerRadius = 65/2;
        headlogo.layer.masksToBounds=YES;
        headlogo.layer.borderWidth = 0.4;
        [headlogo setImage:[UIImage imageNamed:@"headlogo.png"]];
        UIButton* nextbtn = [[UIButton alloc] initWithFrame:CGRectMake(340, (upView.frame.size.height-30)/2, 20, 30)];
        [nextbtn setImage:[UIImage imageNamed:@"web_next_on.png"] forState:UIControlStateNormal];
        [upView addSubview:headlogo];
        [upView addSubview:nameLabel];
        [upView addSubview:nextbtn];
       
        // headerview和下面tableview的分隔线
        UIView* line = [[UIView alloc] initWithFrame:CGRectMake(0, 100, SCREEN_W, 0.5)];
        line.backgroundColor = [UIColor colorWithRed:0.909  green:0.921  blue:0.942 alpha:1];
        [_aboutmeHeaderView addSubview:line];
        
        
        
        
        // 下半部分，三个按钮和几个label和
        UIView* downView = [[UIView alloc] initWithFrame:CGRectMake(0, 100, SCREEN_W, 60)];
        UIView* downBtnView1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_W/3, 60)];
        UIButton* btn1 = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, SCREEN_W/3, 60)];
        [downBtnView1 addSubview:btn1];
        [downView addSubview:downBtnView1];
        UILabel* trends = [[UILabel alloc] initWithFrame:CGRectMake(0, 10, SCREEN_W/3, 20)];
        
        [trends setText:@"动态"];
        trends.textAlignment = NSTextAlignmentCenter;
        [trends setFont:[UIFont systemFontOfSize:12.f]];
        
        UILabel* trendsNumber = [[UILabel alloc] initWithFrame:CGRectMake(0, 20, SCREEN_W/3, 40)];
        [trendsNumber setText:@"32"];
        trendsNumber.textAlignment = NSTextAlignmentCenter;
        [trendsNumber setFont:[UIFont systemFontOfSize:20.f]];
        [downBtnView1 addSubview:trends];
        [downBtnView1 addSubview:trendsNumber];
        
        // -------------------这段可以重构，抽取出来---------------------
        
        UIView* downBtnView2 = [[UIView alloc] initWithFrame:CGRectMake(1*SCREEN_W/3, 0, SCREEN_W/3, 60)];
        UIButton* btn2 = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, SCREEN_W/3, 60)];
        [downView addSubview:downBtnView2];
        [downBtnView2 addSubview:btn2];
//        btn2.backgroundColor = [UIColor redColor];
//        downBtnView2.backgroundColor = [UIColor blueColor];
        UILabel* focus = [[UILabel alloc] initWithFrame:CGRectMake(0, 10, SCREEN_W/3, 20)];
        
        [focus setText:@"关注"];
        focus.textAlignment = NSTextAlignmentCenter;
        [focus setFont:[UIFont systemFontOfSize:12.f]];
        
        UILabel* focusNumber = [[UILabel alloc] initWithFrame:CGRectMake(0, 20, SCREEN_W/3, 40)];
        [focusNumber setText:@"6"];
         focusNumber.textAlignment = NSTextAlignmentCenter;
        [ focusNumber setFont:[UIFont systemFontOfSize:20.f]];
        [downBtnView2 addSubview:focus];
        [downBtnView2 addSubview:focusNumber];
        
        
        UIView* downBtnView3 = [[UIView alloc] initWithFrame:CGRectMake(2*SCREEN_W/3, 0, SCREEN_W/3, 60)];
        UIButton* btn3 = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, SCREEN_W/3, 60)];
        [downView addSubview:downBtnView3];
//        btn3.backgroundColor = [UIColor redColor];
        [downBtnView3 addSubview:btn3];
        
//        downBtnView3.backgroundColor = [UIColor blueColor];
        UILabel* fans = [[UILabel alloc] initWithFrame:CGRectMake(0, 10, SCREEN_W/3, 20)];
        
        [fans setText:@"粉丝"];
        fans.textAlignment = NSTextAlignmentCenter;
        [fans setFont:[UIFont systemFontOfSize:12.f]];
        
        UILabel* fansNumber = [[UILabel alloc] initWithFrame:CGRectMake(0, 20, SCREEN_W/3, 40)];
        [fansNumber setText:@"6"];
        fansNumber.textAlignment = NSTextAlignmentCenter;
        [fansNumber setFont:[UIFont systemFontOfSize:20.f]];
        [downBtnView3 addSubview:fans];
        [downBtnView3 addSubview:fansNumber];
        


        
        [_aboutmeHeaderView addSubview:upView];
        [_aboutmeHeaderView addSubview:downView];
        
    }
    return _aboutmeHeaderView;
}

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
