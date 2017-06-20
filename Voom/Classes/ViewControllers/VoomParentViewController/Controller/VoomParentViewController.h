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

@interface VoomParentViewController : UIViewController
{
 
}
@property (nonatomic,strong) HeaderView *headerView;
@property (nonatomic,strong) BackHeaderView *backHeaderView;
@property (nonatomic,strong) UITabBarController *tabBarController;
@property(nonatomic,strong) UIDatePicker *datePicker;
@property (nonatomic, strong) MMMaterialDesignSpinner *spinner;
#pragma mark methods

-(void) setupAppHeader;
-(void) setupBackAppHeader;
-(void) createTabBarController;
-(void) showDatePicker;

#pragma mark methods
- (void)showActivityAlertWithText:(NSString *)text;
- (void)setSpinnerPosition:(CGPoint )point;
- (void)hideActivityAlert;
-(void)showHUD:(NSString *)title andTime:(double) time;
@end
