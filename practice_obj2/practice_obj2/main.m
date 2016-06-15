//
//  main.m
//  practice_obj2
//
//  Created by Terence on 16/6/15.
//  Copyright © 2016年 Terence. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Dog.h"
#import "Person.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Person *person = [[Person alloc] init];
        [person walkTheDog:9];
        
        [person walkTheDog:10];
        
        [person walkTheDog:11];
    }
    return 0;
}
