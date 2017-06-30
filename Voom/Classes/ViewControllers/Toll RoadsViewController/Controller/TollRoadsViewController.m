//
//  TollRoadsViewController.m
//  Voom
//
//  Created by user on 16/06/17.
//  Copyright © 2017 user. All rights reserved.
//

#import "TollRoadsViewController.h"
#import "TollRoadsViewCell.h"
#define TOLLROADS_TABLE_HEIGHT 40
@interface TollRoadsViewController ()

@end

@implementation TollRoadsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.headerView.titleLabel.text = kTitleTollRoads;
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
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TollRoadsViewCell *cell;
    cell =  [self.tableView dequeueReusableCellWithIdentifier:@"TollRoadsViewCell"];
    if (cell == nil){
        cell = (TollRoadsViewCell *) [[TollRoadsViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"TollRoadsViewCell"];
    }
    cell.backgroundColor = [UIColor clearColor];
    cell.contentView.backgroundColor = [UIColor clearColor];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return TOLLROADS_TABLE_HEIGHT;
}

@end
