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
#define FRAME_SIZE self.view.frame.size

@interface HomeViewController () <UITableViewDataSource, UITableViewDelegate>

@property(nonatomic, strong)UITableView* uitableView;
@property (nonatomic, strong)NSArray* dataArray;

@end

@implementation HomeViewController

/*
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _uitableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    
    self.uitableView.delegate = self;
    _uitableView.dataSource = self;
    self.uitableView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    
    [self.view addSubview:self.uitableView];
}


// 设置每行高度
- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat result = 20.0f;
    if ([tableView isEqual:_uitableView]) {
        result = 80.0f;
    }
    
    return result;
}

// 允许数据源告知必须加载到table view中的表的section数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    NSInteger result = 0;
    
    if ([tableView isEqual:self.uitableView]) {
        result = 3;
    }
    
    return result;
}

// 设置每个section显示多少行
#pragma mark- UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSInteger result = 0;
    
    if ([tableView isEqual:self.uitableView]) {
        switch (section) {
            case 1:
                result = 3;
                break;
            case 2:
                result = 5;
                break;
            case 3:
                result = 8;
                break;
            default:
                break;
        }
    }
    
    return result;
}

//每行显示的数据
#pragma mark- UITableViewDataSource
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = nil;
    
    if ([tableView isEqual:self.uitableView]) {
        static NSString *tableViewCellIndentifier = @"terCell";
        //通过标示符返回一个可重用的表视图单元格对象
        cell = [tableView dequeueReusableCellWithIdentifier:tableViewCellIndentifier];
        
        if (cell == nil) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:tableViewCellIndentifier];
            
            //
            cell.textLabel.text = [NSString stringWithFormat:@"Section %ld,Cell %ld",(long)indexPath.section,(long)indexPath.row];
            
        }

    }
    return cell;
}*/

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    [self.view addSubview:self.uitableView];
    
    self.dataArray = [[EngineInterface shareInstances] homePageWithData];
    
    if (self.dataArray && self.dataArray.count > 0) {
        [self.uitableView reloadData];
    }
}

// uitableview 的get方法
-(UITableView*)uitableView{
    if (!_uitableView) {
        _uitableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, FRAME_SIZE.width, FRAME_SIZE.height) style:UITableViewStylePlain];
        _uitableView.showsVerticalScrollIndicator = NO;
        _uitableView.showsHorizontalScrollIndicator = NO;
        _uitableView.dataSource = self;
        _uitableView.delegate = self;
    }
    
    return _uitableView;
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
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIndentifier];
    }
    
    if ((indexPath.row > 0) && (indexPath.row < self.dataArray.count)) {
        Student* st = (Student*)[self.dataArray objectAtIndex:indexPath.row];
        cell.imageView.image = [UIImage imageNamed:st.imageName];
        cell.textLabel.text = st.name;
        cell.detailTextLabel.text = st.address;
    }
    
    return cell;
}



@end
