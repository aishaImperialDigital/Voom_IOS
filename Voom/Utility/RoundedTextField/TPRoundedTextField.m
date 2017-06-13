//
//  TPRoundedTextField.m
//  Voom
//
//  Created by user on 13/06/17.
//  Copyright © 2017 user. All rights reserved.
//

#import "TPRoundedTextField.h"


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
    
    UIBezierPath *maskPath =
    [UIBezierPath bezierPathWithRoundedRect:self.bounds
                          byRoundingCorners:_corners
                                cornerRadii:CGSizeMake(_cornerRadius, _cornerRadius+10)];
    
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.frame         = self.bounds;
    maskLayer.path          = maskPath.CGPath;
    self.layer.mask         = maskLayer;
    
}

@end
