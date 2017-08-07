//
//  DataTableViewController.h
//  CoreDataSample
//
//  Created by MukeshLokare on 04/08/17.
//  Copyright © 2017 smart. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@interface DataTableViewController : UITableViewController

@property(strong,nonatomic)NSString *deptId;

@property(assign,readwrite)BOOL isFromSerach;;

@property (strong, nonatomic) NSManagedObjectContext
*managedObjectContext;
@property (strong, nonatomic) NSManagedObjectModel
*managedObjectModel;
@property (strong, nonatomic) NSPersistentStoreCoordinator
*persistentStoreCoordinator;

@property(strong,nonatomic) NSArray *employeeArray;

@end
