//
//  Lamp.m
//  practice_obj2
//
//  Created by Terence on 16/6/15.
//  Copyright © 2016年 Terence. All rights reserved.
//

#import "Lamp.h"

@implementation Lamp

-(instancetype)init{
    self = [super init];
    
    if (self) {
        _wattage = @"100w";
    }
    
    return self;
}

-(void)light{
    NSLog(@"lamp light");
}

-(void)dark{
    NSLog(@"lamp dark");
}

@end
