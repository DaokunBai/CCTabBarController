//
//  CCTabBarController.m
//  Pods
//
//  Created by Draveness on 16/3/9.
//
//

#import "CCTabBarController.h"
#import <objc/runtime.h>
#import <Masonry/Masonry.h>

@interface UIViewController ()

@property (nonatomic, strong, readwrite, nullable, setter=cc_setTabBarItem:) CCTabBarItem *cc_tabBarItem;
@property (nonatomic, weak, readwrite, nullable, setter=cc_setTabBarController:) CCTabBarController *cc_tabBarController;

@end

@interface CCTabBar ()

@property (nonatomic, copy, readwrite) NSArray<CCTabBarItem *> *items;

@end

@interface CCTabBarController () <CCTabBarDelegate>

@property (nonatomic, strong, readwrite) CCTabBar *tabBar;
@property (nonatomic, copy, readwrite) NSArray<UIViewController *> *viewControllers;
@property (nonatomic, assign, readonly) NSUInteger actualIndex;

@end

@implementation CCTabBarController {
    NSMutableArray<UIViewController *> *_initializeViewControllers;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];


    self.selectedIndex = 0;
    [self.view addSubview:_tabBar];
    [_tabBar updateTabBarLayout];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.selectedIndex = self.selectedIndex;
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return self.selectedViewController.preferredStatusBarStyle;
}

- (UIStatusBarAnimation)preferredStatusBarUpdateAnimation {
    return self.selectedViewController.preferredStatusBarUpdateAnimation;
}

- (void)beginInitialization {
    _initializeViewControllers = [[NSMutableArray alloc] init];
}

- (void)addViewController:(UIViewController *)viewController maker:(void (^)(CCTabBarItem * _Nonnull))maker {
    if (!_initializeViewControllers) {
        _initializeViewControllers = [[NSMutableArray alloc] init];
    }

    viewController.cc_tabBarItem = [[CCTabBarItem alloc] initWithMaker:maker];
    [_initializeViewControllers addObject:viewController];
}

- (void)commitInitialization {
    self.viewControllers = [_initializeViewControllers copy];
    _initializeViewControllers = nil;
}

#pragma mark - Getter/Setter

- (UIViewController *)selectedViewController {
    return self.viewControllers[self.actualIndex];
}

- (void)setSelectedIndex:(NSUInteger)selectedIndex {
    if (selectedIndex >= self.tabBar.items.count) {
        NSAssert(NO, @"selectedIndex %@ is out of bound %@.", @(selectedIndex), @(self.tabBar.items.count));
        return;
    }

    if (self.selectedViewController) {
        [self.selectedViewController willMoveToParentViewController:nil];
        [self.selectedViewController removeFromParentViewController];
        [self.selectedViewController.view removeFromSuperview];
    }

    _selectedIndex = selectedIndex;

    self.tabBar.selectedIndex = selectedIndex;
    self.selectedViewController = self.viewControllers[self.actualIndex];
    self.selectedViewController.view.frame = self.view.bounds;
    [self.view addSubview:self.selectedViewController.view];
    [self.selectedViewController didMoveToParentViewController:nil];

    [self.view bringSubviewToFront:self.tabBar];

    [self setNeedsStatusBarAppearanceUpdate];
}

- (void)setViewControllers:(NSArray<UIViewController *> *)viewControllers {
    if (_viewControllers && _viewControllers.count) {
        for (UIViewController *viewController in _viewControllers) {
            [viewController willMoveToParentViewController:nil];
            [viewController.view removeFromSuperview];
            [viewController removeFromParentViewController];
        }
    }

    if (viewControllers && [viewControllers isKindOfClass:[NSArray class]]) {
        _viewControllers = [viewControllers copy];

        NSMutableArray *tabBarItems = [[NSMutableArray alloc] init];

        for (UIViewController *viewController in viewControllers) {
            [tabBarItems addObject:viewController.cc_tabBarItem];
            viewController.cc_tabBarController = self;
        }

        self.tabBar.items = [tabBarItems copy];
    } else {

        _viewControllers = nil;
    }
}

- (CCTabBar *)tabBar {
    if (!_tabBar) {
        _tabBar = [[CCTabBar alloc] init];
        _tabBar.layer.zPosition = 999;
        _tabBar.delegate = self;
    }
    return _tabBar;
}

- (NSUInteger)actualIndex {
    return self.selectedIndex;
}

#pragma mark - CCTabBarDelegate

- (BOOL)tabBar:(CCTabBar *)tabBar shouldSelectItemAtIndex:(NSUInteger)index {
    if ([self.delegate respondsToSelector:@selector(tabBarController:shouldSelectViewController:)]) {
        if (![self.delegate tabBarController:self shouldSelectViewController:self.viewControllers[index]]) {
            return NO;
        }
    }

    if (self.selectedViewController == self.viewControllers[index]) {
        if ([self.selectedViewController isKindOfClass:[UINavigationController class]]) {
            UINavigationController *selectedController = (UINavigationController *)self.selectedViewController;

            if ([selectedController topViewController] != [selectedController viewControllers][0]) {
                [selectedController popToRootViewControllerAnimated:YES];
            }
        }

        return NO;
    }

    return YES;
}

- (void)tabBar:(CCTabBar *)tabBar willSelectItemAtIndex:(NSUInteger)index {
    if ([self.delegate respondsToSelector:@selector(tabBarController:willSelectViewController:)]) {
        [self.delegate tabBarController:self willSelectViewController:self.viewControllers[index]];
    }
}

- (void)tabBar:(CCTabBar *)tabBar didSelectItemAtIndex:(NSUInteger)index {
    if (index >= self.tabBar.items.count) {
        return;
    }

    [self setSelectedIndex:index];

    if ([self.delegate respondsToSelector:@selector(tabBarController:didSelectViewController:)]) {
        [self.delegate tabBarController:self didSelectViewController:self.viewControllers[index]];
    }
}

@end
