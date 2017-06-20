//
//  TPRoundedTextField.m
//  Voom
//
//  Created by user on 13/06/17.
//  Copyright © 2017 user. All rights reserved.
//

#import "TPRoundedTextField.h"
#import <QuartzCore/QuartzCore.h>

@interface TPRoundedTextField()
{
    UIRectCorner _corners;
}
@end

@implementation TPRoundedTextField
- (void) awakeFromNib
{
    [super awakeFromNib];
    self.topLeft = YES;
    self.topRigth = YES;
    self.bottomLeft = YES;
    self.bottomRigth = YES;
    self.cornerRadius = 15;
    [self setBorderStyle:UITextBorderStyleRoundedRect];
    [self.layer setMasksToBounds:YES];
    [self.layer setCornerRadius:12.0f];
    [self.layer setBorderColor:[[UIColor whiteColor] CGColor]];
    [self.layer setBorderWidth:1];
    [self setBackgroundColor:[UIColor clearColor]];
    [self setValue:[UIColor whiteColor] forKeyPath:@"_placeholderLabel.textColor"];
   
}

- (void)setTopLeft:(BOOL)topLeft {
    _topLeft = topLeft;
    _corners |= UIRectCornerTopLeft;
}

- (void)setTopRigth:(BOOL)topRigth {
    _topRigth = topRigth;
    _corners |= UIRectCornerTopRight;
}

- (void)setBottomLeft:(BOOL)bottomLeft {
    _bottomLeft = bottomLeft;
    _corners |= UIRectCornerBottomLeft;
}

- (void)setBottomRigth:(BOOL)bottomRigth {
    _bottomRigth = bottomRigth;
    _corners |= UIRectCornerBottomRight;
}

- (void)setFillColor:(UIColor *)fillColor {
    _fillColor = fillColor;
    self.backgroundColor = fillColor;
}

- (void)setCornerRadius:(int)cornerRadius {
    _cornerRadius = cornerRadius;
}

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:rect
                                               byRoundingCorners:UIRectCornerTopLeft |UIRectCornerTopRight
                                                     cornerRadii:CGSizeMake(6.0, 6.0)];
    CAShapeLayer *layers = [CAShapeLayer layer];
    layers.frame = rect;
    layers.path = path.CGPath;
    self.layer.mask = layers;
    
}

@end
