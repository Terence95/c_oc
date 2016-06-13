//
//  main.m
//  str_demo
//
//  Created by Terence on 16/6/13.
//  Copyright © 2016年 Terence. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSString* str = @"hey";
        // 强制转换成int型
        NSLog(@"%d", [str intValue]);
        NSLog(@"Hello, World!");
        
        NSMutableString* mutableStr = [NSMutableString stringWithFormat:@"abcd"];
        NSMutableString* mutableStr2 = [str mutableCopy];
        
        mutableStr = @"ter";
        NSLog(@"%@", mutableStr);
        NSLog(@"address=%p, %@, %@", str, [str class], str);
        NSLog(@"address=%p, %@, %@", mutableStr2, [mutableStr2 class], mutableStr2);
        
        
        // oc 字符串与 c字符串转化
        // 1. C转oc
        NSString *str2 = [[NSString alloc]initWithUTF8String:"c->oc"];
        NSLog(@"%@", str2);
        
        // 2.oc 转 c
        NSString *str3 = @"oc->c";
        const char *p = [str3 UTF8String];
        NSLog(@"%s", p);
        
        
        // 数字转化操作
        NSString *str4 = @"1234";
        // 数字转化成整型数据
        int integer = [str4 intValue];
        // 数字转化成float型
        float _float = [str floatValue];
        // 数字转化成double
        double _double = [str4 doubleValue];
        
        NSLog(@"%d, %f, %f", integer, _float, _double);
        
        // 1、NSString操作函数 NSMutableString都能使用
        // 2、可变字符串-增加，删除，修改
        NSString *str5 = @"Hello";
        
        
        
    }
    return 0;
}
