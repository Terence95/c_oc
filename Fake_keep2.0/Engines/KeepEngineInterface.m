//
//  KeepEngineInterface.m
//  Fake_keep2.0
//
//  Created by Terence on 16/7/2.
//  Copyright © 2016年 Terence. All rights reserved.
//

#import "KeepEngineInterface.h"
#import "AboutMeViewCellData.h"

@interface KeepEngineInterface()
@property(nonatomic, strong)NSMutableArray* aboutmeCellArray;

@end

@implementation KeepEngineInterface

+(instancetype)shareInstances{
    static KeepEngineInterface* instance = nil;
    
    static dispatch_once_t oneToken;
    
    dispatch_once(&oneToken, ^{
        instance = [[KeepEngineInterface alloc] init];
    });
    
    return instance;
}

-(NSArray*)aboutmePageWithData{
    return self.aboutmeCellArray;
}

-(void)aboutmePageWithArray:(NSArray*)listArray{
    AboutMeViewCellData* trainHistory = [[AboutMeViewCellData alloc] init];
    trainHistory.title = @"训练历史";
    trainHistory.imagaName = @"me_icon_history.png";
    
    
    
}



@end
