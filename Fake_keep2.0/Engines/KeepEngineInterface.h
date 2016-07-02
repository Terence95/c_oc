//
//  KeepEngineInterface.h
//  Fake_keep2.0
//
//  Created by Terence on 16/7/2.
//  Copyright © 2016年 Terence. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KeepEngineInterface : NSObject

+(instancetype)shareInstances;

-(NSArray*)aboutmePageWithData;

-(void)aboutmePageWithArray:(NSArray*)listArray;

@end
