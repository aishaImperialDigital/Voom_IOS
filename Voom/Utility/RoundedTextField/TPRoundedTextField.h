//
//  TPRoundedTextField.h
//  Voom
//
//  Created by user on 13/06/17.
//  Copyright © 2017 user. All rights reserved.
//

#import <UIKit/UIKit.h>


IB_DESIGNABLE
@interface TPRoundedTextField : UITextField

@property (nonatomic) IBInspectable BOOL    topLeft;
@property (nonatomic) IBInspectable BOOL    topRigth;
@property (nonatomic) IBInspectable BOOL    bottomLeft;
@property (nonatomic) IBInspectable BOOL    bottomRigth;
@property (nonatomic) IBInspectable int     cornerRadius;
@property (nonatomic) IBInspectable UIColor *fillColor;

@end
