//
//  ViewController.m
//  UITextView
//
//  Created by Terence on 16/6/21.
//  Copyright © 2016年 Terence. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.textView =  [[UITextView alloc]initWithFrame:self.view.];
    
    self.textView.textColor = [UIColor blackColor];
    
    self.textView.font = [UIFont fontWithName:@"Arial" size:18.0];
    
    self.textView.delegate = self; //设置它的委托方法
    
    self.textView.backgroundColor = [UIColor whiteColor];
    
    self.textView.text = @"Hello qingqing";
    
    self.textView.returnKeyType = UIReturnKeyDefault; //返回值的类型
    
    self.textView.keyboardType = UIReturnKeyDefault; //键盘类型
    
    self.textView.scrollEnabled = YES; // 是否可以拖动
    
    self.textView.autoresizingMask = UIViewAutoresizingFlexibleWidth; //自适应高度
    
    [self.view addSubview:self.textView]; //加入整个页面
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
