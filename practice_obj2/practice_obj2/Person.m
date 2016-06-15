//
//  Person.m
//  practice_obj2
//
//  Created by Terence on 16/6/15.
//  Copyright © 2016年 Terence. All rights reserved.
//

#import "Person.h"
#import "Dog.h"
@implementation Person

-(id)init{
    self = [super init];
    if (self) {
        _name = @"ter";
        _dog = @"Cibotium";
    }
    return self;
}

-(void)walkTheDog:(int)time{
    Dog *dog = [[Dog alloc] init];
    if (time == 9) {
        [dog run];
    }else if(time == 10){
        [dog getTheBall];
    }else{
        [dog bark];
    }
}

@end
