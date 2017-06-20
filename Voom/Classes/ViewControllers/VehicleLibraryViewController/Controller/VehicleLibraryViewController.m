//
//  VehicleLibraryViewController.m
//  Voom
//
//  Created by user on 13/06/17.
//  Copyright © 2017 user. All rights reserved.
//

#import "VehicleLibraryViewController.h"
#import "VehicleLibraryTableViewCell.h"

#define VEHICLE_LIBRARY_TABLE_HEIGHT 60

@interface VehicleLibraryViewController ()

@end

@implementation VehicleLibraryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.headerView.titleLabel.text = kTitleVehicleLibrary;
    self.headerView.addButtonButton.hidden = NO;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 8;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    VehicleLibraryTableViewCell *cell;
    cell =  [self.tableView dequeueReusableCellWithIdentifier:@"VehicleLibraryTableViewCell"];
    if (cell == nil){
        cell = (VehicleLibraryTableViewCell *) [[VehicleLibraryTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"VehicleLibraryTableViewCell"];
    }
    cell.backgroundColor = [UIColor clearColor];
    cell.contentView.backgroundColor = [UIColor clearColor];
    cell.titleLabel.text = @"Jan's Car";
    cell.iconImage.image = [self setVehicleImageForType:(indexPath.row+7)];
    cell.textLabel.textColor = kAppBackgroundColor;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return VEHICLE_LIBRARY_TABLE_HEIGHT;
}

#pragma mark methods
-(UIImage *) setVehicleImageForType:(int) index
{
    UIImage *imageName = [UIImage imageNamed:[NSString stringWithFormat:@"%d.png",index]];
    return imageName;
}
@end
