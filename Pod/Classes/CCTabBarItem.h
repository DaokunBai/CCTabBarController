//
//  CCTabBarItem.h
//  Pods
//
//  Created by Draveness on 16/3/9.
//
//

#import <UIKit/UIKit.h>

@interface CCTabBarItem : UIControl

- (instancetype)initWithMaker:(void(^)(CCTabBarItem *))maker;

@end
