//
//  main.m
//  test
//
//  Created by Terence on 16/6/19.
//  Copyright © 2016年 Terence. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <readline/readline.h>
#import <stdio.h>
#import "A.h"
#import "B.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
#if 0
        // insert code here...
        NSLog(@"Hello, World!");
//        const char *name = (const char*)readline(NULL);
//        const char *name = readline(NULL);
//        NSString *str2 = [NSString stringWithUTF8String:name];
//        NSLog(@"%@", str2);
        
        
        float bmi = 63/(1.76*1.76);
        NSLog(@"bmi %f", bmi);
        float result = 1.2*bmi + (0.23)*21 - 5.4-10.8*1;
        NSLog(@"%f", result);
#endif
        A *a = [[A alloc] init];
        B *b = [[B alloc] init];
        [b setAClass:a];
        NSLog(@"1");
        [a showA];
        [b showAClass];
        NSLog(@"2");
        
        
    }
    return 0;
}
