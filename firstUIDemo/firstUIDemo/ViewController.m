//
//  ViewController.m
//  firstUIDemo
//
//  Created by Terence on 16/6/22.
//  Copyright © 2016年 Terence. All rights reserved.
//

#import "ViewController.h"

// 这一部分是类的延展
@interface ViewController ()

@property(nonatomic, strong)UILabel* textlabel;
@property(nonatomic, strong)UIButton* changebtn;
@property(nonatomic, strong)UIButton* canclebtn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    // 为了便于开发得给每个子控制器添加背景颜色便于观察
    self.view.backgroundColor = [UIColor orangeColor];
    [self initUI];
    
    
}


-(void)initUI{
    [self.view addSubview:self.textlabel];
    [self.view addSubview:self.changebtn];
    [self.view addSubview:self.canclebtn];
}

//这个函数一般没用
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// 标准的viewController的写法
-(void)viewWillAppear:(BOOL)animated{
    // 每次app开启的时候这个函数会被调用
    [super viewWillAppear:animated];
}

// 关闭app的时候必须调用的函数
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    // app关闭的时候要做些什么可以写在这里
    
}

// 要调用textlabel和btn最好写get方法
-(UILabel*)textlabel{
    if (_textlabel == nil) {
        _textlabel = [[UILabel alloc] initWithFrame:CGRectMake(70, 100, 200, 50)];
        _textlabel.backgroundColor = [UIColor yellowColor];
        _textlabel.text = @"hi tt";
    }
    return _textlabel;
}

// getbtn
-(UIButton*)changebtn{
    if (_changebtn == nil) {
        _changebtn = [[UIButton alloc] initWithFrame:CGRectMake(70, 200, 100, 44)];
        _changebtn.backgroundColor = [UIColor whiteColor];
        [_changebtn setTitle:@"change" forState:UIControlStateNormal];
        [_changebtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _changebtn.layer.cornerRadius = 5.f;
        [_changebtn addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
        _changebtn.tag = 1000;
    }
    return _changebtn;
}

-(UIButton *)canclebtn{
    if (_canclebtn == nil) {
        _canclebtn = [[UIButton alloc] initWithFrame:CGRectMake(70, 250, 100, 44)];
        _canclebtn.backgroundColor = [UIColor whiteColor];
        [_canclebtn setTitle:@"cancle" forState:UIControlStateNormal];
        [_canclebtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _canclebtn.layer.cornerRadius = 5.f;
        [_canclebtn addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
       _canclebtn.tag = 2000;
    }
    return _canclebtn;
}

-(void)btnClicked:(id)sender{
    if (sender && [sender isKindOfClass:[UIButton class]]) {
        UIButton *btn = (UIButton*)sender;
        switch (btn.tag) {
            case 1000:
            {
                NSLog(@"change");
                self.textlabel.text = @"i have changed";
            }
            break;
                
            case 2000:
            {
                NSLog(@"cancel");
            }
                break;
            default:
                break;
        }
    }
    
}

@end
