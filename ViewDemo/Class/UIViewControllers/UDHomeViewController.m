//
//  UDHomeViewController.m
//  ViewDemo
//
//  Created by Terence on 16/6/23.
//  Copyright © 2016年 Terence. All rights reserved.
//

#import "UDHomeViewController.h"
#import "PublicDefine.h"
#import "IntroductionView.h"
@interface UDHomeViewController ()

@property(nonatomic, strong)UIButton* nextbtn;
@property(nonatomic, strong)IntroductionView* introview;
@property(nonatomic, strong)UILabel* usernamelabel;
@property(nonatomic, strong)UILabel* passwordlabel;

@end

@implementation UDHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor orangeColor];
    
    [[UIApplication sharedApplication].keyWindow addSubview:self.introview];
    
}

-(void)initUI{
    [self.view addSubview:self.nextbtn];
    [self.view addSubview:self.usernamelabel];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self initUI];
    
    
//    NSLog(@"diaoyong");
    
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
}

-(UIButton*)nextbtn{
    if (_nextbtn == nil) {
        _nextbtn = [[UIButton alloc] initWithFrame:CGRectMake(0 , 44, UD_SCREEN_WIDTH, 40)];
        _nextbtn.backgroundColor = [UIColor whiteColor];
        [_nextbtn setTitle:@"next" forState:UIControlStateNormal];
        [_nextbtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_nextbtn addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _nextbtn;
}


-(void)btnClicked:(id)sender{
    [[UIApplication sharedApplication].keyWindow addSubview:self.introview];
}
-(IntroductionView*)introview{
    if (_introview == nil) {
        _introview = [[IntroductionView alloc] initWithFrame:CGRectMake(0, 0, UD_SCREEN_WIDTH, UD_SCREEN_HEIGHT)];
    }
    
    return _introview;
}

-(UILabel*)usernamelabel{
    if (_usernamelabel == nil) {
        _usernamelabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 100, 200, 44)];
        _usernamelabel.backgroundColor = [UIColor brownColor];
        _usernamelabel.text = @"account";
        _usernamelabel.textColor = [UIColor whiteColor];
        [_usernamelabel setFont:[UIFont systemFontOfSize:18.f]];
        
        _usernamelabel.textAlignment = NSTextAlignmentCenter;
    }
    return _usernamelabel;
}
@end
