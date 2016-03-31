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
 *  The top line for tab bar.
 */
@property (nonatomic, strong, readonly) UIView *topLine;

/**
 *  Update constraints for tab bar.
 */
- (void)updateTabBarLayout;

@end

@protocol CCTabBarDelegate <NSObject>

@optional

/**
 *  Decided whether current index should be selected, return NO if do not
 *  want to change selected current tab bar item
 *
 *  @param tabBar The tab bar on the top-most of controller
 *  @param index  A tab bar index which be clicked
 *
 *  @return Change selected index to argument index or not
 */
- (BOOL)tabBar:(CCTabBar *)tabBar shouldSelectItemAtIndex:(NSUInteger)index;

/**
 *  Before the tab bar will select item at index, this method will be called
 *
 *  @param tabBar The tab bar on the top-most of controller
 *  @param index  A tab bar index which be clicked
 */
- (void)tabBar:(CCTabBar *)tabBar willSelectItemAtIndex:(NSUInteger)index;

/**
 *  After the tab bar will select item at index, this method will be called
 *
 *  @param tabBar The tab bar on the top-most of controller
 *  @param index  A tab bar index which be clicked
 */
- (void)tabBar:(CCTabBar *)tabBar didSelectItemAtIndex:(NSUInteger)index;

@end

NS_ASSUME_NONNULL_END