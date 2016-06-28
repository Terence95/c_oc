//
//  EngineInterface.h
//  WXTabBarDemo
//
//  Created by Terence on 16/6/28.
//  Copyright © 2016年 Terence. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EngineInterface : NSObject

+(instancetype)shareInstances;

-(NSArray*)homePageWithData;

-(void)homePageWithArray:(NSArray*)listArray;

@end
