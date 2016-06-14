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
        // 创建字典
        NSDictionary *dic1 = [NSDictionary dictionaryWithObject:@"vlaue1" forKey:@"key1"];
        
        
        // 对象方法创建
        NSDictionary *_dic = [[NSDictionary alloc] initWithObjectsAndKeys:@"1", @"key1", @"2", @"key2", @"3", @"key3", nil];
        
        // 求字典大小
        NSLog(@"%lu", (unsigned long)[_dic count]);
        
        //
        NSArray *allkeys = [_dic allKeys];
        NSArray *allvalues = [_dic allValues];
        NSLog(@"all keys: %@", allkeys);
        NSLog(@"all values: %@", allvalues);
        
        
        
        // 创建可修改的字典
        NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
        [mutableDict setObject:@"hello" forKey:NSDICTFORKEY];
        
        // 创建多个字典
        NSDictionary *dic2 = [NSDictionary dictionaryWithObjectsAndKeys:
                              @"value1", @"key1"
                              @"value2", @"key2"
                              @"vaule3", @"key3", nil];
#if 0
        NSEnumerator *enumeratorKey = [dic2 objectEnumerator];
        // NSLog(@"%@", enumeratorKey);

        // 快速枚举遍历所有key值
        for (NSObject *obj in enumeratorKey) {
            NSLog(@"遍历KEY值:%@", obj);
        }
#endif
        
        // 通过key找到value
        NSObject *obj = [_dic objectForKey:@"key2"];
        NSLog(@"%@", obj);
        
        
        // 字典的存在是为了解决在大量数据中查找方便，因为他通过key直接找到value，速度很快，避免一个个遍历造成的效率低下
        
        
    }
    return 0;
}
