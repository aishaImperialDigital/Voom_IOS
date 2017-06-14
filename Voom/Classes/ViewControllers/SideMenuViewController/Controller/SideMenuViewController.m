//
//  SideMenuViewController.m
//  Voom
//
//  Created by user on 12/06/17.
//  Copyright © 2017 user. All rights reserved.
//

#import "SideMenuViewController.h"
#import "SideMenuTableViewCell.h"
#import "Constants.h"

@interface SideMenuViewController ()

@end

@implementation SideMenuViewController

-(void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.sideMenuArray = [NSArray arrayWithObjects:@"Vehicle Info",@"Registration",@"Service",@"WoF",@"Mileage",@"Toll Roads",@"Fines",@"Breakdowns",@"Accidents", nil];
   
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
    SideMenuTableViewCell *cell;
    cell =  [self.tableView dequeueReusableCellWithIdentifier:@"SideMenuTableViewCell"];
       if (cell == nil){
        cell = (SideMenuTableViewCell *) [[SideMenuTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"SideMenuTableViewCell"];
    }
    cell.backgroundColor = [UIColor clearColor];
    cell.contentView.backgroundColor = [UIColor clearColor];
    cell.titleLabel.text = [self.sideMenuArray objectAtIndex:indexPath.row];
    cell.textLabel.textColor = kAppBackgroundColor;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 40;
}
@end
