//
//  FMManager.m
//  fileManagerDemo
//
//  Created by Terence on 16/6/21.
//  Copyright © 2016年 Terence. All rights reserved.
//

#import "FMManager.h"

// 这是一个延展
@interface FMManager()

@property(nonatomic, strong)NSFileManager* fm;
@property(nonatomic, strong)NSFileHandle* fhandle;

@end

@implementation FMManager


// 单例把 FMManager 实例化了出来
+(instancetype)shareInstance{
    // 声明静态实例对象
    static FMManager *instances = nil;
    
    static dispatch_once_t oneToken;
    
    dispatch_once(&oneToken, ^{
        instances = [[FMManager alloc] init];
    });
    
    return instances;
}


// fm 的get方法一定要写好，否则调用fm没用
-(NSFileManager*)fm{
    if (_fm == nil) {
        _fm = [NSFileManager defaultManager];
    }
    return _fm;
}

// 初始化方法
-(instancetype)init{
    self = [super init];
    
    if (self) {
        
    }
    
    return self;
}

// 创建文件，并写入数组数据
-(void)createFileWithFileName:(NSString *)fileName data:(NSArray *)listItems{
    if (!fileName || !listItems) {
        return;
    }
    
//    [self.fm createFileAtPath:fileName contents:[listItems sortedArrayHint] attributes:nil];
    [listItems writeToFile:fileName atomically:YES];
}

//创建文件夹
-(BOOL)createDirectoryWithName:(NSString *)name err:(NSError *__autoreleasing *)err{
    if (!name) {
        return NO;
    }
    
    return [self.fm createDirectoryAtPath:name withIntermediateDirectories:YES attributes:nil error:err];
}

//写数据到文件
-(void)writeDataToFile:(NSString *)fileName data:(NSArray *)listItems{
    if (!fileName || !listItems) {
        return;
    }
    [self.fhandle writeData:(NSData*)listItems];
//    [self.fhandle]
}

//读数据到内存
-(NSArray *)readFileWithName:(NSString *)fileName{
    if (!fileName) {
        return NO;
    }
    
    if ([self.fm fileExistsAtPath:fileName]) {
        return [NSArray arrayWithContentsOfFile:fileName];
    }else{
        return nil;
    }
}

//删除文件
-(BOOL)removeFileWithName:(NSString *)fileName{
    
//    NSError* err = nil;
    
    if (!fileName) {
        return NO;
    }
    
//    return [self.fm removeItemAtPath:fileName error:&err];
    return [self.fm removeFileAtPath:fileName handler:nil];
}

//查看文件属性
-(NSDictionary *)attributesWithFileName:(NSString *)fileName{
    if (!fileName) {
        return NO;
    }
    return [self.fm fileAttributesAtPath:fileName traverseLink:YES];
}




@end
