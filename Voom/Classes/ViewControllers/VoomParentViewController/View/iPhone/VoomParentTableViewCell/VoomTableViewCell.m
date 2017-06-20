//
//  VoomTableViewCell.m
//  Voom
//
//  Created by user on 15/06/17.
//  Copyright © 2017 user. All rights reserved.
//

#import "VoomTableViewCell.h"



@implementation VoomTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    // self.titleLabel.textColor = Title_dark_Grey;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

- (IBAction)cellButtonAction:(id)sender{
    if (self.delegate) {
        [self.delegate voomTableViewButtonClicked:sender];
    }
}

-(void)layoutSubviews {
    [super layoutSubviews];
}

@end
