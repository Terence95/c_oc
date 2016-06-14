//
//  main.m
//  practice_array
//
//  Created by 中软国际018 on 16/6/14.
//  Copyright (c) 2016年 中软国际018. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // 1 通过alloc创建
        NSArray *arr1 = [NSArray arrayWithObjects:@"a", @"b", @"c", nil];
        // 多个数组放入其中
        NSArray *array1 = @[@"a", @"b"];
        NSLog(@"array1 = %@", array1);
        
        // 2 通过类方法创建
        NSArray *arr2 = [NSArray arrayWithObjects:@"a", @"b", @"c", nil];
        NSLog(@"arr2 = %@", arr2);
        // 3 获取下标为0的对象
        NSObject *obj = [arr1 objectAtIndex:0];
        NSLog(@"%@", obj);
        
        // 4 数组中元素个数
        long c1 = [arr2 count];
        NSLog(@"c1 = %ld", c1);
        
        
        // 5 判断是否包含某个对象
        BOOL isContain  = [arr1 containsObject:@"a"];
        NSLog(@"isContain = %d", isContain);
        
        // 6 对象在数组中的索引位置
        long index = [arr1 indexOfObject:@"a"];
        NSLog(@"index of a in arr1 = %lu", index);
        
        // 7 链接数组中的字符串
        NSString *str_1 = [NSString string];
        str_1 = [arr1 componentsJoinedByString:@"ter"];
        NSLog(@"%@", str_1);
        
        // 8 最后一个元素
        NSString *str_2 = [NSString string];
        str_2 = [arr1 lastObject];
        NSLog(@"%@", str_2);
        
        // 9 xcode 4.4新语法访问数组中的元素
        NSLog(@"%@", arr2[0]);
        
        
        // 10 xcode 4.4新语法创建数组
        NSArray *arr3 = @[@"2"];
        NSLog(@"arr3 = %@", arr3);
        
        // 11 创建可变数组，设定五个储存空间
        NSMutableArray *muarr1 = [[NSMutableArray alloc] initWithObjects: @"1", @"2", @"3", @"4", nil];
        NSLog(@"%@", muarr1);
        
        // 12 添加元素
        [muarr1 addObject:@"5"];
        NSLog(@"%@", muarr1);
        [muarr1 addObjectsFromArray:arr1];
        NSLog(@"%@", muarr1);
        
        // 13 指定位置插入元素
        [muarr1 insertObject:@"1-2" atIndex:2];
        NSLog(@"%@", muarr1);
        
        // 14 替换元素
        [muarr1 replaceObjectAtIndex:8 withObject:@"8c"];
        NSLog(@"%@", muarr1);
        
        // 15 互换两个元素位置
        [muarr1 exchangeObjectAtIndex:0 withObjectAtIndex:8];
        NSLog(@"%@", muarr1);
        
        // 16 将另外一个数组中的元素添加到
        NSArray *arr4 = [[NSArray alloc] initWithObjects:@"10", @"20", nil];
        [muarr1 addObjectsFromArray:arr4];
        NSLog(@"%@", muarr1);
        
        // 17 删除指定位置的元素
        [muarr1 removeObjectAtIndex:2];
        NSLog(@"%@", muarr1);
        
        // 18 删除指定的对象
        [muarr1 removeObject:@"8c"];
        NSLog(@"%@", muarr1);
        
        // 19 删除最后一个元素
        [muarr1 removeLastObject];
        NSLog(@"%@", muarr1);
        
        // 20 删除所有元素
        NSMutableArray *arr5 = [NSMutableArray arrayWithObjects:@"1", @"2", @"3", nil];
        NSLog(@"%@", arr5);
        [arr5 removeAllObjects];
        NSLog(@"%@", arr5);
        
        // 21 使用两种循环遍历数组
        //
        NSLog(@"loop1");
        for (NSInteger i = 0; i < muarr1.count;i++ ) {
            NSString *p = [muarr1 objectAtIndex:i];
            NSLog(@"%@", p);
        }
        NSLog(@"\n");
        // 22 使用新的数组调用的方法
        NSLog(@"loop2");
        for (NSInteger i = 0; i < muarr1.count; i++) {
            NSString *p = muarr1[i];
            NSLog(@"%@",p);
        }
        
        
    }
    return 0;
}
