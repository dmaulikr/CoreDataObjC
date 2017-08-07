//
//  DataTableViewController.m
//  CoreDataSample
//
//  Created by MukeshLokare on 04/08/17.
//  Copyright © 2017 smart. All rights reserved.
//

#import "DataTableViewController.h"
#import "EmployeeDBManager.h"

@interface DataTableViewController (){
    EmployeeDBManager *empDBManager;

}

@end

@implementation DataTableViewController
@synthesize deptId,isFromSerach;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    _managedObjectContext = [appDelegate managedObjectContext];
    empDBManager = [[EmployeeDBManager alloc]init];
    
    if (!isFromSerach) {
      _employeeArray = [empDBManager getAllEmployeeDetailsFromDB];
    }else{
     _employeeArray = [empDBManager getEmployeeDetailsByDeptId:deptId];
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return _employeeArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  
    static NSString *CellIdentifier = @"DataCell";
    UITableViewCell *cell = nil;//[tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];

    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                       reuseIdentifier:CellIdentifier];
    }


    Employee *employee = [_employeeArray objectAtIndex:indexPath.row];
    
    cell.textLabel.text = [NSString stringWithFormat:@"Emp Id: %d E-Name: %@",employee.empId,employee.empName];
//    cell.detailTextLabel.text = [NSString stringWithFormat:@"ID : %d",employee.ofdepartment.deprtId];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"Dept Id: %d D-Name: %@",employee.departId,employee.ofdepartment.departName];

    
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
