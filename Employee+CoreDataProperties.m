//
//  Employee+CoreDataProperties.m
//  CoreDataSample
//
//  Created by MukeshLokare on 04/08/17.
//  Copyright © 2017 smart. All rights reserved.
//

#import "Employee+CoreDataProperties.h"

@implementation Employee (CoreDataProperties)

+ (NSFetchRequest<Employee *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Employee"];
}

@dynamic departId;
@dynamic empId;
@dynamic empName;
@dynamic ofdepartment;

@end
