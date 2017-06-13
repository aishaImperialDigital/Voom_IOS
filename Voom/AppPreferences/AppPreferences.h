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
+ (BOOL)isValidEmail:(NSString *)checkString;

@end
