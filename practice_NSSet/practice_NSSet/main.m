//
//  main.m
//  practice_NSSet
//
//  Created by Terence on 16/6/14.
//  Copyright © 2016年 Terence. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSSet *set1 = [NSSet setWithObjects:@"1", @"2", nil];
        NSSet *set2 = [NSSet setWithObjects:@"3", @"4", @"5" ,@"6", nil];
        
        NSArray *array = [NSArray arrayWithObjects:@"6", @"7", @"8", nil];
        NSSet *set3 = [NSSet setWithArray:array];
        
        NSSet *set4 = [NSSet setWithSet:set1];
        NSSet *set5 = [NSSet setWithObjects:@"1", @"2", nil];
        NSSet *set6 = [NSSet setWithObjects:@"1", @"2", @"6", @"7", nil];
        
        NSLog(@"set1 = %@", set1);
        NSLog(@"set2 = %@", set2);
        NSLog(@"set3 = %@", set3);
        NSLog(@"set4 = %@", set4);
        
        // 返回数量
        NSInteger count = [set1 count];
        NSLog(@"%ld", (long)count);
        
// 测试
#if 0
        Boolean a = true;
        Boolean b = false;
        Boolean c = !b;
        if (c) {
            printf("\nyes\n");
        }else{
            printf("no\n");
        }
#endif
        // 返回任意对象
        NSString *string = [set3 anyObject];
        NSLog(@"string = %@", string);
        
        // 返回所有对象
        NSArray *objects = [set3 allObjects];
        NSLog(@"all objs = %@", objects);
        
        // 是否包含
        BOOL isContain = [set3 containsObject:@"6"];
        BOOL isContain1 = [set3 containsObject:@"10"];
        NSLog(@"isContain = %d  isContain1 = %d", isContain, isContain1);
        
        // 集合之间是否存在交集
        BOOL isIntersect = [set2 intersectsSet:set3];
        BOOL isIntersect1 = [set1 intersectsSet:set3];
        NSLog(@"isIntersect = %hhd, isInterset1 = %hhd", isIntersect, isIntersect1);
        
        // 集合是否匹配
        BOOL isEqual = [set1 isEqualToSet:set3];
        BOOL isEqual1 = [set1 isEqualToSet:set5];
        NSLog(@"isEqual = %hhd, isEqual1 = %hhd", isEqual, isEqual1);
        
        // 集合是否是子集
        BOOL isSub = [set2 isSubsetOfSet:set3];
        BOOL isSub1 = [set1 isSubsetOfSet:set6];
        NSLog(@"isSub = %d, isSub1 = %d", isSub, isSub1);
        
        // 集合的添加
        NSSet *set7 = [set5 setByAddingObject:@"one"];
        NSLog(@"set7 = %@", set7);
        NSArray *array1 = [NSArray arrayWithObjects:@"two", @"three", @"four", nil];
        NSSet *set8 = [set7 setByAddingObjectsFromArray:array1];
        NSLog(@"%@", set8);
        
        NSSet *set9 = [set8 setByAddingObjectsFromSet:set5];
        NSLog(@"%@", set9);
        
        // 可变集合的应用
        // 类方法创建set
        NSMutableSet *mutableSet1 = [NSMutableSet set];
        NSMutableSet *mutableSet2 = [NSMutableSet setWithObjects:@"1", @"a", nil];
        NSMutableSet *mutableSet3 = [NSMutableSet setWithObjects:@"2", @"a", nil];
        NSMutableSet *mutableSet4 = [NSMutableSet setWithObjects:@"2", @"a", @"b",nil];
        NSMutableSet *mutableSet5 = [NSMutableSet setWithObjects:@"2", @"a", @"b", @"c", @"d",nil];
        NSLog(@"mutableSet1 = %@", mutableSet1);
        NSLog(@"mutableSet2 = %@", mutableSet2);
        NSLog(@"mutableSet3 = %@", mutableSet3);
        
        // 一个集合减去另一个集合
//        [mutableSet2 minusSet:mutableSet3];
//        NSLog(@"mutableSet2 = %@", mutableSet2);
        
        // 两集合相交
//        [mutableSet2 intersectSet:mutableSet3];
//        NSLog(@"mutableSet2 = %@", mutableSet2);
        
        // 两集合的并集
        [mutableSet2 unionSet:mutableSet3];
        NSLog(@"mutableSet2 = %@", mutableSet2);
        
        // 一个集合给另一个集合赋值
        [mutableSet1 setSet:mutableSet3];
        NSLog(@"%@", mutableSet1);
        
        // 删除集合中的对象
        NSLog(@"mutableSet4 = %@", mutableSet4);
        [mutableSet4 removeObject:@"b"];
        NSLog(@"mutableSet4 = %@", mutableSet4);
        
        [mutableSet4 removeAllObjects];
        NSLog(@"mutableSet4 = %@", mutableSet4);
        
        // 使用数组方式添加对象
        NSLog(@"mutableSet5 = %@", mutableSet5);
        NSArray *array2 = [NSArray arrayWithObjects:@"e", @"f", nil];
        [mutableSet5 addObjectsFromArray:array2];
        NSLog(@"mutableSet5 = %@", mutableSet5);
        
        
    }
    return 0;
}
