//
//  FileManager.m
//  OC_test
//
//  Created by Terence on 16/6/25.
//  Copyright © 2016年 Terence. All rights reserved.
//

#import "FileManager.h"

@interface FileManager()

@property(nonatomic, strong)NSFileManager* fm;
@property(nonatomic, strong)NSFileHandle* fhandler;

@end

@implementation FileManager

+(instancetype)shareInstance{
    // static
    static FileManager *instances = nil;
    
    static dispatch_once_t oneToken;
    
    dispatch_once(&oneToken, ^{
        instances = [[FileManager alloc] init];
    });
    
    return instances;
}

-(NSFileManager*)fm{
    if (_fm == nil) {
        _fm = [NSFileManager defaultManager];
    }
    
    return _fm;
}


-(instancetype)init{
    self = [super init];
    if (self) {
    
    }
    return self;
}

-(BOOL)createDirectoryWithName:(NSString *)name err:(NSError * __autoreleasing)err{
    if (!name) {
        return NO;
    }
    return [self.fm createDirectoryAtPath:name withIntermediateDirectories:YES attributes:nil error:&err];
}


-(void)createFileWithFileName:(NSString *)filename data:(NSArray *)items{
    if (!filename || !items) {
        return;
    }
    
    [items writeToFile:filename atomically:YES];
}


-(void)writeDataToFile:(NSString *)fileName data:(NSArray *)items{
    if (!fileName || !items) {
        return;
    }
    [self.fhandler writeData:(NSData*)items];
}


-(NSArray*)readFileWithName:(NSString *)filename{
    if (!filename) {
        return NO;
    }
    if ([self.fm fileExistsAtPath:filename]) {
        return [NSArray arrayWithContentsOfFile:filename];
    }else{
        return nil;
    }
    
}



@end
