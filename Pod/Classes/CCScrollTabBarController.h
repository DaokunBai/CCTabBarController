//
//  CCScrollTabBarController.h
//  Pods
//
//  Created by Draveness on 16/4/2.
//
//

#import <UIKit/UIKit.h>

@interface CCScrollTabBarController : UIViewController

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

- (void)addViewController:(UIViewController *)viewController title:(NSString *)title;

@end
