//
//  AppPreferences.h
//  Voom
//
//  Created by user on 13/06/17.
//  Copyright © 2017 user. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AppPreferences : NSObject{
    
}
/**
 *  Validate the given string for the email verfication.
 *	@param	checkString	the input string or character
 */
+ (BOOL) isValidEmail:(NSString *)checkString;

+ (void) changeApplicationTabBarAppearance;

+ (BOOL) isValidPhone:(NSString *)checkString;

+ (BOOL) isValidMB:(NSString *)checkString;

+ (BOOL) isDecimalPositiveNumberString:(NSString*)inputString :(NSRange)range;

+ (BOOL) isDecimalPositiveNumberCharacterString:(NSString*)inputString;

+ (BOOL) isAlpha:(NSString *)inputString;

+ (BOOL) isAlphaNum:(NSString *)characters;

@end
