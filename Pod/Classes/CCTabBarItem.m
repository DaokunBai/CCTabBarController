//
//  CCTabBarItem.m
//  Pods
//
//  Created by Draveness on 16/3/9.
//
//

#import "CCTabBarItem.h"
#import "UIImage+Color.h"
#import <Masonry/Masonry.h>

@interface CCTabBarItem ()

@property (nonatomic, strong) UIView *backgroundColorView;
@property (nonatomic, strong) UIImageView *backgroundImageView;
@property (nonatomic, strong) UIImageView *iconImageView;
@property (nonatomic, strong) UILabel *promptLabel;

@end

@implementation CCTabBarItem

- (instancetype)initWithMaker:(void (^)(CCTabBarItem *))maker {
    if (self = [super init]) {
        _backgroundImageView = [[UIImageView alloc] init];

        _backgroundColorView = [[UIView alloc] init];
        _backgroundColorView.backgroundColor = [UIColor clearColor];

        _iconImageView = [[UIImageView alloc] init];
        _iconImageView.contentMode = UIViewContentModeCenter;

        _promptLabel = [[UILabel alloc] init];

        [self addSubview:_backgroundImageView];
        [_backgroundImageView addSubview:_backgroundColorView];
        [self addSubview:_iconImageView];
        [self addSubview:_promptLabel];

        [_backgroundImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];

        [_backgroundColorView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];

        [_iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];

        _normalBackgroundColor = [UIColor clearColor];

        maker(self);

        [self updateItemBehavior];
    }
    return self;
}

- (void)setCurrent:(BOOL)current {
    _current = current;
    [self updateItemBehavior];
}

- (void)setHighlighted:(BOOL)highlighted {
    [super setHighlighted:highlighted];
    [self updateItemBehavior];
}

- (void)updateItemBehavior {
    self.backgroundImageView.image = [self backgroundImagePicker];
    self.backgroundColorView.backgroundColor = [self backgroundColorPicker];
    self.iconImageView.image = [self iconImagePicker];
}

- (UIImage *)backgroundImagePicker {
    UIImage *resultImage = self.normalBackgroundImage;

    if (self.highlighted && self.highlightedBackgroundImage) {
        resultImage = self.highlightedBackgroundImage;
    }

    if (self.current && self.selectedBackgroundImage) {
        resultImage = self.selectedBackgroundImage;
    }
    return resultImage;
}

- (UIColor *)backgroundColorPicker {
    UIColor *resultColor = self.normalBackgroundColor;

    if (self.highlighted && self.highlightedBackgroundColor) {
        resultColor = self.highlightedBackgroundColor;
    }

    if (self.current && self.selectedBackgroundColor) {
        resultColor = self.selectedBackgroundColor;
    }
    return resultColor;
}

- (UIImage *)iconImagePicker {
    UIImage *resultImage = self.normalImage;

    if (self.highlighted && self.highlightedImage) {
        resultImage = self.highlightedImage;
    }

    if (self.current && self.selectedImage) {
        resultImage = self.selectedImage;
    }
    return resultImage;
}

@end
