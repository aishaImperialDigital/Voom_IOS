//
//  Constants.h
//  Voom
//
//  Created by user on 12/06/17.
//  Copyright © 2017 user. All rights reserved.
//

#define OS_Version [UIDevice currentDevice].systemVersion

#define nslog(formatString, ...) NSLog((@"" formatString), ##__VA_ARGS__)

#define colorRGB(r,g,b,a) [UIColor colorWithRed:(r/255.0) green:(g/255.0) blue:(b/255.0) alpha:a]

#define kAppBackgroundColor colorRGB(61,61,61,1)

#define kAppSecondaryColor colorRGB(229,118,21,1)

#define kAppTitleTextColor colorRGB(229,118,21,1)
