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
    }
    return self;
}

- (void)setItems:(NSArray<CCTabBarItem *> *)items {
    _items = [items copy];

    for (CCTabBarItem *item in _items) {
        [self addSubview:item];
        [item mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.mas_equalTo(0);
        }];
    }

    [_items mas_distributeViewsAlongAxis:MASAxisTypeHorizontal
                        withFixedSpacing:0
                             leadSpacing:0
                             tailSpacing:0];
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
