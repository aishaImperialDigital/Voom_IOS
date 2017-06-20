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
#import "LoginManager.h"


@interface LoginViewController ()
{
    LoginManager *dataManager;
}
@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.headerView.hidden = YES;
    [self.usernameTextField setValue:[UIColor whiteColor] forKeyPath:@"_placeholderLabel.textColor"];
    [self.passwordTextField setValue:[UIColor whiteColor] forKeyPath:@"_placeholderLabel.textColor"];
    
    
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
    [self getLogin];
  //  [self createTabBarController];
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

#pragma mark - DataManager Delegate

- (void)didGetEntity:(id)entity{
    self.view.userInteractionEnabled = YES;
    [self hideActivityAlert];
    VoomParentBO *parentBo = (VoomParentBO *) entity;
    if(parentBo.errorcode == 0)
    {
        //check data
    }
    else
    {
        //[self showActivityAlertWithText:parentBo.errormsg];
        [self showHUD:parentBo.errormsg andTime:1.0];
    }
}

- (BOOL)didGetError:(id)error{
   self.view.userInteractionEnabled = YES;
   [self hideActivityAlert];
   return NO;
}


-(void) getLogin
{
    dataManager = nil;
    dataManager = [[LoginManager alloc] init];
    dataManager.dataManagerDelegate = self;
   // dataManager.webServiceType = question;
    dataManager.username = self.usernameTextField.text;
    dataManager.password = self.passwordTextField.text;
    self.view.userInteractionEnabled = NO;
    [self showActivityAlertWithText:@""];
    [dataManager getEntity:nil];
}


@end
