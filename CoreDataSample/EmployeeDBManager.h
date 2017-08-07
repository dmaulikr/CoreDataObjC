//
//  LoginDBManager.h
//  Vanified
//
//  Created by Abrars on 30/03/15.
//  Copyright (c) 2015 Aich Technologies Pvt Ltd. All rights reserved.
//


#import <Foundation/Foundation.h>
#import "AppDelegate.h"
#import "Employee+CoreDataClass.h"

@interface EmployeeDBManager : NSObject{
    AppDelegate *appDelegate;
}

-(void) saveEmpDetails:(NSString *)empId andEmployeeName:(NSString *)empName andDeptId:(NSString *)deptId andDeptName:(NSString *)departName;
-(Employee*)getUserProfileWithUserId:(NSString*)userId;
-(NSMutableArray *)getLoginUserDetailsFromDB;
-(NSMutableArray *)getUsersByDeptId:(NSString *)departID;
- (void)deleteEntitiesWithName:(NSString *)nameEntity;
- (void)deleteUserProfileWithUserID:(NSString *)empId;

-(void) saveEmplyeeDetails:(NSString *)empId andEmployeeName:(NSString *)empName andDeptId:(NSString *)deptId deptName:(NSString *)deptName;


@end
