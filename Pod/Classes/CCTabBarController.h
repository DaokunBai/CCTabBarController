//
//  CCTabBarController.h
//  Pods
//
//  Created by Draveness on 16/3/9.
//
//

#import <UIKit/UIKit.h>
#import "UIViewController+CCTabBarController.h"
#import "CCTabBarItem.h"
#import "CCTabBar.h"

NS_ASSUME_NONNULL_BEGIN

@protocol CCTabBarControllerDelegate;

/**

 Initialize a tab bar controller like this and finally call `commitInitialization`
 method.

    CCTabBarController *tabBarController = [[CCTabBarController alloc] init];
    [tabBarController addViewController:firstVC maker:^(CCTabBarItem * _Nonnull maker) {
        maker.normalImage = [UIImage imageNamed:@"Feed_Normal"];
        maker.selectedImage = [UIImage imageNamed:@"Feed_Highlight"];
    }];

    [tabBarController addViewController:secondVC maker:^(CCTabBarItem * _Nonnull maker) {
        maker.normalImage = [UIImage imageNamed:@"Find_Normal"];
        maker.selectedImage = [UIImage imageNamed:@"Find_Highlight"];
    }];

    [tabBarController commitInitialization];
 */
@interface CCTabBarController : UIViewController

/**
 *  The tab bar controller's delegate.
 */
@property (nonatomic, weak, nullable) id<CCTabBarControllerDelegate> delegate;

/**
 *  The tab bar associated with this controller, readonly.
 */
@property (nonatomic, strong, readonly) CCTabBar *tabBar;

/**
 *  This boolean value indicated the tab bar is visible on the screen
 *  or not, set this value will change tab bar state.
 */
@property (nonatomic, assign, getter=isTabBarHidden) BOOL tabBarHidden;

/**
 *  Current selected view controller which display on this controller.
 */
@property (nonatomic, weak) UIViewController *selectedViewController;

/**
 *  Current selected index.
 */
@property (nonatomic, assign) NSUInteger selectedIndex;

/**
 *  An array of view controllers displayed by this tab bar controller, use 
 *  `addViewController:maker:` method to add view controller to tab bar
 *  controller.
 */
@property (nonatomic, copy, readonly) NSArray<UIViewController *> *viewControllers;

/**
 *  Add an view controller to view controllers array, with a maker which
 *  customize CCTabBarItem. After add multiple view controllers, `MUST` call
 *  `commitInitialization` to commit your changes.
 *
 *  @param viewController An view controller
 *  @param maker          A maker used to customize CCTabBarItem
 */
- (void)addViewController:(UIViewController *)viewController
                    maker:(void(^)(CCTabBarItem *maker))maker;

/**
 *  After adding multiple view controllers, call this method to make changes
 *  render at once including relayout tab bar, MUST be called after add all
 *  view controllers.
 */
- (void)commitInitialization;

/**
 *  Before calling `addViewController:maker:`, you should call this to initialize,
 *  but this is optional if it is the first time to initialize tab bar controller,
 *  this is not necessary to call.
 */
- (void)beginInitialization;

- (void)cc_setTabBarHidden:(BOOL)tabBarHidden animated:(BOOL)animated;

@end

@protocol CCTabBarControllerDelegate <NSObject>

@optional

/**
 *  This method is called when tab bar controller try to select a view controller
 *  on tab bar controller.
 *
 *  @param tabBarController Current tab bar controller
 *  @param viewController   An view controller of tab bar controller's view controllers
 *
 *  @return The tab bar controller whether can select the view controller or not
 */
- (BOOL)tabBarController:(CCTabBarController *)tabBarController shouldSelectViewController:(nonnull UIViewController *)viewController;

/**
 *  Before tab bar controller try to select view controller will call this method.
 *
 *  @param tabBarController Current tab bar controller
 *  @param viewController   An view controller of tab bar controller's view controllers
 */
- (void)tabBarController:(CCTabBarController *)tabBarController willSelectViewController:(nonnull UIViewController *)viewController;

/**
 *  After tab bar controller try to select view controller will call this method
 *
 *  @param tabBarController Current tab bar controller
 *  @param viewController   An view controller of tab bar controller's view controllers
 */
- (void)tabBarController:(CCTabBarController *)tabBarController didSelectViewController:(nonnull UIViewController *)viewController;

@end

NS_ASSUME_NONNULL_END