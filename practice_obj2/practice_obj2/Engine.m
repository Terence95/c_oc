//
//  Engine.m
//  practice_obj2
//
//  Created by Terence on 16/6/15.
//  Copyright © 2016年 Terence. All rights reserved.
//

#import "Engine.h"

@implementation Engine

-(instancetype)init{
    self = [super init];
    
    if (self) {
        _model = @"Audi V8";
        _capacity = @"3.0";
    }
    
    return self;
}

-(void)turn{
    NSLog(@"engine turn");
}

-(void)stopTurn{
    NSLog(@"engine stop turn");
}

@end
