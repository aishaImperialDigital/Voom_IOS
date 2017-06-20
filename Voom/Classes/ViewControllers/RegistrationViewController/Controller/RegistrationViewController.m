//
//  RegistrationViewController.m
//  Voom
//
//  Created by user on 13/06/17.
//  Copyright © 2017 user. All rights reserved.
//

#import "RegistrationViewController.h"

@interface RegistrationViewController ()

@end

@implementation RegistrationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.headerView.hidden = YES;
    self.backHeaderView.titleLabel.text = kTitleRegistration;
    [self setupBackAppHeader];
    [self.backHeaderView.backButton addTarget:self action:@selector(goBack:) forControlEvents:UIControlEventTouchUpInside];
    [self.datePicker addTarget:self action:@selector(onDatePickerValueChanged:) forControlEvents:UIControlEventValueChanged];
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

#pragma mark go back method

-(void) goBack:(id) sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void) setAsDateField:(UITextField *) textField
{
    textField.inputView = self.datePicker;
}

- (void)onDatePickerValueChanged:(UIDatePicker *)datePicker
{
    //self.textField.text = [self.dateFormatter stringFromDate:datePicker.date];
}


@end
