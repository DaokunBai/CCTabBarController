//
//  CCTabBarController.h
//  Pods
//
//  Created by Draveness on 16/3/9.
//
//

#import <UIKit/UIKit.h>
#import "CCTabBarItem.h"
#import "CCTabBar.h"

NS_ASSUME_NONNULL_BEGIN

@protocol CCTabBarControllerDelegate;

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
                    maker:(void(^)(CCTabBarItem *))maker;

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

@end

@protocol CCTabBarControllerDelegate <NSObject>

@end


@interface UIViewController (CCTabBarItem)

/**
 *  Corresponding tab bar item.
 */
@property (nonatomic, strong, readonly, nullable) CCTabBarItem *cc_tabBarItem;

/**
 *  Corresponding tab bar controller, read-only.
 */
@property (nonatomic, weak, readonly, nullable) CCTabBarController *cc_tabBarController;

@end


NS_ASSUME_NONNULL_END