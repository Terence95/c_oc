#类目的概念和使用

- ###使用场景

	当我们想对一个类进行功能扩充，首先想到的方法肯定是继承，但是继承有它自己的限制

	1. 继承的前提是这个类可以被继承，因为总有些类是无法继承的
	
	2. 这个类可以被继承，但是继承会造成一种问题，比如我只想实现一个功能，但继承之后，子类就会把父类所有的功能（属性和方法都继承了）
	


- ###类目的定义

	看如下的代码段：
	
	`NSString+Extension.h`
	
		```
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
		```
	
	可以知道类目的命名规则：类名+扩展方法，比如 `NSString+Helper`
	
	类目的接口声明与类的定义十分相似，但类目不继承父类，只需要一个括号里表明类目的主要用途
	
	
	
	
	再看.m文件里的代码
	
	`NSString+Extension.m`
	
	

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
	
	在这个文件中对是对定义的方法的实现
	
	然后再看main方法
	
		//
		//  main.m
		//  practice_Category
		//
		//  Created by Terence on 16/6/16.
		//  Copyright © 2016年 Terence. All rights reserved.
		//

		#import <Foundation/Foundation.h>
		#import "NSString+Extension.h"
		int main(int argc, const char * argv[]) {
		    @autoreleasepool {
       			NSString *s = @"terence";
		        NSLog(@"%@", [s invertString:s]);
		    }	
    		return 0;
		}
		

	 在main方法中简单定义了一个NSString，然后直接用它来调用类目中的扩展方法，并且能够成功调用
	 
	 
- ###总结
	
	####类目的作用
	1. 为已经存在的类添加扩展的方法
	2. 对类中的方法归类：可以把庞大的类划分成小块来开发，从而更好滴对类中的方法进行更新和维护
	3. 作为子类的扩展手段
	
	####注意事项
	1. 类目的方法一定要实现，否则程序会crash
	2. 类目内不能追加类变量
		



		
	