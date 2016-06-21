//
//  main.m
//  fileManagerDemo
//
//  Created by Terence on 16/6/21.
//  Copyright © 2016年 Terence. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMManager.h"
#import "Common.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        FMManager* fm = [FMManager shareInstance];
        NSError *err = nil;
       
        BOOL flag = [fm createDirectoryWithName:MAIN_DIRECTORY err:&err];
        NSLog(@"创建文件夹");
        
        if (flag && err == nil) {
            NSArray *list = @[@"one", @"two", @"three"];
            [fm createFileWithFileName:TEST_LIST_PATH data:list];
        }
        
        
        // 写数据进文件
        NSArray *blist = @[@"1", @"2", @"3"];
        [fm writeDataToFile:TEST_LIST_PATH data:blist];
        
        // 读数据
        NSLog(@"%@", [fm readFileWithName:TEST_LIST_PATH]);
        
        // 查看文件属性
        NSLog(@"%@", [fm attributesWithFileName:TEST_LIST_PATH]);
        
        // 删除文件
        BOOL isRemove = [fm removeFileWithName:TEST_LIST_PATH];
        if (isRemove) {
            NSLog(@"file has been removed");
        }
        
        
        
        
    }
    return 0;
}
