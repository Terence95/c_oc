//
//  Person.m
//  arcGetAndSet
//
//  Created by Terence on 16/6/21.
//  Copyright © 2016年 Terence. All rights reserved.
//

#import "Person.h"

@implementation Person

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (NSString*)name{
    return _pername;
}

- (void)setPername:(NSString *)pername{
    if (_pername != pername) {
        _pername = pername;
    }
}


@end
