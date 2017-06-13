//
//  LoginViewController.m
//  Voom
//
//  Created by user on 12/06/17.
//  Copyright © 2017 user. All rights reserved.
//

#import "LoginViewController.h"
#import "RegistrationViewControlleriPhone.h"
#import "VehicleLibraryViewControlleriPhone.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.headerView.hidden = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
#pragma mark methods
-(IBAction)gotoLogin:(id)sender;
{
   // [self loadVehicleLibraryViewController];
    [self createTabBarController];
}

-(IBAction)gotoRegisteration:(id)sender;
{
    [self loadRegistrationController];
}


#pragma mark loading Controllers

-(void) loadRegistrationController
{
    RegistrationViewControlleriPhone *registrationViewController = [[RegistrationViewControlleriPhone alloc] initWithNibName:@"RegistrationViewControlleriPhone" bundle:nil];
    [self.navigationController pushViewController:registrationViewController animated:YES];
}

-(void) loadVehicleLibraryViewController
{
    VehicleLibraryViewControlleriPhone *vehicleViewController = [[VehicleLibraryViewControlleriPhone alloc] initWithNibName:@"VehicleLibraryViewControlleriPhone" bundle:nil];
    [self.navigationController pushViewController:vehicleViewController animated:YES];
}

@end
