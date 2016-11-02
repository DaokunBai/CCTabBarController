//
//  CCAppDelegate.m
//  CCTabBarController
//
//  Created by Draveness on 03/09/2016.
//  Copyright (c) 2016 Draveness. All rights reserved.
//

#import "CCAppDelegate.h"
#import "CCViewController.h"
#import <CCTabBarController/CCTabBarController.h>
//#import <CCTabBarController/CCScrollTabBarController.h>

@implementation CCAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{


    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    [self setupTabBarController];
//    [self setupScrollTabBarController];
    [self.window makeKeyAndVisible];
    return YES;
}

//- (void)setupScrollTabBarController {
//    CCViewController *firstVC = [[CCViewController alloc] init];
//    CCViewController *secondVC = [[CCViewController alloc] init];
//    CCViewController *thirdVC = [[CCViewController alloc] init];
//    CCViewController *forthVC = [[CCViewController alloc] init];
//
//    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:firstVC];
//
//    CCScrollTabBarController *tabBarController = [[CCScrollTabBarController alloc] init];
//    [tabBarController addViewController:firstVC maker:^(CCScrollTabBarItem *maker) {
//        maker.title = @"111";
//    }];
//    [tabBarController addViewController:secondVC maker:^(CCScrollTabBarItem *maker) {
//        maker.title = @"222";
//    }];
//    [tabBarController addViewController:thirdVC maker:^(CCScrollTabBarItem *maker) {
//        maker.title = @"333";
//    }];
//    [tabBarController addViewController:forthVC maker:^(CCScrollTabBarItem *maker) {
//        maker.title = @"444";
//    }];
//
//    [tabBarController commitInitialization];
//    self.window.rootViewController = tabBarController;
//}

- (void)setupTabBarController {
    CCViewController *firstVC = [[CCViewController alloc] init];
    CCViewController *secondVC = [[CCViewController alloc] init];
    CCViewController *thirdVC = [[CCViewController alloc] init];
    CCViewController *forthVC = [[CCViewController alloc] init];

    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:firstVC];

    CCTabBarController *tabBarController = [[CCTabBarController alloc] init];
    [tabBarController addViewController:nav maker:^(CCTabBarItem * _Nonnull maker) {
        maker.normalImage = [UIImage imageNamed:@"Feed_Normal"];
        maker.selectedImage = [UIImage imageNamed:@"Feed_Highlight"];
    }];

    [tabBarController addViewController:secondVC maker:^(CCTabBarItem * _Nonnull maker) {
        maker.normalImage = [UIImage imageNamed:@"Find_Normal"];
        maker.selectedImage = [UIImage imageNamed:@"Find_Highlight"];
    }];

    [tabBarController addViewController:thirdVC maker:^(CCTabBarItem * _Nonnull maker) {
        maker.normalImage = [UIImage imageNamed:@"Notice_Normal"];
        maker.selectedImage = [UIImage imageNamed:@"Notice_Highlight"];
    }];

    [tabBarController addViewController:forthVC maker:^(CCTabBarItem * _Nonnull maker) {
        maker.normalImage = [UIImage imageNamed:@"People_Normal"];
        maker.selectedImage = [UIImage imageNamed:@"People_Highlight"];
    }];
    [tabBarController commitInitialization];
    self.window.rootViewController = tabBarController;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
