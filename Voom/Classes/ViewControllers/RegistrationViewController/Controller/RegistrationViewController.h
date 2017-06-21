//
//  RegistrationViewController.h
//  Voom
//
//  Created by user on 13/06/17.
//  Copyright © 2017 user. All rights reserved.
//

#import "VoomParentViewController.h"
#import "TPRoundedTextField.h"

@interface RegistrationViewController : VoomParentViewController{
    
}


@property (weak, nonatomic) IBOutlet TPRoundedTextField *regoNumberTxtField;
@property (weak, nonatomic) IBOutlet TPRoundedTextField *firstNametxtField;
@property (weak, nonatomic) IBOutlet TPRoundedTextField *lastNametxtField;
@property (weak, nonatomic) IBOutlet TPRoundedTextField *driversLicense;
@property (weak, nonatomic) IBOutlet TPRoundedTextField *dateOfBirthtxtField;
@property (weak, nonatomic) IBOutlet TPRoundedTextField *customNametxtField;
@property (weak, nonatomic) IBOutlet TPRoundedTextField *emailAddresstxtField;
@property (weak, nonatomic) IBOutlet TPRoundedTextField *mobileNumbertxtField;

-(IBAction)performRegistration:(id)sender;

@end
