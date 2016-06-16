//
//  Dog.h
//  practice_obj2
//
//  Created by Terence on 16/6/15.
//  Copyright © 2016年 Terence. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
@interface Dog : NSObject

@property(nonatomic, copy)NSString* dogname;
@property(nonatomic, copy)NSString* color;


-(void)run;
-(void)getTheBall;
-(void)bark;
@end
