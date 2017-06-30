//
//  VoomParentViewController.m
//  Voom
//
//  Created by user on 12/06/17.
//  Copyright © 2017 user. All rights reserved.
//

#import "VoomParentViewController.h"
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
    self.datePicker.datePicker.timeZone = [NSTimeZone localTimeZone];
    [self.datePicker setDateTextfield:textField];
    self.datePicker.dateTextfield = textField;
    self.datePicker.dateTextfield.delegate = self.datePicker;

}


@end
