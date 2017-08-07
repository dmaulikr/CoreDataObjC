//
//  ViewController.h
//  CoreDataSample
//
//  Created by MukeshLokare on 31/07/17.
//  Copyright © 2017 smart. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@interface ViewController : UIViewController

@property(weak,nonatomic)AppDelegate *appDelegate;
@property (weak, nonatomic) IBOutlet UITextField *txtFieldEmpId;
@property (weak, nonatomic) IBOutlet UITextField *txtFieldEmpName;
@property (weak, nonatomic) IBOutlet UITextField *txtFieldDepartId;
@property (weak, nonatomic) IBOutlet UITextField *txtFieldDepartName;
- (IBAction)actionToSaveEmployeeButton:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *txtFieldEmpIdToDelete;
- (IBAction)deleteEmployee:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *txtFieldToUpdate;
- (IBAction)updateEmployee:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *txtFieldSearch;
- (IBAction)actionForSearchButton:(id)sender;

@end

