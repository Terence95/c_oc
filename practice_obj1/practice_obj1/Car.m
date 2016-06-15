//
//  Car.m
//  carDemo
//
//  Created by Terence on 16/6/15.
//  Copyright © 2016年 Terence. All rights reserved.
//

#import "Car.h"

@implementation Car

-(id)init{
    self = [super init];
    
    if (self) {
        
    }
    return self;
}

-(void)startUp{
    NSLog(@"%@ car has been started up, the speed is: %@", _name, _speed);
}

@end
