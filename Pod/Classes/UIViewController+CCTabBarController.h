//
//  UIViewController+CCTabBarController.h
//  Pods
//
//  Created by Draveness on 16/3/12.
//
//

#import <UIKit/UIKit.h>

@class CCTabBarController;
@class CCTabBarItem;

NS_ASSUME_NONNULL_BEGIN

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