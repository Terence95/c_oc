//
//  Car.m
//  practice_obj2
//
//  Created by Terence on 16/6/15.
//  Copyright © 2016年 Terence. All rights reserved.
//

#import "Car.h"
#import "Engine.h"
#import "Lamp.h"

@implementation Car

-(instancetype)init{
    self = [super init];
    if (self) {
        _name = @"Audi A8";
        _licence = @"8888";
        _engine = [[Engine alloc] init];
        _lamp = [[Lamp alloc] init];
        
    }
    return self;
}

-(void)run{
    [_engine turn];
    [_lamp light];
}

-(void)stop{
    [_engine stopTurn];
    [_lamp dark];
}

@end
