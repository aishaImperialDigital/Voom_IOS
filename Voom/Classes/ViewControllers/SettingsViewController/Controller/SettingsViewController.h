//
//  SettingsViewController.h
//  Voom
//
//  Created by user on 13/06/17.
//  Copyright © 2017 user. All rights reserved.
//

#import "VoomParentViewController.h"

@interface SettingsViewController : VoomParentViewController{
    
}
@property(nonatomic,strong) IBOutlet UIButton *logoutButton;
-(IBAction)logoutUser:(id)sender;

@end
