//
//  Manager.h
//  carDemo
//
//  Created by Terence on 16/6/15.
//  Copyright © 2016年 Terence. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Manager : NSObject

@property(nonatomic, copy)NSString* usrname;
@property(nonatomic, copy)NSString* pasword;

-(void)changePassword:(NSString*)newpasword;

@end
