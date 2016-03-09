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

@protocol CCTabBarDelegate;

@interface CCTabBar : UIView

@property (nonatomic, weak, nullable) id<CCTabBarDelegate> delegate;

/**
 *  Tab bar height, default is 49.0.
 */
@property (nonatomic, assign) CGFloat itemHeight;

/**
 *  Current selected item which is highlighted on tab bar.
 */
@property (nonatomic, strong) CCTabBarItem *selectedItem;

/**
 *  Current selected index which is highlighted on tab bar.
 */
@property (nonatomic, assign) NSUInteger selectedIndex;

/**
 *  All the items on tab bar, read-only.
 */
@property (nonatomic, copy, readonly) NSArray<CCTabBarItem *> *items;

/**
 *  Update constraints for tab bar.
 */
- (void)updateTabBarLayout;

@end

@protocol CCTabBarDelegate <NSObject>

@optional

- (BOOL)tabBar:(CCTabBar *)tabBar shouldSelectItemAtIndex:(NSUInteger)index;
- (void)tabBar:(CCTabBar *)tabBar willSelectItemAtIndex:(NSUInteger)index;
- (void)tabBar:(CCTabBar *)tabBar didSelectItemAtIndex:(NSUInteger)index;

@end

NS_ASSUME_NONNULL_END