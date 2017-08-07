//
//  ViewController.m
//  CoreDataSample
//
//  Created by MukeshLokare on 31/07/17.
//  Copyright © 2017 smart. All rights reserved.
//

#import "ViewController.h"
#import "Employee+CoreDataClass.h"
#import "EmployeeDBManager.h"

#import "DataTableViewController.h"

@interface ViewController ()
{
    EmployeeDBManager *empDBManager;
}

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    empDBManager = [[EmployeeDBManager alloc]init];
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)actionToSaveEmployeeButton:(id)sender {
    
    if (![_txtFieldEmpId.text isEqualToString:@""] && ![_txtFieldEmpName.text isEqualToString:@""] && ![_txtFieldDepartId.text isEqualToString:@""] && ! [_txtFieldDepartName.text isEqualToString:@""]) {
        
        //        NSDictionary *dict = @{@"id":@"12",@"username":@"mukesh"};
//        [empDBManager saveLoginDetails:_txtFieldEmpId.text andEmployeeName:_txtFieldEmpName.text  andDeptId:_txtFieldDepartId.text andDeptName:_txtFieldDepartName.text];

        [empDBManager saveEmplyeeDetails:_txtFieldEmpId.text andEmployeeName:_txtFieldEmpName.text  andDeptId:_txtFieldDepartId.text deptName:_txtFieldDepartName.text];

        
        _txtFieldEmpId.text =@"";
        _txtFieldEmpName.text =@"";
        _txtFieldDepartId.text =@"";
        _txtFieldDepartName.text =@"";
        
        DataTableViewController * lvc = (DataTableViewController *)[self.storyboard instantiateViewControllerWithIdentifier:@"DataTableViewController"];
        lvc.isFromSerach = NO;
        [self.navigationController pushViewController:lvc animated:YES];
        
        
    }else{
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Core Data!" message:@"All field must contain text" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"oK" style:UIAlertActionStyleCancel handler:nil];
        [alert addAction:cancel];
        [self presentViewController:alert animated:YES completion:nil];
        
    }

}
- (IBAction)deleteEmployee:(id)sender {
    
    if (![_txtFieldEmpIdToDelete.text isEqualToString:@""]) {
        [empDBManager deleteUserProfileWithUserID:_txtFieldEmpIdToDelete.text];
    }else{
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Core Data!" message:@"Please enter empid to delete" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"oK" style:UIAlertActionStyleCancel handler:nil];
        [alert addAction:cancel];
        [self presentViewController:alert animated:YES completion:nil];
        
    }
}
- (IBAction)updateEmployee:(id)sender {
    
    if (![_txtFieldToUpdate.text isEqualToString:@""]) {
        Employee * employee = [empDBManager getEmployeeWithEmpId:_txtFieldToUpdate.text];
        
        NSLog(@"Present Employee :%@",employee);

        _txtFieldEmpId.text = [NSString stringWithFormat:@"%d",employee.empId];
        _txtFieldEmpName.text = [NSString stringWithFormat:@"%@",employee.empName];
        _txtFieldDepartId.text = [NSString stringWithFormat:@"%d",employee.departId];
    }
    
}
- (IBAction)actionForSearchButton:(id)sender {
    
    if (![_txtFieldSearch.text isEqualToString:@""]) {

        DataTableViewController * lvc = (DataTableViewController *)[self.storyboard instantiateViewControllerWithIdentifier:@"DataTableViewController"];
        lvc.isFromSerach = YES;
        lvc.deptId = _txtFieldSearch.text;
        [self.navigationController pushViewController:lvc animated:YES];
        
    }else{
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Core Data!" message:@"Please enter empid to delete" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"oK" style:UIAlertActionStyleCancel handler:nil];
        [alert addAction:cancel];
        [self presentViewController:alert animated:YES completion:nil];
        
    }
    

    
}
@end
