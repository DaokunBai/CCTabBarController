//
//  UIViewController+CCTabBarController.m
//  Pods
//
//  Created by Draveness on 16/3/12.
//
//

#import "UIViewController+CCTabBarController.h"
#import "CCTabBarController.h"
#import "CCTabBarItem.h"
#import <objc/runtime.h>

@interface UIViewController ()

@property (nonatomic, weak, readwrite, nullable, setter=cc_setTabBarItem:) CCTabBarItem *cc_tabBarItem;
@property (nonatomic, weak, readwrite, nullable, setter=cc_setTabBarController:) CCTabBarController *cc_tabBarController;

@end

@implementation UIViewController (CCTabBarItem)

- (CCTabBarItem *)cc_tabBarItem {
    return objc_getAssociatedObject(self, @selector(cc_tabBarItem));
}

- (void)cc_setTabBarItem:(CCTabBarItem *)cc_tabBarItem {
    objc_setAssociatedObject(self, @selector(cc_tabBarItem), cc_tabBarItem, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (CCTabBarController *)cc_tabBarController {
    CCTabBarController *tabBarController = objc_getAssociatedObject(self, @selector(cc_tabBarController));
    if (!tabBarController) {
        if ([self.navigationController.cc_tabBarController isKindOfClass:[CCTabBarController class]]) {
            tabBarController = self.navigationController.cc_tabBarController;
        }
    }
    return tabBarController;
}

- (void)cc_setTabBarController:(CCTabBarController *)cc_tabBarController {
    objc_setAssociatedObject(self, @selector(cc_tabBarController), cc_tabBarController, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
