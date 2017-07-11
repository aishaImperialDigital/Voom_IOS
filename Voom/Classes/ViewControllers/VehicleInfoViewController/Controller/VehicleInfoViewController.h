//
//  VehicleInfoViewController.h
//  Voom
//
//  Created by user on 16/06/17.
//  Copyright © 2017 user. All rights reserved.
//

#import "VoomParentViewController.h"

@interface VehicleInfoViewController : VoomParentViewController
{
    NSArray *vehicleDetailArray;
    NSArray *vehicleValueDetailArray;
}
@property(nonatomic,strong) IBOutlet UITableView *tableView;

@end
