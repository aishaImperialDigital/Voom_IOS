//
//  VehicleServicesViewController.m
//  Voom
//
//  Created by user on 16/06/17.
//  Copyright © 2017 user. All rights reserved.
//

#import "VehicleServicesViewController.h"

@interface VehicleServicesViewController ()

@end

@implementation VehicleServicesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.headerView.titleLabel.text = kTitleServices;
    //serviceDatetxtField
    //nextServiceDueDatetxtField;
    [self addDatePickerToTextField:self.serviceDatetxtField];
    [self addDatePickerToTextField:self.nextServiceDueDatetxtField];
    
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

@end
