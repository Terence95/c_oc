//
//  Lamp.h
//  practice_obj2
//
//  Created by Terence on 16/6/15.
//  Copyright © 2016年 Terence. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Lamp : NSObject

@property(nonatomic, copy)NSString* wattage;

-(void)light;
-(void)dark;

@end
