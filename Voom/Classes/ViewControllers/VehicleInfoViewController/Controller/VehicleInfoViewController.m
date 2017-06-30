//
//  VehicleInfoViewController.m
//  Voom
//
//  Created by user on 16/06/17.
//  Copyright © 2017 user. All rights reserved.
//

#import "VehicleInfoViewController.h"
#import "VehicleInfoViewCell.h"
#define INFO_CELL_HEIGHT 40
@interface VehicleInfoViewController ()

@end

@implementation VehicleInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.headerView.titleLabel.text = kTitleVehicleInfo;
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
    VehicleInfoViewCell *cell;
    cell =  [self.tableView dequeueReusableCellWithIdentifier:@"VehicleInfoViewCell"];
    if (cell == nil){
        cell = (VehicleInfoViewCell *) [[VehicleInfoViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"VehicleInfoViewCell"];
    }
    cell.backgroundColor = [UIColor clearColor];
    cell.contentView.backgroundColor = [UIColor clearColor];
    cell.titleLabel.text = @"field";
    cell.valueLabel.text = @"value";
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return INFO_CELL_HEIGHT;
}

@end
