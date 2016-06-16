//
//  Book.m
//  practice_obj1
//
//  Created by Terence on 16/6/15.
//  Copyright © 2016年 Terence. All rights reserved.
//

#import "Book.h"

@implementation Book

-(id)init{
    self = [super init];
    
    if (self) {
        _title = @"TangTang";
        _pageNum = @"1000";
    }
    
    return self;
}

@end
