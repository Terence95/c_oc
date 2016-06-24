//
//  ViewController.m
//  SegmentDemo
//
//  Created by Terence on 16/6/24.
//  Copyright © 2016年 Terence. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self initUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)initUI{
    NSArray* segarray = [NSArray arrayWithObjects:@"1", @"2", @"3", nil];
    UISegmentedControl* seg = [[UISegmentedControl alloc] initWithItems:segarray];
    seg.frame = CGRectMake(0, 30, [UIScreen mainScreen].bounds.size.width, 44);
//    seg.segmentedControlStyle = UISegmentedControlStyleBar;
    seg.selectedSegmentIndex = 0;
//    seg.backgroundColor = [UIColor redColor];
    [seg addTarget:self action:@selector(segClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:seg];
    
    UIPageControl* page = [[UIPageControl alloc] initWithFrame:CGRectMake(100, 120, 100, 44)];
    page.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:page];
    page.numberOfPages = 3;
    
    UIActivityIndicatorView* uiactivityindicatorview = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(100, 200, 100, 44)];
    [uiactivityindicatorview setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleGray];
    [uiactivityindicatorview startAnimating];
    [self.view addSubview:uiactivityindicatorview];
    
    
    
}


-(void)segClicked:(id)sender{
    NSLog(@"aaa");
    [self showMessage:@"note" message:@"aaaaaaaaa"];
}

-(void)showMessage:(NSString*)title message:(NSString*)message{
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
}

@end
