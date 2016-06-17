//
//  Car.h
//  practice_obj2
//
//  Created by Terence on 16/6/15.
//  Copyright © 2016年 Terence. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Engine;
@class Lamp;

@interface Car : NSObject


@property(nonatomic, copy)NSString* name;
@property(nonatomic, copy)NSString* licence;
@property(nonatomic, retain)Engine* engine;
@property(nonatomic, retain)Lamp* lamp;


-(void)run;
-(void)stop;


@end
