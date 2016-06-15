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

-(id)init:(Engine*)engine andLamp:(Lamp*)lamp{
    self = [super init];
    if (self) {
        
    }
    return self;
}

-(void)run:(Engine*)engine{
    NSLog(@"car is running");
    [engine turn];
}

@end
