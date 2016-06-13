//
//  main.m
//  practice_2
//
//  Created by Terence on 16/6/13.
//  Copyright © 2016年 Terence. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        for (int i = 0; i < argc; i++) {
            NSLog(@"%s", argv[i]);
        }
    }
    return 0;
}
