//
//  main.m
//  mrcGetAndSet
//
//  Created by Terence on 16/6/21.
//  Copyright © 2016年 Terence. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Person* per = [[Person alloc] init];
        NSLog(@"%@", per.useName);
        
        [per setUseName:@"tang"];
        NSLog(@"%@", per.useName);
    }
    return 0;
}
