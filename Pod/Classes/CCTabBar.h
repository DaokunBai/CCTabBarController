//
//  CCTabBar.h
//  Pods
//
//  Created by Draveness on 16/3/9.
//
//

#import <UIKit/UIKit.h>

@class CCTabBarItem;

NS_ASSUME_NONNULL_BEGIN

@interface CCTabBar : UIView

/**
 *  Current selected item which is highlighted on tab bar.
 */
@property (nonatomic, strong) CCTabBarItem *selectedItem;

/**
 *  Current selected index which is highlighted on tab bar.
 */
@property (nonatomic, assign) NSUInteger selectedIndex;

@property (nonatomic, copy, readonly) NSArray<CCTabBarItem *> *items;

@end

NS_ASSUME_NONNULL_END