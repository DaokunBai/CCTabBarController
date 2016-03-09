//
//  CCTabBarController.m
//  Pods
//
//  Created by Draveness on 16/3/9.
//
//

#import "CCTabBarController.h"
#import <objc/runtime.h>

@interface UIViewController (CCTabBarItem)

@property (nonatomic, strong, setter=cc_setTabBarItem:) CCTabBarItem *cc_tabBarItem;

@end

@interface CCTabBarController ()

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
//
        for (UIViewController *viewController in viewControllers) {
//            RDVTabBarItem *tabBarItem = [[RDVTabBarItem alloc] init];
//            [tabBarItem setTitle:viewController.title];
//            [tabBarItems addObject:tabBarItem];
//            [viewController rdv_setTabBarController:self];
        }
//
//        [[self tabBar] setItems:tabBarItems];
    } else {

        _viewControllers = nil;
    }
}

- (NSUInteger)actualIndex {
    return self.selectedIndex;
}

@end

@implementation UIViewController (CCTabBarItem)

- (CCTabBarItem *)cc_tabBarItem {
    return objc_getAssociatedObject(self, @selector(cc_tabBarItem));
}

- (void)cc_setTabBarItem:(CCTabBarItem *)cc_tabBarItem {
    objc_setAssociatedObject(self, @selector(cc_tabBarItem), cc_tabBarItem, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end