//
//  AppDelegate.h
//  CoreDataSample
//
//  Created by webwerks on 31/07/17.
//  Copyright © 2017 smart. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

