//
//  WXLoginViewController.m
//  WeixinLogin
//
//  Created by Terence on 16/6/23.
//  Copyright © 2016年 Terence. All rights reserved.
//

#import "WXLoginViewController.h"
#import "Common.h"
#import "SecondViewController.h"
@interface WXLoginViewController ()

@property(nonatomic, strong)UITextField* passwordtext;
@property(nonatomic, strong)UILabel* passwordlabel;
@property(nonatomic, strong)UIButton* loginbtn;
@property(nonatomic, strong)UIImageView* perlogo;
@property(nonatomic, strong)UIView* line;
@property(nonatomic, strong)UIButton* question;
@property(nonatomic, strong)UILabel* usernamelabel;
@property(nonatomic, strong)UIButton* morebtn;
//@property(nonatomic, strong)SecondViewController* sec;

@end

@implementation WXLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"WeChat";
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    // initUI
    [self initUI];
}

-(void)initUI{
    [self.view addSubview:self.passwordtext];
    [self.view addSubview:self.passwordlabel];
    [self.view addSubview:self.loginbtn];
    [self.view addSubview:self.line];
    [self.view addSubview:self.perlogo];
    [self.view addSubview:self.usernamelabel];
    [self.view addSubview:self.question];
    [self.view addSubview:self.morebtn];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.title = @"wechat";
}


-(UITextField*)passwordtext{
    if (_passwordtext == nil) {
        _passwordtext = [[UITextField alloc] initWithFrame:CGRectMake((SCREEN_WIDTH-240), 250, 200, 30)];
//        _passwordtext.backgroundColor = [UIColor redColor];
        _passwordtext.placeholder = @"请填写密码";
        [_passwordtext setFont:[UIFont systemFontOfSize:14.f]];
        _passwordtext.textAlignment = NSTextAlignmentLeft;
        [_passwordtext setSecureTextEntry:YES];
        _passwordtext.clearButtonMode = YES;
        _passwordtext.returnKeyType = UIReturnKeyDone;
        _passwordtext.delegate = self;
        
    }
    return _passwordtext;
}

-(UILabel*)passwordlabel{
    if (_passwordlabel == nil) {
        _passwordlabel = [[UILabel alloc] initWithFrame:CGRectMake((SCREEN_WIDTH-270)/2, 250, 50, 30)];
//        _passwordlabel.backgroundColor = [UIColor blueColor];
        _passwordlabel.text = @"密码:";
        [_passwordlabel setFont:[UIFont systemFontOfSize:15.f]];
        _passwordlabel.textAlignment = NSTextAlignmentCenter;
        
    }
    
    return _passwordlabel;
}


-(UIButton*)loginbtn{
    if (_loginbtn == nil) {
        _loginbtn = [[UIButton alloc] initWithFrame:CGRectMake((SCREEN_WIDTH-270)/2, 310, 270, 40)];
//        _loginbtn.backgroundColor = [UIColor colorWithRed:114f green:221f blue:61f alpha:0];
//        _loginbtn.backgroundColor = [UIColor orangeColor];
        
        _loginbtn.backgroundColor = [UIColor colorWithRed:0.456 green:0.870 blue:0.243 alpha:1];
        [_loginbtn setTitle:@"登 入" forState:UIControlStateNormal];
        _loginbtn.titleLabel.textAlignment = NSTextAlignmentCenter;
        [_loginbtn.titleLabel setFont:[UIFont systemFontOfSize:17.f]];
        _loginbtn.layer.cornerRadius = 4.f;
        [_loginbtn addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
        _loginbtn.tag = 3000;
        
        
        
    }
    return _loginbtn;
}

-(UIView*)line{
//    CGFloat xPos = 5;
    if (_line == nil) {
        _line = [[UIView alloc] initWithFrame:CGRectMake(30, CGRectGetMaxY(self.passwordtext.frame), SCREEN_WIDTH-10, 0.5)];
        _line.backgroundColor = [UIColor colorWithRed:0.757 green:0.757 blue:0.757 alpha:0.5];
    }
    return _line;
}

-(UIImageView*)perlogo{
    if (_perlogo == nil) {
        _perlogo = [[UIImageView alloc] initWithFrame:CGRectMake((SCREEN_WIDTH-70)/2, 90, 70, 70)];
        _perlogo.backgroundColor = [UIColor colorWithRed:0.974 green:0.374 blue:0.459 alpha:1];
        [_perlogo setImage:[UIImage imageNamed:@"img.png"]];
    }
    return _perlogo;
}

-(UILabel*)usernamelabel{
    if (_usernamelabel == nil) {
        _usernamelabel = [[UILabel alloc] initWithFrame:CGRectMake((SCREEN_WIDTH-100)/2, CGRectGetMaxY(self.perlogo.frame) + 5, 100, 30)];
        _usernamelabel.text = @"wrze320";
        _usernamelabel.textAlignment = NSTextAlignmentCenter;
        [_usernamelabel setFont:[UIFont systemFontOfSize:15.f]];
    }
    return _usernamelabel;
}

-(UIButton*)question{
    if (_question == nil) {
        _question = [[UIButton alloc] initWithFrame:CGRectMake((SCREEN_WIDTH-200)/2, CGRectGetMaxY(self.loginbtn.frame)+15, 200, 44)];
        [_question setTitle:@"登录遇到问题？" forState:UIControlStateNormal];
        //        96 117 152
        _question.backgroundColor = [UIColor clearColor];
        [_question setTitleColor:[UIColor colorWithRed:0.306 green:0.506 blue:0.532 alpha:1] forState:UIControlStateNormal];
        [_question setFont:[UIFont systemFontOfSize:14.f]];
        
        
    }
    return _question;
}

-(UIButton*)morebtn{
    if (_morebtn == nil) {
        _morebtn = [[UIButton alloc] initWithFrame:CGRectMake((SCREEN_WIDTH-100)/2, CGRectGetMaxY(self.question.frame)+110, 100, 40)];
        [_morebtn setTitle:@"更多" forState:UIControlStateNormal];
        [_morebtn setTitleColor:[UIColor colorWithRed:0.306 green:0.506 blue:0.532 alpha:1] forState:UIControlStateNormal];
        [_morebtn setFont:[UIFont systemFontOfSize:14.f]];
    }
    
    return _morebtn;
}



//button的点击事件
-(void)btnClicked:(id)sender{
    if (sender && [sender isKindOfClass:[UIButton class]]) {
        UIButton *btn = (UIButton*)sender;
        switch (btn.tag) {
            case 3000:
//                NSLog(@"i have been clicked");
                [self.navigationController pushViewController:[SecondViewController alloc] animated:YES];
                break;
                
            default:
                break;
        }
        
        
    }
}


#pragma mark-UITextFieldDelegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}



@end
