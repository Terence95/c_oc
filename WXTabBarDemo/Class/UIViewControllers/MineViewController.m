//
//  MineViewController.m
//  WXTabBarDemo
//
//  Created by Terence on 16/6/27.
//  Copyright © 2016年 Terence. All rights reserved.
//

#import "MineViewController.h"
#import "SettingViewController.h"

@interface MineViewController ()

@end

@implementation MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createNavigationRightButton];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)createNavigationRightButton{
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"setting" style:UIBarButtonItemStylePlain target:self action:@selector(setBtnClicked:)];
}

-(void)setBtnClicked:(id)sender{
    if (sender && [sender isKindOfClass:[UIBarButtonItem class]]) {
        SettingViewController* setvc = [[SettingViewController alloc]init];
        setvc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:setvc animated:YES];
        
    }
}

@end
