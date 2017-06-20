//
//  AppDelegate.m
//  Voom
//
//  Created by user on 12/06/17.
//  Copyright © 2017 user. All rights reserved.
//

#import "AppDelegate.h"
#import "LoginViewControlleriPhone.h"
#import "SideMenuViewControlleriPhone.h"
#import "Constants.h"
#import "Firebase.h"
#import <GoogleMaps/GoogleMaps.h>
#import <GooglePlaces/GooglePlaces.h>
@interface AppDelegate (){
    
}

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [self setApplicationLayoutSettings];
    [self setApplicationRootLayout];
    [self setConfigurations];
    [FIRApp configure];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark Layout Methods

-(void) setApplicationRootLayout{
    
    LoginViewControlleriPhone  *loginViewController =[[LoginViewControlleriPhone alloc] initWithNibName:@"LoginViewControlleriPhone" bundle:nil];
    self.homeNavigationController = [[UINavigationController alloc] initWithRootViewController:loginViewController];
    self.homeNavigationController.navigationBarHidden = YES;
    
    SideMenuViewControlleriPhone  *sideViewController =[[SideMenuViewControlleriPhone alloc] initWithNibName:@"SideMenuViewControlleriPhone" bundle:nil];
    self.leftSideMenu = [[LGSideMenuController alloc] initWithRootViewController:self.homeNavigationController];
    self.leftSideMenu.leftViewController = sideViewController;
    self.leftSideMenu.leftViewPresentationStyle = LGSideMenuPresentationStyleSlideAbove;
    self.leftSideMenu.leftViewBackgroundColor = kAppSecondaryColor;
    self.window = [[UIWindow alloc] initWithFrame:UIScreen.mainScreen.bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = self.leftSideMenu;
    [self.window makeKeyAndVisible];
}

-(void) setApplicationLayoutSettings{
    [AppPreferences changeApplicationTabBarAppearance];
}

-(void) setConfigurations
{
     [GMSServices provideAPIKey:Google_API_Key];
     [GMSPlacesClient provideAPIKey:Google_API_Key];
}
@end
