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

-(instancetype)init{
    self = [super init];
    if (self) {
        _name = @"ter";
        _dog = @"Cibotium";
        _puppy = [[Dog alloc] init];
    }
    return self;
}

//setter retain写法
-(void)setPuppy:(Dog *)puppy{
    if (_puppy != puppy) {
        [_puppy release];
        _puppy = [puppy retain];
    }
}

-(void)walkTheDog:(int)time{
    
    if (_puppy != nil) {
        if (time == 9) {
            [_puppy run];
        }else if(time == 10){
            [_puppy getTheBall];
        }else{
            [_puppy bark];
        }
    }
}

@end
