//
//  LoginViewController.h
//  Voom
//
//  Created by user on 12/06/17.
//  Copyright © 2017 user. All rights reserved.
//

#import "VoomParentViewController.h"

@interface LoginViewController : VoomParentViewController
{
   
}
@property (nonatomic,strong) IBOutlet UITextField *usernameTextField;
@property (nonatomic,strong) IBOutlet UITextField *passwordTextField;
@property (nonatomic,strong) IBOutlet UIButton *loginButton;
@property (nonatomic,strong) IBOutlet UILabel *detailLabel;

#pragma mark IBAction methods
-(IBAction)gotoLogin:(id)sender;
-(IBAction)gotoRegisteration:(id)sender;

@end
