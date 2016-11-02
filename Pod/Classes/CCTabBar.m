//
//  CCTabBar.m
//  Pods
//
//  Created by Draveness on 16/3/9.
//
//

#import "CCTabBar.h"
#import "CCTabBarItem.h"
#import <Masonry/Masonry.h>

@interface CCTabBar ()

@property (nonatomic, copy, readwrite) NSArray<CCTabBarItem *> *items;

@end

@implementation CCTabBar

- (instancetype)init {
    if (self = [super init]) {
        _itemHeight = 49.0;
        self.backgroundColor = [UIColor whiteColor];
        _topLine = [[UIView alloc] init];
        _topLine.backgroundColor = [UIColor colorWithRed:0.949 green:0.949 blue:0.949 alpha:0.5];
        [self addSubview:_topLine];
        [_topLine mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.mas_offset(0);
            make.height.mas_equalTo(0.5);
        }];
    }
    return self;
}

- (void)setItems:(NSArray<CCTabBarItem *> *)items {
    _items = [items copy];
    _items.firstObject.current = YES;

    for (CCTabBarItem *item in _items) {
        [self addSubview:item];
        [item mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.mas_equalTo(0);
        }];
        [item addTarget:self
                 action:@selector(tabBarItemClicked:)
       forControlEvents:UIControlEventTouchUpInside];
    }

    [_items mas_distributeViewsAlongAxis:MASAxisTypeHorizontal
                        withFixedSpacing:0
                             leadSpacing:0
                             tailSpacing:0];
}

- (void)tabBarItemClicked:(CCTabBarItem *)item {
    [item setBadgeNumber:0];

    NSUInteger index = [self.items indexOfObject:item];
    if (self.delegate) {
        if ([self.delegate respondsToSelector:@selector(tabBar:shouldSelectItemAtIndex:)]) {
            if (![self.delegate tabBar:self shouldSelectItemAtIndex:index]) {
                return;
            }
        }
    }
    if (self.delegate && [self.delegate respondsToSelector:@selector(tabBar:willSelectItemAtIndex:)]) {
        [self.delegate tabBar:self willSelectItemAtIndex:index];
    }

    for (CCTabBarItem *item in self.items) {
        item.current = NO;
    }
    self.items[index].current = YES;

    if (self.delegate && [self.delegate respondsToSelector:@selector(tabBar:didSelectItemAtIndex:)]) {
        [self.delegate tabBar:self didSelectItemAtIndex:index];
    }
}

- (void)setItemHeight:(CGFloat)itemHeight {
    _itemHeight = itemHeight;
    [self updateTabBarLayout];
}

- (void)updateTabBarLayout {
    [self mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(0);
        make.height.mas_equalTo(_itemHeight);
    }];
}

@end
