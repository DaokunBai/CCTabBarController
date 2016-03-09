//
//  CCViewController.m
//  CCTabBarController
//
//  Created by Draveness on 03/09/2016.
//  Copyright (c) 2016 Draveness. All rights reserved.
//

#import "CCViewController.h"

@interface CCViewController ()

@end

@implementation CCViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

    UIButton *btn = [[UIButton alloc] init];
    btn.frame = self.view.frame;
    [btn setTitle:@"Push" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [self.view addSubview:btn];

    [btn addTarget:self
            action:@selector(push)
  forControlEvents:UIControlEventTouchUpInside];
}

- (void)push {
    [self.navigationController pushViewController:[[CCViewController alloc] init]
                                         animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
