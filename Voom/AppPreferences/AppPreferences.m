//
//  AppPreferences.m
//  Voom
//
//  Created by user on 13/06/17.
//  Copyright © 2017 user. All rights reserved.
//

#import "AppPreferences.h"

@implementation AppPreferences{
    
}

#pragma mark - Email validation
+ (BOOL)isValidEmail:(NSString *)checkString{
    BOOL stricterFilter = YES; // Discussion http://blog.logichigh.com/2010/09/02/validating-an-e-mail-address/
    NSString *stricterFilterString = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,10}";
    NSString *laxString = @".+@.+\\.[A-Za-z]{2}[A-Za-z]*";
    NSString *emailRegex = stricterFilter ? stricterFilterString : laxString;
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:checkString];
}

@end
