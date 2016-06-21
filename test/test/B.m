//
//  B.m
//  test
//
//  Created by Terence on 16/6/20.
//  Copyright © 2016年 Terence. All rights reserved.
//

#import "B.h"
#import "A.h"
@implementation B

-(instancetype)init{
    self = [super init];
    
    if (self) {
        
    }
    
    return self;
}

-(void)setAClass:(A *)aClass{
    _aClass = aClass;
    
}

-(void)dealloc{
    [super dealloc];
}

-(void)showAClass{
    [_aClass showA];
}

@end
