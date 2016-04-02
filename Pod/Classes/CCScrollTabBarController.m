//
//  CCScrollTabBarController.m
//  Pods
//
//  Created by Draveness on 16/4/2.
//
//

#import "CCScrollTabBarController.h"
#import <Masonry/Masonry.h>

@interface CCScrollTabBarController ()

@property (nonatomic, copy, readwrite) NSArray<UIViewController *> *viewControllers;
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIView *scrollViewContentView;;

@end

@implementation CCScrollTabBarController {
    NSMutableArray<UIViewController *> *_initializeViewControllers;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.view addSubview:self.scrollView];
    [self.scrollView addSubview:self.scrollViewContentView];

    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
    [self.scrollViewContentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
        make.height.mas_equalTo(self.scrollView);
    }];

    [self.scrollViewContentView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(self.view.frame.size.width * _viewControllers.count);
    }];

    NSMutableArray<UIView *> *views = [@[] mutableCopy];
    for (UIViewController *viewController in _viewControllers) {
        [self.scrollViewContentView addSubview:viewController.view];
        [views addObject:viewController.view];
    }

    [views mas_distributeViewsAlongAxis:MASAxisTypeHorizontal
                       withFixedSpacing:0 leadSpacing:0 tailSpacing:0];
}

- (void)beginInitialization {
    _initializeViewControllers = [[NSMutableArray alloc] init];
}

- (void)addViewController:(UIViewController *)viewController title:(NSString *)title {
    if (!_initializeViewControllers) {
        _initializeViewControllers = [[NSMutableArray alloc] init];
    }

    [_initializeViewControllers addObject:viewController];
}

- (void)commitInitialization {
    self.viewControllers = [_initializeViewControllers copy];
    _initializeViewControllers = nil;
}

- (void)setViewControllers:(NSArray<UIViewController *> *)viewControllers {
    _viewControllers = [viewControllers copy];
}

- (UIScrollView *)scrollView {
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] init];
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.pagingEnabled = YES;
    }
    return _scrollView;
}

- (UIView *)scrollViewContentView {
    if (!_scrollViewContentView) {
        _scrollViewContentView = [[UIView alloc] init];
    }
    return _scrollViewContentView;
}

@end
