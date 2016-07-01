//
//  Student_table+CoreDataProperties.h
//  CoreDataDemo
//
//  Created by Terence on 16/6/30.
//  Copyright © 2016年 Terence. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Student_table.h"

NS_ASSUME_NONNULL_BEGIN

@interface Student_table (CoreDataProperties)

@property (nullable, nonatomic, retain) NSNumber *num_id;
@property (nullable, nonatomic, retain) NSString *name;
@property (nullable, nonatomic, retain) NSString *address;
@property (nullable, nonatomic, retain) NSNumber *age;
@property (nullable, nonatomic, retain) NSString *sex;

@end

NS_ASSUME_NONNULL_END
