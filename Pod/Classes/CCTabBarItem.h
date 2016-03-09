//
//  CCTabBarItem.h
//  Pods
//
//  Created by Draveness on 16/3/9.
//
//

#import <UIKit/UIKit.h>

@interface CCTabBarItem : UIControl

/**
 *  Designated initializer for CCTabBarItem, customize item with
 *  a block which pass several property for item's display in different
 *  situations.
 *
 *  @param maker A maker, just item itself
 *
 *  @return An instance for CCTabBarItem
 */
- (instancetype)initWithMaker:(void(^)(CCTabBarItem *maker))maker;

@end
