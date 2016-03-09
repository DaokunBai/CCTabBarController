//
//  CCTabBarItem.h
//  Pods
//
//  Created by Draveness on 16/3/9.
//
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

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

@property (nonatomic, strong, nullable) UIColor *normalBackgroundColor;
@property (nonatomic, strong, nullable) UIColor *highlightedBackgroundColor;
@property (nonatomic, strong, nullable) UIColor *selectedBackgroundColor;

@property (nonatomic, strong, nullable) UIImage *normalBackgroundImage;
@property (nonatomic, strong, nullable) UIImage *highlightedBackgroundImage;
@property (nonatomic, strong, nullable) UIImage *selectedBackgroundImage;

@property (nonatomic, strong, nullable) UIImage *normalImage;
@property (nonatomic, strong, nullable) UIImage *highlightedImage;
@property (nonatomic, strong, nullable) UIImage *selectedImage;

@end


NS_ASSUME_NONNULL_END