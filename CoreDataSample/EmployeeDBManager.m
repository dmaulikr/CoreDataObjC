//
//  LoginDBManager.m
//  Vanified
//
//  Created by Abrars on 30/03/15.
//  Copyright (c) 2015 Aich Technologies Pvt Ltd. All rights reserved.
//

#import "EmployeeDBManager.h"
#import "Department+CoreDataClass.h"

@implementation EmployeeDBManager



-(void) saveEmplyeeDetails:(NSString *)empId andEmployeeName:(NSString *)empName andDeptId:(NSString *)deptId deptName:(NSString *)deptName{
    
    appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    NSManagedObjectContext *context = [appDelegate managedObjectContext];

    NSNumber *userid = [NSNumber numberWithInt:[empId intValue]];
    NSNumber *departId = [NSNumber numberWithInt:[deptId intValue]];
    
    
    Employee *empRecord = [NSEntityDescription insertNewObjectForEntityForName:@"Employee" inManagedObjectContext:context];
    [empRecord setEmpName:empName];
    [empRecord setEmpId:[userid intValue]];
    [empRecord setDepartId:[departId intValue]];
    
    Department *departmentRecord = [NSEntityDescription insertNewObjectForEntityForName:@"Department" inManagedObjectContext:context];
    [departmentRecord setDepartName:deptName];
    [departmentRecord setDeprtId:[departId intValue]];
    
    [departmentRecord addEmployeesObject:empRecord];
    
    [appDelegate saveContext];


}

-(void) saveEmpDetails:(NSString *)empId andEmployeeName:(NSString *)empName andDeptId:(NSString *)deptId andDeptName:(NSString *)departName {
    
    appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    NSNumber *userid = [NSNumber numberWithInt:[empId intValue]];
    NSNumber *departId = [NSNumber numberWithInt:[deptId intValue]];

    int useridValue = [userid intValue];
    NSNumber *user_ID = [NSNumber numberWithInt:useridValue];
    
    NSPredicate *_predicate = [NSPredicate predicateWithFormat:@"empId=%@",user_ID];
    Employee *_fetchRecord = [appDelegate isRecordExistWithEntiryName:@"Employee" withPredicate:_predicate];
    
    if(_fetchRecord != nil){
        
        [_fetchRecord setEmpName:empName];
        [_fetchRecord setEmpId:[userid intValue]];
        [_fetchRecord setDepartId:[departId intValue]];
//        [_fetchRecord setDepartName:departName];
        
        [appDelegate saveContext];
        
    }else{
        Employee *_user_Information = [NSEntityDescription
                                            insertNewObjectForEntityForName:@"Employee"
                                            inManagedObjectContext:[appDelegate managedObjectContext]];
            [_user_Information setEmpName:empName];
            [_user_Information setEmpId:[userid intValue]];
            [_user_Information setDepartId:[departId intValue]];
//            [_user_Information setDepartName:departName];

            [appDelegate saveContext];
    }
    
}

-(Employee *)getUserProfileWithUserId:(NSString *)empId {
 
    appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    NSPredicate *_predicate = [NSPredicate predicateWithFormat:@"empId=%@",empId];
    Employee *_fetchRecord = [appDelegate isRecordExistWithEntiryName:@"Employee" withPredicate:_predicate];
    return _fetchRecord;
    
}



-(NSMutableArray *)getLoginUserDetailsFromDB{
    
    appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];

    NSMutableArray *_record = [[NSMutableArray alloc] initWithCapacity:0];
    NSManagedObjectContext *_context =[appDelegate managedObjectContext];
    NSFetchRequest *_fetchRequest = [[NSFetchRequest alloc]init];
    [_fetchRequest setReturnsObjectsAsFaults:NO];
    
    NSEntityDescription *_entityDesc =[NSEntityDescription entityForName:@"Employee" inManagedObjectContext:_context];
    [_fetchRequest setEntity:_entityDesc];
    
    NSError *_error;
    NSArray *_fetchedOjects = [_context executeFetchRequest:_fetchRequest error:&_error];
    
    for(int i=0;i<[_fetchedOjects count];i++) {
        Employee *_userDetailscat = [_fetchedOjects objectAtIndex:i];
        [_record addObject:_userDetailscat];
    }
    return _record;
    
    
}

-(NSMutableArray *)getUsersByDeptId:(NSString *)departID{
    
    appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    NSMutableArray *_record = [[NSMutableArray alloc] initWithCapacity:0];
    NSManagedObjectContext *_context =[appDelegate managedObjectContext];
    NSFetchRequest *_fetchRequest = [[NSFetchRequest alloc]init];
    [_fetchRequest setReturnsObjectsAsFaults:NO];
    NSPredicate *_predicate = [NSPredicate predicateWithFormat:@"departId=%@",departID];
    
    NSEntityDescription *_entityDesc =[NSEntityDescription entityForName:@"Employee" inManagedObjectContext:_context];
    [_fetchRequest setEntity:_entityDesc];
    [_fetchRequest setPredicate:_predicate];
    [_fetchRequest setFetchLimit:10];
    
    NSError *_error;
    NSArray *_fetchedOjects = [_context executeFetchRequest:_fetchRequest error:&_error];
    
    for(int i=0;i<[_fetchedOjects count];i++) {
        Employee *_userDetailscat = [_fetchedOjects objectAtIndex:i];
        [_record addObject:_userDetailscat];
    }
    return _record;
    
    
}


-(void)deleteUserProfileWithUserID:(NSString * )empId {
    appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];

    NSPredicate *_predicate = [NSPredicate predicateWithFormat:@"empId=%@",empId];
    Employee *_fetchRecord = [appDelegate isRecordExistWithEntiryName:@"Employee" withPredicate:_predicate];
    if(_fetchRecord != nil){
        [[appDelegate managedObjectContext] deleteObject:_fetchRecord];
        [appDelegate saveContext];
    }
}

-(void)deleteExistingUser{
    
    
}

- (void)deleteEntitiesWithName:(NSString *)nameEntity {
    [appDelegate deleteAllEntities:nameEntity];
}
@end
