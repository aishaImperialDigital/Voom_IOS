//
//  AppPreferences.m
//  Voom
//
//  Created by user on 13/06/17.
//  Copyright © 2017 user. All rights reserved.
//

#import "AppPreferences.h"
#import <UIKit/UIKit.h>

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


+(void) changeApplicationTabBarAppearance{
    [UITabBar.appearance setBarTintColor:kAppBackgroundColor];
    [UITabBar.appearance setTintColor: kAppSecondaryColor];
    [UITabBarItem.appearance setTitleTextAttributes:@{NSForegroundColorAttributeName :kAppSecondaryColor}
                                           forState:UIControlStateSelected];
}

#pragma mark - Phone Number
+(BOOL) isValidPhone:(NSString *)checkString
{
    NSString *str = checkString; // some string to check for at least one digit and a length of at least 7
    if (str.length >= 7 && [str rangeOfCharacterFromSet:[NSCharacterSet decimalDigitCharacterSet]].location != NSNotFound) {
        // this matches the criteria
        return YES;
    }
    else
    {
        return NO;
    }
}

#pragma mark - Email validation
+ (BOOL)isValidMB:(NSString *)checkString{
    BOOL stricterFilter = YES; // Discussion http://blog.logichigh.com/2010/09/02/validating-an-e-mail-address/
    NSString *stricterFilterString = @"[A-Za-z]";
    NSString *laxString = @"^([0-9٠-٩]*)(\\.([0-9٠-٩]+)?)?$";
    NSString *emailRegex = stricterFilter ? stricterFilterString : laxString;
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:checkString];
}


#pragma mark - If string is a positive decimal number
+ (BOOL)isDecimalPositiveNumberString:(NSString*)inputString :(NSRange)range {
    NSString *newStr = [inputString stringByReplacingCharactersInRange:range withString:inputString];
    NSString *expression = @"^([0-9٠-٩]*)(\\.([0-9٠-٩]+)?)?$";
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:expression
                                                                           options:NSRegularExpressionCaseInsensitive
                                                                             error:nil];
    NSUInteger noOfMatches = [regex numberOfMatchesInString:newStr
                                                    options:0
                                                      range:NSMakeRange(0, [newStr length])];
    if (noOfMatches==0){
        return NO;
    }else{
        
        return YES;
    }
    
}
+ (BOOL)isDecimalPositiveNumberCharacterString:(NSString*)inputString{
    NSString *regularExForAlphabets = @"\\.|\\d";
    NSPredicate *expressionCheckPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regularExForAlphabets];
    return [expressionCheckPredicate evaluateWithObject:inputString];
}

+ (BOOL) isAlpha:(NSString *)inputString
{
    NSCharacterSet *s = [NSCharacterSet characterSetWithCharactersInString:@"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"];
    s = [s invertedSet];
    NSString *str1 = inputString;
    NSRange r = [str1 rangeOfCharacterFromSet:s];
    if (r.location != NSNotFound) {
        return YES;
    }
    return NO;
}


+(BOOL) isAlphaNum:(NSString *)characters
{
    NSCharacterSet *blockedCharacters = [[NSCharacterSet alphanumericCharacterSet] invertedSet];
    return ([characters rangeOfCharacterFromSet:blockedCharacters].location == NSNotFound);
}


@end
