//
//  main.m
//  carDemo
//
//  Created by Terence on 16/6/15.
//  Copyright © 2016年 Terence. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Car.h"
#import "Manager.h"
#import "Book.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        // car
        Car *car = [[Car alloc] init];
        car.name = @"Benz";
        car.speed = @"100km/h";
        [car startUp];
#if 0
        // Manager
        char pwd[20] = {0};
        char newpwd[20] = {0};
        Manager *manager = [[Manager alloc] init];
        manager.usrname = @"ter";
        manager.pasword = @"320";
        NSString* psd;
        psd = manager.pasword;
        // getpassword
        
        NSLog(@"username = %@, password = %@", manager.usrname, manager.pasword);
        
        NSLog(@"please input old password");
        scanf("%s", pwd);
        NSString *ocpwd = [NSString stringWithUTF8String:pwd];
        NSComparisonResult result = [ocpwd compare:psd];
        
        if (result == 0) {
            NSLog(@"please input new password!");
            scanf("%s", newpwd);
            NSString *ocnewpwd = [NSString stringWithUTF8String:newpwd];
            [manager changePassword:ocnewpwd];
            NSLog(@"username = %@, newpassword = %@", manager.usrname, manager.pasword);
            
        }else{
            NSLog(@"wrong");
        }
#endif
        
        Book *book = [[Book alloc] init];
        NSLog(@"title = %@, pageNum = %@", book.title, book.pageNum);
        
    }
    return 0;
}
