//
//  LoginDBManager.h
//  Vanified
//
//  Created by MukeshLokare on 04/08/17.
//  Copyright (c) 2015 Aich Technologies Pvt Ltd. All rights reserved.
//


#import <Foundation/Foundation.h>
#import "AppDelegate.h"
#import "Employee+CoreDataClass.h"

@interface EmployeeDBManager : NSObject{
    AppDelegate *appDelegate;
}

-(void) saveEmpDetails:(NSString *)empId andEmployeeName:(NSString *)empName andDeptId:(NSString *)deptId andDeptName:(NSString *)departName;

-(void) saveEmplyeeDetails:(NSString *)empId andEmployeeName:(NSString *)empName andDeptId:(NSString *)deptId deptName:(NSString *)deptName;


-(Employee*)getEmployeeWithEmpId:(NSString*)empId;

-(NSMutableArray *)getAllEmployeeDetailsFromDB;

-(NSMutableArray *)getEmployeeDetailsByDeptId:(NSString *)departID;

- (void)deleteEmployeeWithEmployeeID:(NSString *)empId;

- (void)deleteEntitiesWithName:(NSString *)nameEntity;


@end
