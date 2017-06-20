//
//  SideMenuViewController.h
//  Voom
//
//  Created by user on 12/06/17.
//  Copyright © 2017 user. All rights reserved.
//

#import "VoomParentViewController.h"
#import "AppDelegate.h"

@interface SideMenuViewController : UIViewController{
    AppDelegate *appDelegate;
}
@property (nonatomic,strong) IBOutlet UITableView *tableView;
@property (nonatomic,strong) NSArray *sideMenuArray;

@end
