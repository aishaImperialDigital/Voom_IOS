//
//  SideMenuViewController.m
//  Voom
//
//  Created by user on 12/06/17.
//  Copyright © 2017 user. All rights reserved.
//

#import "SideMenuViewController.h"
#import "SideMenuTableViewCell.h"
#import "Constants.h"
#import "VehicleInfoViewControlleriPhone.h"
#import "VehicleRegistrationInfoViewControlleriPhone.h"
#import "VehicleServicesViewControlleriPhone.h"
#import "WarrantOfFitnessViewControlleriPhone.h"
#import "VehicleMileageViewControlleriPhone.h"
#import "TollRoadsViewControlleriPhone.h"
#import "FinesViewControlleriPhone.h"
#import "BreakdownsViewControlleriPhone.h"
#import "AccidentsViewControlleriPhone.h"

#define SIDE_MENU_CELL_HEIGHT 40

@interface SideMenuViewController ()

@end

@implementation SideMenuViewController

-(void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.sideMenuArray = [NSArray arrayWithObjects:kTitleVehicleLibrary,kTitleVehicleInfo,kTitleRegistration,kTitleServices,kFitnessWarrant,kTitleMileage,kTitleTollRoads,kTitleFines,kTitleBreakDowns,kTitleAccidents, nil];
    appDelegate = (AppDelegate*)[UIApplication sharedApplication].delegate;
   
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

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 8;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SideMenuTableViewCell *cell;
    cell =  [self.tableView dequeueReusableCellWithIdentifier:@"SideMenuTableViewCell"];
       if (cell == nil){
        cell = (SideMenuTableViewCell *) [[SideMenuTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"SideMenuTableViewCell"];
    }
    cell.backgroundColor = [UIColor clearColor];
    cell.contentView.backgroundColor = [UIColor clearColor];
    cell.titleLabel.text = [self.sideMenuArray objectAtIndex:indexPath.row];
    cell.textLabel.textColor = kAppBackgroundColor;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self loadViewControllersForIndex:(int)indexPath.row];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return SIDE_MENU_CELL_HEIGHT;
}

#pragma mark side menu methods

-(void) loadViewControllersForIndex:(int)index{
    [appDelegate.leftSideMenu hideLeftView];
    switch (index) {
        case VehicleLibraryIndex:
             [self goToHome];
            break;
        case VehicleInfoIndex:
             [self goToVehicleInfo];
             break;
        case RegistrationIndex:
             [self goToVehicleRegistration];
             break;
        case ServicesIndex:
             [self goToVehicleServices];
             break;
        case WOFIndex:
             [self goToVehicleWOF];
             break;
        case MileageIndex:
             [self goToMileage];
             break;
        case TollRoadsIndex:
             [self goToTollRoads];
             break;
        case FinesIndex:
             [self goToFines];
             break;
        case BreakdownsIndex:
             [self goToBreakDowns];
             break;
        case AccidentsIndex:
             [self goToAccidents];
            break;
        default:
            break;
    }
}


-(void)goToHome{
    
    [appDelegate.homeNavigationController popToRootViewControllerAnimated:YES];
}

-(void)goToVehicleInfo{
    VehicleInfoViewControlleriPhone *vehicleInfo = [[VehicleInfoViewControlleriPhone alloc] initWithNibName:@"VehicleInfoViewControlleriPhone" bundle:nil];
    [appDelegate.homeNavigationController pushViewController:vehicleInfo animated:YES];
}

-(void)goToVehicleRegistration{
    VehicleRegistrationInfoViewControlleriPhone *vehicleInfo = [[VehicleRegistrationInfoViewControlleriPhone alloc] initWithNibName:@"VehicleRegistrationInfoViewControlleriPhone" bundle:nil];
    [appDelegate.homeNavigationController pushViewController:vehicleInfo animated:YES];
}

-(void)goToVehicleServices{
    VehicleServicesViewControlleriPhone *vehicleInfo = [[VehicleServicesViewControlleriPhone alloc] initWithNibName:@"VehicleServicesViewControlleriPhone" bundle:nil];
    [appDelegate.homeNavigationController pushViewController:vehicleInfo animated:YES];
}

-(void)goToVehicleWOF{
    WarrantOfFitnessViewControlleriPhone *vehicleInfo = [[WarrantOfFitnessViewControlleriPhone alloc] initWithNibName:@"WarrantOfFitnessViewControlleriPhone" bundle:nil];
    [appDelegate.homeNavigationController pushViewController:vehicleInfo animated:YES];
}

-(void)goToMileage{
    VehicleMileageViewControlleriPhone *vehicleInfo = [[VehicleMileageViewControlleriPhone alloc] initWithNibName:@"VehicleMileageViewControlleriPhone" bundle:nil];
    [appDelegate.homeNavigationController pushViewController:vehicleInfo animated:YES];
}

-(void)goToTollRoads{
    TollRoadsViewControlleriPhone *vehicleInfo = [[TollRoadsViewControlleriPhone alloc] initWithNibName:@"TollRoadsViewControlleriPhone" bundle:nil];
    [appDelegate.homeNavigationController pushViewController:vehicleInfo animated:YES];
}

-(void)goToFines{
    FinesViewControlleriPhone *vehicleInfo = [[FinesViewControlleriPhone alloc] initWithNibName:@"FinesViewControlleriPhone" bundle:nil];
    [appDelegate.homeNavigationController pushViewController:vehicleInfo animated:YES];
}

-(void)goToBreakDowns{
    BreakdownsViewControlleriPhone *vehicleInfo = [[BreakdownsViewControlleriPhone alloc] initWithNibName:@"BreakdownsViewControlleriPhone" bundle:nil];
    [appDelegate.homeNavigationController pushViewController:vehicleInfo animated:YES];
}

-(void)goToAccidents{
    AccidentsViewControlleriPhone *vehicleInfo = [[AccidentsViewControlleriPhone alloc] initWithNibName:@"AcidentsViewControlleriPhone" bundle:nil];
    [appDelegate.homeNavigationController pushViewController:vehicleInfo animated:YES];
}

@end
