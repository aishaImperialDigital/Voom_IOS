//
//  HeaderView.m
//  Voom
//
//  Created by user on 12/06/17.
//  Copyright © 2017 user. All rights reserved.
//

#import "HeaderView.h"

@implementation HeaderView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(void) awakeFromNib
{
    [super awakeFromNib];
    self.backgroundColor = kAppBackgroundColor;
    self.titleLabel.textColor = kAppTitleTextColor;
}

@end
