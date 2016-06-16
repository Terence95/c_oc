//
//  NSString+Extension.m
//  practice_Category
//
//  Created by Terence on 16/6/16.
//  Copyright © 2016年 Terence. All rights reserved.
//

#import "NSString+Extension.h"

@implementation NSString (Extension)


// 字符串倒转操作
-(NSString*)invertString:(NSString*)str{
    
    NSMutableString *reverseStr = [NSMutableString string];
    
    for (int i = 0; i < str.length; i++) {
        unichar c = [str characterAtIndex:str.length-i-1];
        [reverseStr appendFormat:@"%c",c];
    }
    return reverseStr;
}

@end
