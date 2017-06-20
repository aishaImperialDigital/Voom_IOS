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

#define nsLog(formatString, ...) NSLog((@"" formatString), ##__VA_ARGS__)

#define kTitleRegistration @"Registeration"
#define kTitleVehicleLibrary @"Vehicle Library"
#define kTitleVehicleInfo @"Vehicle Info"
#define kVehicleRegistration @"Vehicle Registration"
#define kTitleServices @"Services"
#define kFitnessWarrant @"Warrant of Fitness"
#define kTitleMileage @"Mileage"
#define kTitleTollRoads @"Toll Roads"
#define kTitleFines @"Fines"
#define kTitleBreakDowns @"Breakdowns Roads"
#define kTitleVehicleCheck @"Vehicle Check"
#define kTitleReminders @"Reminders"
#define kTitleSettings @"Settings"
#define kTitleChangePassword @"Change Password"
#define kTitleAccountSetting @"Acount Settings"
#define kTitleAccidents @"Accidents"

/*
 General
 */

#define kiPadArabicImageSuffix @"-iPad-ar.png"
#define kiPadEnglishImageSuffix @"-iPad-en.png"
#define kiPhoneArabicImageSuffix @"-iPhone-ar.png"
#define kiPhoneEnglishImageSuffix @"-iPhone-en.png"
#define kiPad @"iPad"
#define kiPhone @"iPhone"


/*
 OS Versions
 */
#define OS_Version [UIDevice currentDevice].systemVersion
#define PlatForm   [[UIDevice currentDevice] systemName]
#define IOS @"iOS"
#define Device_Model [[UIDevice currentDevice] model]
#define IS_IOS7() ([[[[UIDevice currentDevice].systemVersion componentsSeparatedByString:@"."]objectAtIndex:0] intValue]>=7)
#define IS_IOS8() ([[[[UIDevice currentDevice].systemVersion componentsSeparatedByString:@"."]objectAtIndex:0] intValue]>=8 )

#define IS_IOS9() ([[[[UIDevice currentDevice].systemVersion componentsSeparatedByString:@"."]objectAtIndex:0] intValue]>=9)
#define IS_IOS10() ([[[[UIDevice currentDevice].systemVersion componentsSeparatedByString:@"."]objectAtIndex:0] intValue]>=10)
#define kManufacturer @"Apple"
#define kAppID  @"4"
/*
 Devices by Screen
 */
#define IS_IPAD() (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define IS_IPHONE_5 ( fabs( ( double )[ [ UIScreen mainScreen ] bounds ].size.height - ( double )568 ) < DBL_EPSILON )
#define IS_IPHONE_6      (fabs((double)[[UIScreen mainScreen]bounds].size.height - (double)667) < DBL_EPSILON)
#define IS_IPHONE_6_PLUS (fabs((double)[[UIScreen mainScreen]bounds].size.height - (double)736) < DBL_EPSILON)
#define IS_IPHONE_4_OR_LESS (IS_IPHONE && SCREEN_MAX_LENGTH < 568.0)

/*
 Devices Screen Resolutions
 */
#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)
#define SCREEN_MAX_LENGTH (MAX(SCREEN_WIDTH, SCREEN_HEIGHT))
#define SCREEN_MIN_LENGTH (MIN(SCREEN_WIDTH, SCREEN_HEIGHT))
#define IS_RETINA ([[UIScreen mainScreen] scale] >= 2.0)

/*
 Localizations
 */
#define userDefaulMacro [nsUserDefaults  valueForKey:kCurrentLanguages]

#define currentLanguageBundle [NSBundle bundleWithPath:[[NSBundle mainBundle] pathForResource:[userDefaulMacro objectAtIndex:0] ofType:@"lproj"]]
#define ELocalizedStringFromTable(key,stringTable)\
NSLocalizedStringFromTableInBundle(key, stringTable, currentLanguageBundle, @"")

/*
 Appfonts
 */
#define ENGLISH_HEADING_FONT_BOLD(fontSize)   IS_IPAD()?[UIFont fontWithName:@"SFUIText-Bold" size:[UIFont fontWithName:@"SFUIText-Bold" size:fontSize].pointSize*1.4]:[UIFont fontWithName:@"SFUIText-Bold" size:fontSize]
#define ENGLISH_HEADING_FONT_REGULAR(fontSize) IS_IPAD()?[UIFont fontWithName:@"SFUIText" size:[UIFont fontWithName:@"SFUIText" size:fontSize].pointSize*1.4]:[UIFont fontWithName:@"SFUIText" size:fontSize]
#define font(fontName, fontSize)  IS_IPAD()?[UIFont fontWithName:fontName size:[UIFont fontWithName:fontName size:fontSize].pointSize*1.4]:[UIFont fontWithName:fontName size:fontSize]
#define ENGLISH_HEADING_FONT_NORMAL(fontSize) IS_IPAD()?[UIFont fontWithName:@"SFUIText-Medium" size:[UIFont fontWithName:@"SFUIText-Medium" size:fontSize].pointSize*1.7]:[UIFont fontWithName:@"SFUIText-Medium" size:fontSize]
#define ENGLISH_HEADING_FONT_Black(fontSize)  IS_IPAD()?[UIFont fontWithName:@"SFUIText-Bold" size:[UIFont fontWithName:@"SFUIText-Bold" size:fontSize].pointSize*1.7]:[UIFont fontWithName:@"SFUIText-Bold" size:fontSize]
#define ENGLISH_HEADING_FONT_Light(fontSize)  IS_IPAD()?[UIFont fontWithName:@"SFUIText-Light" size:[UIFont fontWithName:@"SFUIText-Light" size:fontSize].pointSize*1.7]:[UIFont fontWithName:@"SFUIText-Light" size:fontSize]

/*
 Colors
 */

#define SIDE_MENU_FONT [UIFont fontWithName:@"SFUIText-Medium" size:13];

/*
images
*/

#define kDashBoard_Add_Button IS_IPAD()? [UIImage imageNamed:@"item-add-small-iPad.png"]:[UIImage imageNamed:@"item-add-small-iPhone.png"]
#define kDashBoard_Minus_Button IS_IPAD()? [UIImage imageNamed:@"item-delet-small-iPad.png"]:[UIImage imageNamed:@"item-delet-small-iPhone.png"]

/*
 Controls Height and Width
*/

#define TAB_BAR_HEIGHT 70


#define kLanguageCookie @"X-Language"
#define kAuthCookie @"X-AspNet-Auth"
#define kWebMessageHost @"com.mol"


#define kCharsetUTF8Value     @"application/x-www-form-urlencoded"
#define kContentTypeHeader    @"Content-Type"
#define kContentLengthHeader  @"Content-Length"
#define kRequestParamInfo     @"X-RequestParamInfo"
#define kAcceptLanguage       @"Accept-Language"
#define kContentTypeVaue      @"application/json"
#define kPOSTRequest @"POST"
#define kGETRequest @"GET"
#define kRequestParamInfo     @"X-RequestParamInfo"
#define kMessageHtml @"message"


#define VehicleLibraryIndex 0
#define VehicleInfoIndex 1
#define RegistrationIndex 2
#define ServicesIndex 3
#define WOFIndex 4
#define MileageIndex 5
#define TollRoadsIndex 6
#define FinesIndex 7
#define BreakdownsIndex 8
#define AccidentsIndex 9
