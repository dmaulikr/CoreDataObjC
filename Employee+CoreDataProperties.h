//
//  Employee+CoreDataProperties.h
//  CoreDataSample
//
//  Created by MukeshLokare on 04/08/17.
//  Copyright © 2017 smart. All rights reserved.
//

#import "Employee+CoreDataClass.h"
#import "Department+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Employee (CoreDataProperties)

+ (NSFetchRequest<Employee *> *)fetchRequest;

@property (nonatomic) int32_t departId;
@property (nonatomic) int32_t empId;
@property (nullable, nonatomic, copy) NSString *empName;
@property (nullable, nonatomic, retain) Department *ofdepartment;

@end

NS_ASSUME_NONNULL_END
