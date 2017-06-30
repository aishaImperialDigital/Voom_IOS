//
//  VehicleServicesViewController.h
//  Voom
//
//  Created by user on 16/06/17.
//  Copyright © 2017 user. All rights reserved.
//

#import "VoomParentViewController.h"
#import "TPRoundedTextField.h"

@interface VehicleServicesViewController : VoomParentViewController
{
    
}
@property (weak, nonatomic) IBOutlet TPRoundedTextField *odometertxtField;
@property (weak, nonatomic) IBOutlet TPRoundedTextField *serviceDatetxtField;
@property (weak, nonatomic) IBOutlet TPRoundedTextField *nextServiceOdometertxtField;
@property (weak, nonatomic) IBOutlet TPRoundedTextField *nextServiceDueDatetxtField;
@end
