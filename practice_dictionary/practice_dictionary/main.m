//
//  main.m
//  practice_dictionary
//
//  Created by Terence on 16/6/14.
//  Copyright © 2016年 Terence. All rights reserved.
//

#import <Foundation/Foundation.h>
#define NSDICTFORKEY @"NSDICTFORKEY"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        // 字典初始化
        NSNumber *numObj = [NSNumber numberWithInt:100];
        
        // 以一个元素初始化
        NSDictionary *dic_1 = [NSDictionary dictionaryWithObjectsAndKeys:numObj,@"valueKey", nil];
        NSLog(@"%@", dic_1);
        
        
        // 初始化两个元素
        NSDictionary *dic_2 = [NSDictionary dictionaryWithObjectsAndKeys:@"1", @"key1", @"2", @"key2", nil];
        NSLog(@"%@", dic_2);
        
        // c初始化新字典，新字典包含otherDic
        NSDictionary *dic_3 = [NSDictionary dictionaryWithDictionary:dic_1];
        NSLog(@"%@", dic_3);
        
//        以文件内容初始化字典
        
//        NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:path];
        
        // 常用方法
        // 获取字典数量
        NSInteger count = [dic_2 count];
        NSLog(@"%ld", (long)count);
        
        // 通过key获取对应value
        NSObject *valueObj = [dic_2 objectForKey:@"key1"];
        NSLog(@"%@", valueObj);
        
        // 将字典的key转成枚举对象，用于遍历
        NSEnumerator *enumerator = [dic_2 keyEnumerator];
//        NSLog(@"%@", enumerator);
        
        // 获取所有键集合
        NSArray *keys = [dic_2 allKeys];
        NSLog(@"%@", keys);
        
        // 获取所有value集合
        NSArray *values = [dic_2 allValues];
        NSLog(@"%@", values);
        
        // 字典的存在是为了解决在大量数据中查找方便，因为他通过key直接找到value，速度很快，避免一个个遍历造成的效率低下
        
        
    }
    return 0;
}
