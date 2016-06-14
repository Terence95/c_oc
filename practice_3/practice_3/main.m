//
//  main.m
//  practice_3
//
//  Created by Terence on 16/6/14.
//  Copyright © 2016年 Terence. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSMutableString *str = [NSMutableString stringWithString:@"iphoneAndroiddsfasfa"];
        NSArray *_str = [str componentsSeparatedByString:@"Android"];
        NSLog(@"%@", _str);
        
        NSRange range;
        range.location = 0;
        range.length = 5;
        
        NSArray str_1 = [str deleteCharactersInRange:range];
        NSLog(@"");
        
       
    }
    return 0;
}
