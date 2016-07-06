//
//  ViewController.m
//  PerformDemo
//
//  Created by Terence on 16/7/5.
//  Copyright © 2016年 Terence. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property(nonatomic, strong)UIButton* btn;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.view addSubview:self.btn];
    
    [self performSelectorInBackground:@selector(modifyButtonText) withObject:nil];
}

/**
 *  子线程执行方法
 */
-(void)modifyButtonText{
    NSLog(@"%@", [NSThread currentThread]); //打印当前线程
    [self.btn setTitle:@"logout" forState:UIControlStateNormal];
    
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
}

-(UIButton*)btn{
    if (!_btn) {
        _btn = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 50)];
        _btn.backgroundColor = [UIColor yellowColor];
        [_btn setTitle:@"login" forState:UIControlStateNormal];
        [_btn addTarget:self action:@selector(modifyButtonText) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _btn;
}
@end
