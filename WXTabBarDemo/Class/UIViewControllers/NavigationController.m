//
//  NavigationController.m
//  WXTabBarDemo
//
//  Created by Terence on 16/6/27.
//  Copyright © 2016年 Terence. All rights reserved.
//

#import "NavigationController.h"

@interface NavigationController ()

@end

@implementation NavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
}

-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    [super pushViewController:viewController animated:animated];
}


/**
 *  创建左按钮
 *
 *  @param viewController <#viewController description#>
 */
-(void)createNavigationLeftButton:(UIViewController*)viewController{
    // 如果》0要加左button
    if ([self viewControllers].count > 0) {
        NSString* leftBtnName = [NSString stringWithFormat:@""];
        
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@""]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(leftBtnClicked:)];        
    }
}



-(void)leftBtnClicked:(id)sender{
    if (sender && [sender isKindOfClass:[UIBarButtonItem class]]) {
        [self popViewControllerAnimated:YES];
    }
}



@end
