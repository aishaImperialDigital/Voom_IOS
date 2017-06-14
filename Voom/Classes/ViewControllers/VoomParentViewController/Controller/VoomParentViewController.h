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

@interface VoomParentViewController : UIViewController
{
 
}
@property (nonatomic,strong) HeaderView *headerView;
@property (nonatomic,strong) BackHeaderView *backHeaderView;
@property (nonatomic,strong) UITabBarController *tabBarController;
@property(nonatomic,strong) UIDatePicker *datePicker;

#pragma mark methods

-(void) setupAppHeader;
-(void) setupBackAppHeader;
-(void) createTabBarController;
-(void) showDatePicker;
@end
