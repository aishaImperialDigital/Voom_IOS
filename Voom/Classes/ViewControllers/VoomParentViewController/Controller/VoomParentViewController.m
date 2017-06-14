//
//  VoomParentViewController.m
//  Voom
//
//  Created by user on 12/06/17.
//  Copyright © 2017 user. All rights reserved.
//

#import "VoomParentViewController.h"
#import "VehicleLibraryViewControlleriPhone.h"
#import "VehicleCheckViewControlleriPhone.h"
#import "RemindersViewControlleriPhone.h"
#import "SettingsViewControlleriPhone.h"
#import "Constants.h"

@interface VoomParentViewController ()

@end

@implementation VoomParentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = kAppBackgroundColor;
    [self setupAppHeader];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark header View setup

-(void) setupAppHeader
{
    self.headerView = [[[NSBundle mainBundle] loadNibNamed:@"HeaderView" owner:self options:nil] objectAtIndex:0];
    self.headerView.frame = CGRectMake(0, 0, self.headerView.frame.size.width, self.headerView.frame.size.height);
    [self.view addSubview:self.headerView];
}

-(void) setupBackAppHeader{
    self.backHeaderView = [[[NSBundle mainBundle] loadNibNamed:@"BackHeaderView" owner:self options:nil] objectAtIndex:0];
    self.backHeaderView.frame = CGRectMake(0, 0, self.backHeaderView.frame.size.width, self.headerView.frame.size.height);
    [self.view addSubview:self.backHeaderView];
}


-(void) createTabBarController{
    VehicleLibraryViewControlleriPhone *vehicleViewController = [[VehicleLibraryViewControlleriPhone alloc] initWithNibName:@"VehicleLibraryViewControlleriPhone" bundle:nil];
    vehicleViewController.title = @"Vehicles";
    vehicleViewController.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Vehicles" image:[UIImage imageNamed:@"ic_add_task.png"] tag:0];
    UINavigationController *firstNavController = [[UINavigationController alloc]initWithRootViewController:vehicleViewController];
    VehicleCheckViewControlleriPhone *vehicleCheckViewController = [[VehicleCheckViewControlleriPhone alloc]init];
    vehicleCheckViewController.title = kTitleVehicleCheck;
    vehicleCheckViewController.tabBarItem =  [[UITabBarItem alloc] initWithTitle:kTitleVehicleCheck image:[UIImage imageNamed:@"ic_add_task.png"] tag:1];
    UINavigationController *secondNavController = [[UINavigationController alloc]initWithRootViewController:vehicleCheckViewController];
    RemindersViewControlleriPhone *reminderViewController = [[RemindersViewControlleriPhone alloc]init];
    reminderViewController.title = kTitleReminders;
    reminderViewController.tabBarItem =  [[UITabBarItem alloc] initWithTitle:kTitleReminders image:[UIImage imageNamed:@"ic_add_task.png"] tag:2];
    UINavigationController *thirdNavController = [[UINavigationController alloc]initWithRootViewController:reminderViewController];
    SettingsViewControlleriPhone *forthViewController = [[SettingsViewControlleriPhone alloc]initWithNibName:@"SettingsViewControlleriPhone" bundle:nil];
    forthViewController.title = kTitleSettings;
    forthViewController.tabBarItem = [[UITabBarItem alloc] initWithTitle:kTitleSettings image:[UIImage imageNamed:@"ic_add_task.png"] tag:3];
    UINavigationController *forthNavController = [[UINavigationController alloc]initWithRootViewController:forthViewController];
    firstNavController.navigationBarHidden = YES;
    secondNavController.navigationBarHidden = YES;
    thirdNavController.navigationBarHidden = YES;
    forthNavController.navigationBarHidden = YES;
    self.tabBarController = [[UITabBarController alloc] initWithNibName:nil bundle:nil];
    self.tabBarController.viewControllers = [[NSArray alloc] initWithObjects:firstNavController, secondNavController, thirdNavController, forthNavController, nil];
    [self.tabBarController.tabBar sizeThatFits:CGSizeMake(320, 60)];
    self.tabBarController.tabBar.shadowImage = [[UIImage alloc] init];  //delete the default tabbar shadow！
    [self.navigationController pushViewController:self.tabBarController animated:YES];
}

-(void) showDatePicker
{
    self.datePicker = [[UIDatePicker alloc] initWithFrame:CGRectZero];
    [self.datePicker setDatePickerMode:UIDatePickerModeDate];
}


@end
