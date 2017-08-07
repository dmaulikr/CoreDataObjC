//
//  Department+CoreDataProperties.h
//  CoreDataSample
//
//  Created by webwerks on 04/08/17.
//  Copyright © 2017 smart. All rights reserved.
//

#import "Department+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Department (CoreDataProperties)

+ (NSFetchRequest<Department *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *departName;
@property (nonatomic) int32_t deprtId;
@property (nullable, nonatomic, retain) NSSet<Employee *> *employees;

@end

@interface Department (CoreDataGeneratedAccessors)

- (void)addEmployeesObject:(Employee *)value;
- (void)removeEmployeesObject:(Employee *)value;
- (void)addEmployees:(NSSet<Employee *> *)values;
- (void)removeEmployees:(NSSet<Employee *> *)values;

@end

NS_ASSUME_NONNULL_END
