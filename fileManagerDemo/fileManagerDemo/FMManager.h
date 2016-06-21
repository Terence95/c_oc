//
//  FMManager.h
//  fileManagerDemo
//
//  Created by Terence on 16/6/21.
//  Copyright © 2016年 Terence. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FMManager : NSObject

/**
*  单实例对象
*
*  @return 返回该对象
*/
+(instancetype) shareInstance;

/**
 *  创建文件
 *
 *  @param fileName  文件名
 *  @param listItems 数据
 */
-(void)createFileWithFileName:(NSString*)fileName data:(NSArray*)listItems;

/**
 *  创建文件夹
 *
 *  @param name 文件夹名
 *  @param err  错误信息
 *
 *  @return 返回一个bool代表是否创建成功
 */
-(BOOL)createDirectoryWithName:(NSString*)name err:(NSError **)err;


/**
 *  写入文件
 *
 *  @param fileName  文件名
 *  @param listItems 数据
 */
-(void)writeDataToFile:(NSString*)fileName data:(NSArray*)listItems;

/**
 *  读取数据到内存
 *
 *  @param fileName 文件名
 *
 *  @return 返回读取的数据
 */
-(NSArray*)readFileWithName:(NSString*)fileName;

/**
 *  删除文件
 *
 *  @param fileName 文件名
 *
 *  @return 返回bool表示是否删除成功
 */
-(BOOL)removeFileWithName:(NSString*)fileName;


-(NSDictionary*)attributesWithFileName:(NSString*)fileName;

@end
