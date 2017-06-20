//
//  SettingsViewController.m
//  Voom
//
//  Created by user on 13/06/17.
//  Copyright © 2017 user. All rights reserved.
//

#import "SettingsViewController.h"
#import "SettingsViewCell.h"

#define SETTINGS_TABLE_HEIGHT 40

@interface SettingsViewController ()

@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
     self.headerView.titleLabel.text = kTitleSettings;
     settingsArray = [[NSArray alloc] initWithObjects:@"Account Setting",@"Notifications",@"Change Password",@"Terms & Conditions",@"Contact Us", nil];
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
    return settingsArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SettingsViewCell *cell;
    cell =  [self.tableView dequeueReusableCellWithIdentifier:@"SettingsViewCell"];
    if (cell == nil){
        cell = (SettingsViewCell *) [[SettingsViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"SettingsViewCell"];
    }
    cell.backgroundColor = [UIColor clearColor];
    cell.contentView.backgroundColor = [UIColor clearColor];
    cell.titleLabel.text = [settingsArray objectAtIndex:indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return SETTINGS_TABLE_HEIGHT;
}



@end
