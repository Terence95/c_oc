//
//  Person.m
//  mrcGetAndSet
//
//  Created by Terence on 16/6/21.
//  Copyright © 2016年 Terence. All rights reserved.
//

#import "Person.h"

@implementation Person

-(instancetype)init{
    self = [super init];
    
    if (self) {
        _useName = @"ter";
    }
    
    return self;
}

-(void)setUserName:(NSString *)userName{
    if (_useName != userName) {
        [_useName release];
        [_useName retain];
        _useName = userName;
    }
   
}


-(NSString*)userName{
    if (_useName == nil) {
        _useName = [[NSString alloc] init];
    }
    return _useName;
}




@end
