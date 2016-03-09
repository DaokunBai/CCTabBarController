//
//  CCTabBarItem.m
//  Pods
//
//  Created by Draveness on 16/3/9.
//
//

#import "CCTabBarItem.h"

@implementation CCTabBarItem

- (instancetype)initWithMaker:(void (^)(CCTabBarItem *))maker {
    if (self = [super init]) {
        maker(self);
    }
    return self;
}

@end
