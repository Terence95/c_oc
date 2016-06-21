//
//  main.m
//  practice_obj2
//
//  Created by Terence on 16/6/15.
//  Copyright © 2016年 Terence. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Car.h"
#import "Dog.h"
#import "Person.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Person *person = [[Person alloc] init];
        [person walkTheDog:9];
        
        [person walkTheDog:10];
        
        [person walkTheDog:11];
#if 0
        Dog *dd = [[Dog alloc] init];
        NSLog(@"rc %lu", [dd retainCount]);
        NSLog(@"%p", dd);
        [dd retain];
        
        NSLog(@"%lu", [dd retainCount]);
        NSLog(@"%p", dd);
        
        [dd release];
        NSLog(@"%lu", [dd retainCount]);
        
        [dd release];
        dd = nil;
        NSLog(@"%lu", [dd retainCount]);
        
        [dd release];
#endif
        Car *car = [[Car alloc] init];
        NSLog(@"%p", car);
        [car run];
        NSLog(@"--------------------------");
        [car stop];
        [car release];
        NSLog(@"%p", car);
        [car retain];
        NSLog(@"%lu", [car retainCount]);
        [car release];
        NSLog(@"%lu", [car retainCount]);
        [car release];
        NSLog(@"%lu", [car retainCount]);
        

        
    }
    return 0;
}
