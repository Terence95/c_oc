//
//  FileManager.h
//  OC_test
//
//  Created by Terence on 16/6/25.
//  Copyright © 2016年 Terence. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface FileManager : NSObject

/**
 *  单例对象
 *
 *  @return
 */
+(instancetype)shareInstance;

/**
 *  创建文件夹
 *
 *  @param name <#name description#>
 *  @param err  <#err description#>
 *
 *  @return <#return value description#>
 */
-(BOOL)createDirectoryWithName:(NSString*)name err:(NSError*) err;



/**
 *  创建文件
 *
 *  @param filename <#filename description#>
 *  @param items    <#items description#>
 */
-(void)createFileWithFileName:(NSString*)filename data:(NSArray*)items;

/**
 *  写入文件
 *
 *  @param fileName  文件名
 *  @param listItems 数据
 */
-(void)writeDataToFile:(NSString*)fileName data:(NSArray*)items;


/**
 *  读取文件
 *
 *  @param filename <#filename description#>
 *
 *  @return <#return value description#>
 */
-(NSArray*)readFileWithName:(NSString*)filename;

@end
