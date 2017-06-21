//
//  VoomDatePickerView.h
//  Voom
//
//  Created by gqgnju on 20/06/17.
//  Copyright © 2017 user. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol VoomDatePickerViewDelegate <NSObject>

-(void) donePressed;

@end

@interface VoomDatePickerView : UIView{
    
}
@property(nonatomic,weak) id <VoomDatePickerViewDelegate> delegate;
@property(nonatomic,strong) IBOutlet UIDatePicker *datePicker;
@property(nonatomic,strong) UITextField *dateTextfield;
-(IBAction)pickerDone:(id)sender;
@end
