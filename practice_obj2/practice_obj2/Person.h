//
//  Person.h
//  practice_obj2
//
//  Created by Terence on 16/6/15.
//  Copyright © 2016年 Terence. All rights reserved.
//

#import <Foundation/Foundation.h>

//前置class声明
@class Dog;

@interface Person : NSObject

@property(nonatomic, copy)NSString* name;
@property(nonatomic, copy)NSString* dog;
@property(nonatomic, retain)Dog* puppy;


-(void)walkTheDog:(int)time;

@end
