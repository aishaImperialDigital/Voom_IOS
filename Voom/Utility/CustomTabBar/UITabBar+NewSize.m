//
//  UITabBar.m
//  Voom
//
//  Created by user on 13/06/17.
//  Copyright © 2017 user. All rights reserved.
//

#import "UITabBar+NewSize.h"

@implementation UITabBar (NewSize)
- (CGSize)sizeThatFits:(CGSize)size {
    CGSize newSize = CGSizeMake(size.width,TAB_BAR_HEIGHT);
    return newSize;
}
@end
