//
//  Engine.h
//  practice_obj2
//
//  Created by Terence on 16/6/15.
//  Copyright © 2016年 Terence. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Engine : NSObject

@property(nonatomic, copy)NSString* model;
@property(nonatomic, copy)NSString* capacity;

-(void)turn;
-(void)stopTurn;

@end
