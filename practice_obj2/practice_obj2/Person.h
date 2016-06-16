//
//  Person.h
//  practice_obj2
//
//  Created by Terence on 16/6/15.
//  Copyright © 2016年 Terence. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Dog.h"

@interface Person : NSObject

{
    
}

@property(nonatomic, copy)NSString* name;
@property(nonatomic, copy)NSString* dog;

-(void)walkTheDog:(int)time;
@end
