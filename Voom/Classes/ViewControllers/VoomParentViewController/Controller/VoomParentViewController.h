//
//  VoomParentViewController.h
//  Voom
//
//  Created by user on 12/06/17.
//  Copyright © 2017 user. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HeaderView.h"
#import "BackHeaderView.h"
#import "MMMaterialDesignSpinner.h"
#import "VoomMapView.h"
#import "VoomDatePickerView.h"

@interface VoomParentViewController : UIViewController <UITextFieldDelegate>
{
 
}
@property (nonatomic,strong) HeaderView *headerView;
@property (nonatomic,strong) BackHeaderView *backHeaderView;
@property(nonatomic,strong) VoomDatePickerView *datePicker;
@property(nonatomic,strong) UITextField *dateTextfield;
@property (nonatomic, strong) MMMaterialDesignSpinner *spinner;
@property (nonatomic,strong) VoomMapView *mapView;
#pragma mark methods

-(void) setupAppHeader;
-(void) setupBackAppHeader;
-(void) addMapView;

#pragma mark methods
-(void) showActivityAlertWithText:(NSString *)text;
-(void) setSpinnerPosition:(CGPoint )point;
-(void) hideActivityAlert;
-(void) showHUD:(NSString *)title andTime:(double) time;
-(void) addDatePickerToTextField:(UITextField *) textField;
@end
