//
//  Person.m
//  practice_Extension
//
//  Created by Terence on 16/6/16.
//  Copyright © 2016年 Terence. All rights reserved.
//

#import "Person.h"

// 这个叫做延展
@interface Person ()
-(void)_showInfo;
@end

@implementation Person
/**
 在这里定义属性，这个属性也是私有的
 但是这种方式和@private有区别
 两者的区别是一个在.h文件中定义，一个是在.m文件中定义的
 如果开源，一般是开放.h和.m文件
 如果闭源，一般只开放.h文件
 **/

-(void)speak{
    NSLog(@"Hello world!");
}

// 私有方法，只是在.m文件中定义了，没有在.h文件中声明，一般是在类中自己使用的方法
-(void)_showInfo{
    NSLog(@"my info : i am ter");
}

-(void)useShowInfo{
    Person *per = [[Person alloc] init];
    [per _showInfo];
}

@end
