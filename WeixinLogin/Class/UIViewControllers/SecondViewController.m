//
//  SecondViewController.m
//  WeixinLogin
//
//  Created by Terence on 16/6/23.
//  Copyright © 2016年 Terence. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController () <UITextFieldDelegate> //代理

@property(nonatomic, strong)UITextField* userNameField;
@property(nonatomic, strong)UISlider* sliderview;
@property(nonatomic, strong)NSTimer* timer;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"Contact";
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWasShown:) name:UIKeyboardDidShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWasHidden:) name:UIKeyboardDidHideNotification object:nil];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self initUI];
    [self.view addSubview:self.userNameField];
    [self.view addSubview:self.sliderview];
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSDefaultRunLoopMode];
    [self.timer fire];
    
}


-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    
}



-(void)initUI{
    UIButton* btn = [UIButton buttonWithType:UIButtonTypeSystem];
    btn.frame = CGRectMake(30, 200, 200, 40);
    btn.backgroundColor = [UIColor colorWithRed:0.306 green:0.506 blue:0.532 alpha:1];
    [btn setTitle:@"abc" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    
//    [btn addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    
    btn.tag = 1000;
    
    [self.view addSubview:btn];
    
}

-(UITextField*)userNameField{
    if (_userNameField == nil) {
        _userNameField = [[UITextField alloc] initWithFrame:CGRectMake(100, 50, 200, 44)];
        _userNameField.backgroundColor = [UIColor redColor];
        _userNameField.borderStyle = UITextBorderStyleRoundedRect;
        
        _userNameField.returnKeyType = UIReturnKeySearch;
        _userNameField.keyboardType = UIKeyboardTypeDefault;
        _userNameField.clearButtonMode = YES;
        
        //
        _userNameField.delegate = self;
        
    }
    
    return _userNameField;
}

-(UISlider*)sliderview{
    if (_sliderview == nil) {
        _sliderview = [[UISlider alloc] initWithFrame:CGRectMake(10, 300, 300, 5)];
        _sliderview.minimumTrackTintColor = [UIColor redColor];
//        _sliderview.maximumTrackTintColor = [UIColor yellowColor];
        
    }
    return _sliderview;
}


-(NSTimer*)timer{
    if (_timer == nil) {
       
        // 这种方式在timer启动之前要把它加入NSloop中 [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSDefaultRunLoopMode];
        _timer = [NSTimer timerWithTimeInterval:1. target:self selector:@selector(runTimer) userInfo:nil repeats:YES];
//        _timer = [NSTimer ];
    }
    return _timer;
}


#pragma mark-UITextFieldDelegate
- (BOOL)textFieldShouldClear:(UITextField *)textField{
    // 代理，相当于重写
    NSLog(@"clear been clicked");
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}
-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
//    [textField becomeFirstResponder];
    return YES;
}

-(void)keyboardWasShown:(NSNotification*) notify{
    CGRect frame = [self.view frame];
    
    if ([notify.name isEqualToString:UIKeyboardDidShowNotification]) {
        [UIView animateWithDuration:0.3 animations:^{
            self.view.frame = frame;
        }
        completion:^(BOOL finished){
                             
        }];
    }
    
    NSDictionary *info = [notify userInfo];
    NSValue *aValue = [info objectForKey:UIKeyboardFrameBeginUserInfoKey];
    CGSize keyBoardSize = [aValue CGRectValue].size;
    
    CGRect rect = self.userNameField.frame;
    rect.origin.y = self.view.frame.size.height - keyBoardSize.height - rect.size.height;
    self.userNameField.frame = rect;
}


-(void)keyboardWasHidden:(NSNotification*) notify{
    NSDictionary *info = [notify userInfo];
    NSValue *aValue = [info objectForKey:UIKeyboardFrameBeginUserInfoKey];
    
    CGSize keyBoardSize = [aValue CGRectValue].size;
    
    CGRect rect = self.userNameField.frame;
    rect.origin.y = self.view.frame.size.height - rect.size.height;
    self.userNameField.frame = rect;
}

-(void)runTimer{
    CGFloat value = self.sliderview.value/self.sliderview.maximumValue;
    value += .1f;
    [self.sliderview setValue:value animated:YES];
//    NSLog(@"111");
}
@end
