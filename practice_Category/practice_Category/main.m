//
//  main.m
//  practice_Category
//
//  Created by Terence on 16/6/16.
//  Copyright © 2016年 Terence. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSString+Extension.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
       NSString *s = @"terence";
       NSLog(@"%@", [s invertString:s]);
    }
    return 0;
}
