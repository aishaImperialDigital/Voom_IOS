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
#import "VehicleLibraryViewControlleriPhone.h"
#import "VehicleCheckViewControlleriPhone.h"
#import "RemindersViewControlleriPhone.h"
#import "SettingsViewControlleriPhone.h"
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

-(void) createTabBarController{
    VehicleLibraryViewControlleriPhone *vehicleViewController = [[VehicleLibraryViewControlleriPhone alloc] initWithNibName:@"VehicleLibraryViewControlleriPhone" bundle:nil];
    vehicleViewController.title = @"Vehicles";
    vehicleViewController.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Vehicles" image:[UIImage imageNamed:@"VehicleLibrary-iPhone.png"] tag:0];
    UINavigationController *firstNavController = [[UINavigationController alloc]initWithRootViewController:vehicleViewController];
    
    VehicleCheckViewControlleriPhone *vehicleCheckViewController = [[VehicleCheckViewControlleriPhone alloc] initWithNibName:@"VehicleCheckViewControlleriPhone" bundle:nil];
    vehicleCheckViewController.title = kTitleVehicleCheck;
    vehicleCheckViewController.tabBarItem =  [[UITabBarItem alloc] initWithTitle:kTitleVehicleCheck image:[UIImage imageNamed:@"VehicleCheck-iPhone.png"] tag:1];
    UINavigationController *secondNavController = [[UINavigationController alloc]initWithRootViewController:vehicleCheckViewController];
    
    RemindersViewControlleriPhone *reminderViewController = [[RemindersViewControlleriPhone alloc]initWithNibName:@"RemindersViewControlleriPhone" bundle:nil];
    reminderViewController.title = kTitleReminders;
    reminderViewController.tabBarItem =  [[UITabBarItem alloc] initWithTitle:kTitleReminders image:[UIImage imageNamed:@"Reminder-iPhone"] tag:2];
    UINavigationController *thirdNavController = [[UINavigationController alloc]initWithRootViewController:reminderViewController];
    
    SettingsViewControlleriPhone *forthViewController = [[SettingsViewControlleriPhone alloc]initWithNibName:@"SettingsViewControlleriPhone" bundle:nil];
    forthViewController.title = kTitleSettings;
    forthViewController.tabBarItem = [[UITabBarItem alloc] initWithTitle:kTitleSettings image:[UIImage imageNamed:@"Settings-iPhone"] tag:3];
    UINavigationController *forthNavController = [[UINavigationController alloc]initWithRootViewController:forthViewController];
    
    self.tabBarController = [[UITabBarController alloc] init];
    self.tabBarController.viewControllers = [[NSArray alloc] initWithObjects:firstNavController, secondNavController, thirdNavController, forthNavController, nil];
    [self.tabBarController.tabBar sizeThatFits:CGSizeMake(SCREEN_WIDTH,TAB_BAR_HEIGHT)];
    self.tabBarController.tabBar.shadowImage = [[UIImage alloc] init];  //delete the default tabbar shadow！
    [self.homeNavigationController pushViewController:self.tabBarController animated:YES];
    
    firstNavController.navigationBarHidden = YES;
    secondNavController.navigationBarHidden = YES;
    thirdNavController.navigationBarHidden = YES;
    forthNavController.navigationBarHidden = YES;
}
@end
