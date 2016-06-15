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
    _usrname = usrname;
}

-(void)setPasword:(NSString *)pasword{
    _pasword = pasword;
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
