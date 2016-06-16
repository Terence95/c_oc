//
//  Car.h
//  carDemo
//
//  Created by Terence on 16/6/15.
//  Copyright © 2016年 Terence. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Car : NSObject

@property(nonatomic, copy) NSString* name;
@property(nonatomic, copy) NSString* speed;

-(void)startUp;

@end
