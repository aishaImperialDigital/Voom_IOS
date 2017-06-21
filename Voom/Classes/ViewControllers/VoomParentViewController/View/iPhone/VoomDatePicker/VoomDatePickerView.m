//
//  VoomDatePickerView.m
//  Voom
//
//  Created by gqgnju on 20/06/17.
//  Copyright © 2017 user. All rights reserved.
//

#import "VoomDatePickerView.h"

@implementation VoomDatePickerView

-(void) awakeFromNib
{
    [super awakeFromNib];
    //self.backgroundColor = kAppBackgroundColor;
}

-(IBAction)pickerDone:(id)sender
{
    if([self.delegate respondsToSelector:@selector(donePressed)])
    {
        [self.delegate performSelector:@selector(donePressed)];
    }
}



@end
