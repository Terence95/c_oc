//
//  Manager.m
//  carDemo
//
//  Created by Terence on 16/6/15.
//  Copyright © 2016年 Terence. All rights reserved.
//

#import "Manager.h"

@implementation Manager

-(id)init{
    self = [super init];
    
    if (self) {
        
    }
    
    return self;
}

-(void)setUsrname:(NSString *)usrname{
    
    if (_usrname != usrname) {
        
        // 这里不能写成 self.name = name; 因为self.name在等号左边是相当于set方法，就变成自己调自己了
        _usrname = usrname;
    }
}

-(void)setPasword:(NSString *)pasword{
    if (_pasword != pasword) {
        _pasword = pasword;
    }
}

-(NSString *)username{
    return _usrname;
}

-(NSString *)password{
    return _pasword;
}

-(void)changePassword:(NSString *)newpasword{
    _pasword = newpasword;
}
@end
