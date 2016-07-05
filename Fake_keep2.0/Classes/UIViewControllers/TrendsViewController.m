//
//  TrendsViewController.m
//  Fake_keep2.0
//
//  Created by Terence on 16/6/30.
//  Copyright © 2016年 Terence. All rights reserved.
//

#import "TrendsViewController.h"
#import "TeamTableViewCell.h"
#import "teamTableViewData.h"
#import "FocusTableViewCell.h"
#define FRAME_SIZE self.view.frame.size
#define SCREEN_W [UIScreen mainScreen].bounds.size.width
#define SCREEN_H [UIScreen mainScreen].bounds.size.height
@interface TrendsViewController () <UIScrollViewDelegate, UITableViewDelegate, UITableViewDataSource, TeamTableViewCellDelegate, FocusTableViewCellDelegate>

@property(nonatomic, strong)UIScrollView* trendScrollView;
@property(nonatomic, strong)UIButton* titleViewBtn1;
@property(nonatomic, strong)UIButton* titleViewBtn2;
@property(nonatomic, strong)UIView* titleBtnView;
@property(nonatomic, strong)UIPageControl* pagecontrol;
@property(nonatomic, assign)NSInteger currentpage;

@property(nonatomic, strong)UITableView* focusTableView;
@property(nonatomic, strong)UITableView* teamTableView;

@property(nonatomic, strong)NSArray* dataArray;



@end

//static const char *UIControl_acceptEventInterval = "UIControl_acceptEventInterval";

@implementation TrendsViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithRed:0.909  green:0.921  blue:0.942 alpha:1];
    [self initUI];
    [self trendScrollViewWithSth];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    
    
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
}

/**
 *  初始化所有UI组件
 */
-(void)initUI{
    [self.view addSubview:self.trendScrollView];
    [self initTitleView];
    [self initNavigationBarLeftItem:@"add.png"];
    [self initNavigationBarRightItem:@"news.png"];
}

-(UIScrollView*)trendScrollView{
    if (!_trendScrollView) {
        _trendScrollView = [[UIScrollView alloc] initWithFrame:[UIScreen mainScreen].bounds];
        [self.view addSubview:self.trendScrollView];
        _trendScrollView.contentSize = CGSizeMake(2 * FRAME_SIZE.width, FRAME_SIZE.height);
        _trendScrollView.showsHorizontalScrollIndicator = NO;
        _trendScrollView.pagingEnabled = YES;
        _trendScrollView.bounces = NO;
        _trendScrollView.alwaysBounceVertical = YES;
        _trendScrollView.delegate = self;
        
    }
    return _trendScrollView;
}


/**
 *  focusTableView的get方法
 *
 *  @return
 */
-(UITableView*)focusTableView{
    if (!_focusTableView) {
        _focusTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_W, SCREEN_H) style:UITableViewStylePlain];
//        _focusTableView.backgroundColor = [UIColor yellowColor];
        _focusTableView.showsHorizontalScrollIndicator = NO;
        _focusTableView.dataSource = self;
        _focusTableView.delegate = self;
    }
    return _focusTableView;
}

/**
 *  teamTable的get方法
 *
 *  @return
 */
-(UITableView*)teamTableView{
    if (!_teamTableView) {
        _teamTableView = [[UITableView alloc]initWithFrame:CGRectMake(1*FRAME_SIZE.width, 10, SCREEN_W, SCREEN_H) style:UITableViewStylePlain];
//        _teamTableView.backgroundColor = [UIColor redColor];
        _teamTableView.showsHorizontalScrollIndicator = NO;
        _teamTableView.dataSource = self;
        _teamTableView.delegate = self;
        _teamTableView.userInteractionEnabled = NO;
    }
    return _teamTableView;
}

-(void)trendScrollViewWithSth{

    UIView* view1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, FRAME_SIZE.width, FRAME_SIZE.height)];
    UILabel* label1 = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    [label1 setText:@"关注界面"];
    [view1 addSubview:label1];
    
    
    
    // 小组界面
    UIView* view2 = [[UIView alloc] initWithFrame:CGRectMake(1*FRAME_SIZE.width, 0, FRAME_SIZE.width, FRAME_SIZE.height)];
    UILabel* label2 = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    [label2 setText:@"小组界面"];
    [view2 addSubview:label2];
    
    
    
//    [self.trendScrollView ];
    [self.trendScrollView addSubview:self.focusTableView];
    [self.trendScrollView addSubview:self.teamTableView];
    
}



-(void)initTitleView{
    
    [self.titleBtnView addSubview:self.titleViewBtn1];
    [self.titleBtnView addSubview:self.titleViewBtn2];
    self.navigationItem.titleView = self.titleBtnView;
    
}

-(UIButton*)titleViewBtn1{
    if (!_titleViewBtn1) {
        _titleViewBtn1 = [[UIButton alloc] initWithFrame:CGRectMake((self.titleBtnView.frame.size.width - 110)/2, 0, 55, 40)];
        [_titleViewBtn1 setTitle:@"已关注" forState:UIControlStateNormal];
        [_titleViewBtn1.titleLabel setFont:[UIFont systemFontOfSize:14.f]];
        [_titleViewBtn1 addTarget:self action:@selector(attentionBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _titleViewBtn1;
}

-(IBAction)attentionBtnClicked:(UIButton*)sender{
    if (sender && [sender isKindOfClass:[UIButton class]]) {
        NSLog(@"关注btn被点击");
        sender.enabled = NO;
        CGPoint offset = self.trendScrollView.contentOffset;
        if (offset.x != 0) {
            
            offset.x -= FRAME_SIZE.width;
            [self.trendScrollView setContentOffset:offset animated:YES];
            offset.x = 0;
        }
        sender.enabled = YES;
    }
}

-(UIButton*)titleViewBtn2{
    if (!_titleViewBtn2) {
        _titleViewBtn2 = [[UIButton alloc] initWithFrame:CGRectMake((self.titleBtnView.frame.size.width - 110)/2+55, 0, 55, 40)];
        [_titleViewBtn2 setTitle:@"小组" forState:UIControlStateNormal];
        [_titleViewBtn2.titleLabel setFont:[UIFont systemFontOfSize:14.f]];
        [_titleViewBtn2 addTarget:self action:@selector(titleViewBtn2Clicked) forControlEvents:UIControlEventTouchUpInside];
    }
    return _titleViewBtn2;
}

-(void)titleViewBtn2Clicked{
    NSLog(@"小组btn被点击");
    CGPoint offset = self.trendScrollView.contentOffset;
    if (offset.x != FRAME_SIZE.width) {
        offset.x += FRAME_SIZE.width;
        [self.trendScrollView setContentOffset:offset animated:YES];
    }
}

-(UIView*)titleBtnView{
    if (!_titleBtnView) {
        _titleBtnView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 120, 40)];
    }
    return _titleBtnView;
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

#pragma -mark UIScrollViewDelegate

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat pageWidth = scrollView.frame.size.width;
    
    int currentPage = floor((scrollView.contentOffset.x - pageWidth/2)/pageWidth)+1;
        
    if (currentPage == 0) {
        [self.titleViewBtn1 setTitleColor:[UIColor colorWithRed:1  green:1  blue:1 alpha:1] forState:UIControlStateNormal];
        [self.titleViewBtn2 setTitleColor:[UIColor colorWithRed:0.902  green:0.902  blue:0.902 alpha:0.5] forState:UIControlStateNormal];

    }else if (currentPage == 1){
        [self.titleViewBtn2 setTitleColor:[UIColor colorWithRed:1  green:1  blue:1 alpha:1] forState:UIControlStateNormal];
        [self.titleViewBtn1 setTitleColor:[UIColor colorWithRed:0.902  green:0.902  blue:0.902 alpha:0.5] forState:UIControlStateNormal];
    }
    
    [self setCurrentpage:currentPage];
    
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([tableView isEqual:_teamTableView]) {
        return 80.f;
    }else if ([tableView isEqual:_focusTableView]){
        return 140.f;
    }
    return 0;
}

-(NSArray*)dataArray{
    return _dataArray = @[@[@"runinkeep.png", @"Runners in keep"], @[@"100day.png", @"Keep 打卡 100天"], @[@"studentkeep.png", @"学生党一起练"], @[@"guangzhou.png", @"Keepers in 珠海"], @[@"shanghai.png", @"Keepers in 上海"],@[@"1.jpg", @"Keepers in 广州"],@[@"beijing.png", @"Keepers in 北京"]];
}

-(void)setCurrentpage:(NSInteger)currentpage{
    if (currentpage) {
        _currentpage = currentpage;
    }
}


#pragma -mark UITableViewSource
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([tableView isEqual:_teamTableView]) {
        static NSString* identifier = @"teamCell";
//        UITableViewCell* cell = (UITableViewCell*)[tableView dequeueReusableCellWithIdentifier:identifier];
        TeamTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (cell == nil) {
            cell = [[TeamTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
            cell.delegate = self;
        }
        NSArray* array = _dataArray[indexPath.row];
        teamTableViewData* teamdata = [[teamTableViewData alloc] init];
        teamdata.imageName = array[0];
        teamdata.nameText = array[1];
        teamdata.detailText = @"16286成员 1666帖子";
        cell.data = teamdata;
        
        [cell showTeamCell];
        
//        cell.imageView.image = [UIImage imageNamed:array[0]];
//        cell.textLabel.text = array[1];
//        cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
        
        
        return cell;
    }else if ([tableView isEqual:_focusTableView]){
        static NSString* Focusidentifier = @"focusCell";
        FocusTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:Focusidentifier];
        if (cell == nil) {
            cell = [[FocusTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:Focusidentifier];
            cell.selectionStyle=UITableViewCellSelectionStyleNone;
            cell.delegate = self;
        }
        
        return cell;
        
    }
    return nil;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if ([tableView isEqual:_teamTableView]) {
        return self.dataArray.count;
    }else if ([tableView isEqual:_focusTableView]){
        // 这里是写死的数据，正确的方法是动态获得数组的长度        
        return 4;
    }
    return 0;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if ([tableView isEqual:_focusTableView]) {
        return 1;
    }else if ([tableView isEqual:_teamTableView]){
        return 1;
    }
    
    return 0;
}

#pragma -mark UITableViewDelegate



@end
