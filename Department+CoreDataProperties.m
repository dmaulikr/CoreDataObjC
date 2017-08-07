//
//  Department+CoreDataProperties.m
//  CoreDataSample
//
//  Created by MukeshLokare on 04/08/17.
//  Copyright © 2017 smart. All rights reserved.
//

#import "Department+CoreDataProperties.h"

@implementation Department (CoreDataProperties)

+ (NSFetchRequest<Department *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Department"];
}

@dynamic departName;
@dynamic deprtId;
@dynamic employees;

@end
