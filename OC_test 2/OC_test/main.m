//
//  main.m
//  OC_test
//
//  Created by Terence on 16/6/25.
//  Copyright © 2016年 Terence. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FileManager.h"
#import "Common.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        FileManager* fm = [FileManager shareInstance];
        NSError *err = nil;

        
        BOOL flag = [fm createDirectoryWithName:MAIN_DIRECTORY err:err];
        NSLog(@"创建文件夹");
        
        if (flag && err == nil) {
            NSArray *list = @[@"100", @"200", @"300"];
            [fm createFileWithFileName:TEST_LIST_PATH data:list];
            NSLog(@"创建文件完成，路径是：%@", TEST_LIST_PATH);
        }
        
        
        // 读数据
        NSLog(@"data loading.............");
        NSLog(@"%@", [fm readFileWithName:TEST_LIST_PATH]);
    }
    return 0;
}
