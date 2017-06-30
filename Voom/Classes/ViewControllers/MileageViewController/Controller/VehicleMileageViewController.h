//
//  VehicleMileageViewController.h
//  Voom
//
//  Created by user on 16/06/17.
//  Copyright © 2017 user. All rights reserved.
//

#import "VoomParentViewController.h"
#import "TPRoundedTextField.h"

@interface VehicleMileageViewController : VoomParentViewController{
    
}
@property (weak, nonatomic) IBOutlet TPRoundedTextField *odometerTxtField;
@property (weak, nonatomic) IBOutlet TPRoundedTextField *purchaseDateTxtField;
@property (weak, nonatomic) IBOutlet TPRoundedTextField *kilometerBoughtTxtField;


@end
