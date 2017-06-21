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
#import "MBProgressHUD.h"
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
    [self.headerView.sideMenuButton addTarget:self action:@selector(openLeftMenu:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.headerView];
}

-(void) setupBackAppHeader{
    self.backHeaderView = [[[NSBundle mainBundle] loadNibNamed:@"BackHeaderView" owner:self options:nil] objectAtIndex:0];
    self.backHeaderView.frame = CGRectMake(0, 0, self.backHeaderView.frame.size.width, self.headerView.frame.size.height);
    [self.view addSubview:self.backHeaderView];
}

-(void) openLeftMenu:(id) sender{
     AppDelegate *appDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
     [appDelegate.leftSideMenu showLeftView];
}



-(void) createTabBarController{
    VehicleLibraryViewControlleriPhone *vehicleViewController = [[VehicleLibraryViewControlleriPhone alloc] initWithNibName:@"VehicleLibraryViewControlleriPhone" bundle:nil];
    vehicleViewController.title = @"Vehicles";
    vehicleViewController.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Vehicles" image:[UIImage imageNamed:@"VehicleLibrary-iPhone.png"] tag:0];
    UINavigationController *firstNavController = [[UINavigationController alloc]initWithRootViewController:vehicleViewController];
    
    VehicleCheckViewControlleriPhone *vehicleCheckViewController = [[VehicleCheckViewControlleriPhone alloc] initWithNibName:@"VehicleCheckViewControlleriPhone" bundle:nil];
    vehicleCheckViewController.title = kTitleVehicleCheck;
    vehicleCheckViewController.tabBarItem =  [[UITabBarItem alloc] initWithTitle:kTitleVehicleCheck image:[UIImage imageNamed:@"VehicleCheck-iPhone.png"] tag:1];
    UINavigationController *secondNavController = [[UINavigationController alloc]initWithRootViewController:vehicleCheckViewController];
   
    RemindersViewControlleriPhone *reminderViewController = [[RemindersViewControlleriPhone alloc]initWithNibName:@"RemindersViewControlleriPhone" bundle:nil];
    reminderViewController.title = kTitleReminders;
    reminderViewController.tabBarItem =  [[UITabBarItem alloc] initWithTitle:kTitleReminders image:[UIImage imageNamed:@"Reminder-iPhone"] tag:2];
    UINavigationController *thirdNavController = [[UINavigationController alloc]initWithRootViewController:reminderViewController];
   
    SettingsViewControlleriPhone *forthViewController = [[SettingsViewControlleriPhone alloc]initWithNibName:@"SettingsViewControlleriPhone" bundle:nil];
    forthViewController.title = kTitleSettings;
    forthViewController.tabBarItem = [[UITabBarItem alloc] initWithTitle:kTitleSettings image:[UIImage imageNamed:@"Settings-iPhone"] tag:3];
    UINavigationController *forthNavController = [[UINavigationController alloc]initWithRootViewController:forthViewController];
    
    self.tabBarController = [[UITabBarController alloc] init];
    self.tabBarController.viewControllers = [[NSArray alloc] initWithObjects:firstNavController, secondNavController, thirdNavController, forthNavController, nil];
    [self.tabBarController.tabBar sizeThatFits:CGSizeMake(SCREEN_WIDTH,TAB_BAR_HEIGHT)];
    self.tabBarController.tabBar.shadowImage = [[UIImage alloc] init];  //delete the default tabbar shadow！
    [self.navigationController pushViewController:self.tabBarController animated:YES];
   
    firstNavController.navigationBarHidden = YES;
    secondNavController.navigationBarHidden = YES;
    thirdNavController.navigationBarHidden = YES;
    forthNavController.navigationBarHidden = YES;
}


#pragma mark - AlertView Mthods
- (void)showActivityAlertWithText:(NSString *)text{
    [self hideActivityAlert];
    text = @"Loading";
    self.spinner = nil;
    if (self.spinner == nil) {
        self.spinner = [[MMMaterialDesignSpinner alloc] initWithFrame:CGRectMake(0, 0, 60, 60)];
        self.spinner.center = self.view.center;
        [self.view addSubview:self.spinner];
        [self.spinner startAnimating];
    
    }
}

- (void)setSpinnerPosition:(CGPoint )point{
    self.spinner.center = point;
    
}

- (void)hideActivityAlert{
    if (self.spinner) {
        [self.spinner stopAnimating];
        [self.spinner removeFromSuperview];
        self.spinner = nil;
    }
}

-(void)showHUD:(NSString *)title andTime:(double) time  {
    UIWindow *windows = [[UIApplication sharedApplication] keyWindow];
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:windows animated:YES];
    hud.label.text = title;
    hud.bezelView.backgroundColor = [UIColor blackColor];
    hud.contentColor = [UIColor whiteColor];
    hud.tintColor = [UIColor whiteColor];
    hud.bezelView.alpha = 0.9;
    hud.margin = 16;
    [hud hideAnimated:YES afterDelay:time];
    
}

-(void) addMapView
{
    self.mapView = [[[NSBundle mainBundle] loadNibNamed:@"VoomMapView" owner:self options:nil] objectAtIndex:0];
    self.mapView.frame = CGRectMake(0, 0, self.mapView.frame.size.width, self.mapView.frame.size.height);
    [self.view addSubview:self.mapView];
}

-(void) addDatePickerToTextField:(UITextField *) textField
{
    self.datePicker = [[[NSBundle mainBundle] loadNibNamed:@"VoomDatePickerView" owner:self options:nil] objectAtIndex:0];
    self.datePicker.frame = CGRectMake(0,SCREEN_HEIGHT-self.datePicker.frame.size.height, self.datePicker.frame.size.width, self.datePicker.frame.size.height);
    [self.view addSubview:self.datePicker];
    self.datePicker.hidden = YES;
    self.datePicker.delegate = self;
    self.datePicker.datePicker.timeZone = [NSTimeZone localTimeZone];
    self.datePicker.dateTextfield = textField;
    textField.delegate = self;
 
}



#pragma mark VoomDatePickerViewDelegate
-(void) donePressed
{
    self.datePicker.hidden = YES;
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"dd/MM/YYYY"];
    NSString *dateStri=[formatter stringFromDate:self.datePicker.datePicker.date];
    [self.datePicker.dateTextfield setText:[NSString stringWithFormat:@"%@",dateStri]];
    
}
-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    [self.view endEditing:YES];
    self.datePicker.hidden = NO;
    return NO;  // Hide both keyboard and blinking cursor.
}
@end
