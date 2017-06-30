//
//  TollRoadsViewCell.m
//  Voom
//
//  Created by gqgnju on 30/06/17.
//  Copyright © 2017 user. All rights reserved.
//

#import "TollRoadsViewCell.h"

@implementation TollRoadsViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        [[NSBundle mainBundle] loadNibNamed:@"TollRoadsViewCell" owner:self options:nil];
        self.holderView.backgroundColor = [UIColor clearColor];
        self.contentView.backgroundColor  = [UIColor clearColor];
        [self.contentView addSubview:self.holderView];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}


@end
