//
//  Student.h
//  WXTabBarDemo
//
//  Created by Terence on 16/6/28.
//  Copyright © 2016年 Terence. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Student : NSObject

@property(nonatomic, copy)NSString* imageName;

@property(nonatomic, copy)NSString* name;
@property(nonatomic, assign)int numID;

@property(nonatomic, copy)NSString* address;
@property(nonatomic, assign)int phoneNum;

@property(nonatomic, assign)int age;
@property(nonatomic, copy)NSString* sex;

@end
