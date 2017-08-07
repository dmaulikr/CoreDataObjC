//
//  LoginDBManager.m
//  Vanified
//
//  Created by MukeshLokare on 04/08/17.
//  Copyright © 2017 smart. All rights reserved.
//

#import "EmployeeDBManager.h"
#import "Department+CoreDataClass.h"

@implementation EmployeeDBManager



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
        
        [appDelegate saveContext];
        
    }else{
        Employee *_emp_Information = [NSEntityDescription
                                            insertNewObjectForEntityForName:@"Employee"
                                            inManagedObjectContext:[appDelegate managedObjectContext]];
            [_emp_Information setEmpName:empName];
            [_emp_Information setEmpId:[userid intValue]];
            [_emp_Information setDepartId:[departId intValue]];

            [appDelegate saveContext];
    }
    
}

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

-(Employee *)getEmployeeWithEmpId:(NSString *)empId {
 
    appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    NSPredicate *_predicate = [NSPredicate predicateWithFormat:@"empId=%@",empId];
    Employee *_fetchRecord = [appDelegate isRecordExistWithEntiryName:@"Employee" withPredicate:_predicate];
    return _fetchRecord;
    
}



-(NSMutableArray *)getAllEmployeeDetailsFromDB{
    
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

-(NSMutableArray *)getEmployeeDetailsByDeptId:(NSString *)departID{
    
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


-(void)deleteEmployeeWithEmployeeID:(NSString * )empId {
    appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];

    NSPredicate *_predicate = [NSPredicate predicateWithFormat:@"empId=%@",empId];
    Employee *_fetchRecord = [appDelegate isRecordExistWithEntiryName:@"Employee" withPredicate:_predicate];
    if(_fetchRecord != nil){
        [[appDelegate managedObjectContext] deleteObject:_fetchRecord];
        [appDelegate saveContext];
    }
}

- (void)deleteEntitiesWithName:(NSString *)nameEntity {
    [appDelegate deleteAllEntities:nameEntity];
}
@end
