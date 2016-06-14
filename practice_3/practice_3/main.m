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
        
        // 实例方法
        NSArray *array = [[NSArray alloc] initWithObjects:@"a", @"b", @"c", @"d", nil];
        
        // 类方法数组创建
        NSArray *array2 = [NSArray arrayWithObjects:@"OB1", @"OB2", nil];
        
        NSLog(@"%@", array);
        NSLog(@"%@", array2);
        
        // 数组个数
        NSLog(@"array count:%lu", (unsigned long)[array count]);
        
        
        // 访问元素
        NSLog(@"obj at index: %@", [array objectAtIndex:2]);
        
        
        // 追加（返回新的array对象）
        NSArray *array3 = [array arrayByAddingObject:@"d"];
        NSLog(@"array3 : %@", array3);
        
        // 根据指定的字符串连接数组元素
        NSString *joinstr = [array3 componentsJoinedByString:@"ter"];
        NSLog(@"%@", joinstr);
        
        // 是否包含指定对象
        // 包含则返回1，否则返回0
        NSLog(@"IS CONTAIN : %d", [array containsObject:@"c"]);
        
        // 查找某个对象所在的索引
        NSLog(@"indexofobj: %lu", (unsigned long)[array indexOfObject:@"a"]);
        
        // 最后一个元素
        NSLog(@"LastObj: %@", [array lastObject]);
        
        // 遍历数组
        for (id element in array) {
            NSLog(@"element: %@", element);
        }
        
        
    }
    return 0;
}
