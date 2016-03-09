//
//  CCTabBar.m
//  Pods
//
//  Created by Draveness on 16/3/9.
//
//

#import "CCTabBar.h"

@interface CCTabBar ()

@property (nonatomic, copy, readwrite) NSArray<CCTabBarItem *> *items;

@end

@implementation CCTabBar

- (instancetype)init {
    if (self = [super init]) {
        _height = 49.0;
    }
    return self;
}

@end
