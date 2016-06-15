//
//  main.m
//  parctice_cpy
//
//  Created by Terence on 16/6/15.
//  Copyright © 2016年 Terence. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        //浅拷贝
        NSLog(@"浅cpy");
        NSString *str = [NSString stringWithFormat:@"%@", @"copy"];
        NSLog(@"str创建之后计数器的值:%li", (unsigned long)[str retainCount]);
        NSLog(@"str内存地址：%p", str);
        
        //
        NSString *string = [str copy];
        NSLog(@"str浅拷贝之后计数器的值:%li", (unsigned long)[str retainCount]);
        NSLog(@"string 内存地址：%p", string);
        NSLog(@"string计数器的值:%li", (unsigned long)[string retainCount]);
        
        // 深拷贝
        NSLog(@"深拷贝");
        NSMutableString *str_1 = [NSMutableString stringWithFormat:@"Deep copy"];
        NSLog(@"str_1创建之后的计数器的值：%li", [str_1 retainCount]);
        NSLog(@"str_1内存地址：%p", str_1);
        
        NSMutableString *string_1 = [str_1 copy];
        NSLog(@"str_1深拷贝之后计数器的值：%li", [str_1 retainCount]);
        NSLog(@"string_1的计数器的值：%li", [string_1 retainCount]);
        NSLog(@"string_1的内存地址：%p", string_1);
        
        // retain
        NSLog(@"retain:");
        NSString *str_r = [NSString stringWithFormat:@"retain"];
        NSLog(@"str_r创建之后计数器的值：%li", [str_r retainCount]);
        NSLog(@"str_r的内存地址：%p", str_r);
        
        NSString *string_r = [str_r retain];
        NSLog(@"str_r retain之后计数器的值：%li", [str_r retainCount]);
        NSLog(@"string_r的内存地址：%p",string_r);
        NSLog(@"string_r的计数器的值：%li", [string_r retainCount]);
        
        
        
    }
    return 0;
}
