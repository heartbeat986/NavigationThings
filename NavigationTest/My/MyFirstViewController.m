//
//  MyFirstViewController.m
//  NavigationTest
//
//  Created by 林文龙 on 2019/8/23.
//  Copyright © 2019 中环互联. All rights reserved.
//

#import "MyFirstViewController.h"
#import "MySecondViewController.h"
#import "UIViewController+NavbarHidden.h"

@interface MyFirstViewController ()

@end

@implementation MyFirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我的";
    [self buildSubViews];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.hidden = YES;
    // Do any additional setup after loading the view.
    self.isNavbarHidden = YES;
}

- (void)buildSubViews{
    UIButton *push = [[UIButton alloc] init];
    [self.view addSubview:push];
    push.center = self.view.center;
    push.bounds = CGRectMake(0, 0, 100, 60);
    [push setTitle:@"push" forState:UIControlStateNormal];
    [push setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [push addTarget:self action:@selector(toPush) forControlEvents:UIControlEventTouchUpInside];
}

- (void)toPush{
    MySecondViewController *secondVc = [[MySecondViewController alloc] init];
    [self.navigationController pushViewController:secondVc animated:YES];
    self.tabBarController.hidesBottomBarWhenPushed = YES;
}

@end
