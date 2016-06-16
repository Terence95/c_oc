//
//  NSString+Extension.h
//  practice_Category
//
//  Created by Terence on 16/6/16.
//  Copyright © 2016年 Terence. All rights reserved.
//

#import <Foundation/Foundation.h>

//定义类目的文件命名规则：类名+类目名称，如“NSString+Extension.h"
@interface NSString (Extension) //注意类目的命名规则

-(NSString*)invertString:(NSString*)str;

@end
