//
//  main.m
//  practice_2_2
//  Simple RedBlueBall
//  Created by Terence on 16/6/14.
//  Copyright © 2016年 Terence. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSMutableSet *mutableset = [NSMutableSet set];
        int blueball;
        for (int i = 0; i < 7; i++) {
            int rannum = ((arc4random()%33)+1);
            NSNumber *redball = [[NSNumber alloc]initWithInt:rannum];
            [mutableset addObject:redball];
            
        }
        NSLog(@"Red ball set: %@",mutableset);
        
        blueball = ((arc4random()%8)+1);
        NSLog(@"Blue ball set: %d", blueball);
    }
    return 0;
}
