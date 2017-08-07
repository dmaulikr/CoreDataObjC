//
//  AppDelegate.h
//  CoreDataSample
//
//  Created by MukeshLokare on 31/07/17.
//  Copyright © 2017 smart. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) NSManagedObjectContext
*managedObjectContext;
@property (strong, nonatomic) NSManagedObjectModel
*managedObjectModel;
@property (strong, nonatomic) NSPersistentStoreCoordinator
*persistentStoreCoordinator;
- (void)saveContext;
-(id) isRecordExistWithEntiryName:(NSString *) entityName withPredicate:(NSPredicate *) predicate;

- (void)deleteAllEntities:(NSString *)nameEntity;

@end

