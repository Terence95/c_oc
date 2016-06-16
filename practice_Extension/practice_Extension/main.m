//
//  main.m
//  practice_Extension
//
//  Created by Terence on 16/6/16.
//  Copyright © 2016年 Terence. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Person *per = [[Person alloc] init];
        [per speak];
        [per useShowInfo];
    }
    return 0;
}
