//
//  Dog.m
//  practice_obj2
//
//  Created by Terence on 16/6/15.
//  Copyright © 2016年 Terence. All rights reserved.
//

#import "Dog.h"

@implementation Dog

-(id)init{
    self = [super init];
    if (self) {
        _dogname = @"Hary";
        _color = @"brown";
    }
    return self;
}

-(void)run{
    NSLog(@"I am running");
}

-(void)getTheBall{
    NSLog(@"I help u get the ball");
}

-(void)bark{
    NSLog(@"Bark!!");
}

@end
