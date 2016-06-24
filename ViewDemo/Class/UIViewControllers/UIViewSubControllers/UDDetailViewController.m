//
//  UDDetailViewController.m
//  ViewDemo
//
//  Created by Terence on 16/6/23.
//  Copyright © 2016年 Terence. All rights reserved.
//

#import "UDDetailViewController.h"
#import "PublicDefine.h"

@interface UDDetailViewController ()
@property(nonatomic, strong)UIButton* backbtn;
@end

@implementation UDDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor purpleColor];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
}


-(UIButton*)backBtn{
    if (_backbtn == nil) {
        _backbtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 64, UD_SCREEN_WIDTH, UD_SCREEN_HEIGHT)];
        _backbtn.backgroundColor = [UIColor blackColor];
        [_backbtn setTitle:@"next" forState:UIControlStateNormal];
        [_backbtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    return _backbtn;
}


@end
