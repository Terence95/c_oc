//
//  EngineInterface.m
//  WXTabBarDemo
//
//  Created by Terence on 16/6/28.
//  Copyright © 2016年 Terence. All rights reserved.
//

#import "EngineInterface.h"
#import "Student.h"

@interface EngineInterface ()

@property(nonatomic, strong)NSMutableArray* studentArray;

@end


@implementation EngineInterface

+(instancetype)shareInstances{
    static EngineInterface* instances = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instances = [[EngineInterface alloc] init];
    });
    
    return instances;
}

-(instancetype)init{
    self = [super init];
    
    if (self) {
        _studentArray = [NSMutableArray array];
        [self homePageWithArray:nil];
    }
    
    return self;
}

-(void)homePageWithArray:(NSArray *)listArray{
    for (int i = 0; i < 20; i++) {
       
        Student* st = [[Student alloc] init];
        if (i % 2 == 0) {
            st.imageName = @"IMG_0155.JPG";
        }else{
            st.imageName = @"IMG_2368.JPG";
        }
        
        st.name = [NSString stringWithFormat:@"ter%d", i];
        
        st.age = 21;
        
        st.sex = @"男";
        st.address = @"🙈🙈🙈🙈🙈🙈🙈🙈";
        st.phoneNum = 123456789;
        st.numID = 10001;

        [_studentArray addObject:st];
    }
}

-(NSArray*)homePageWithData {
    return self.studentArray;
}


// 定义一个接口，返回的是具体index的 对象
-(Student*)homeDetailDataWithIndex:(int)index{
    
    if (index >=0 && index < self.studentArray.count) {
        return [self.studentArray objectAtIndex:index];
    }else{
        return nil;
    }
    
}

@end
