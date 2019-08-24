//
//  SecondViewController.m
//  NavigationTest
//
//  Created by 林文龙 on 2019/8/23.
//  Copyright © 2019 中环互联. All rights reserved.
//

#import "SecondViewController.h"
#import "ThirdViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blueColor];
    [self buildSubViews];
    self.title = @"第二个界面";
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
    ThirdViewController *thirdVc = [[ThirdViewController alloc] init];
    [self.navigationController pushViewController:thirdVc animated:YES];
    self.tabBarController.hidesBottomBarWhenPushed = YES;
}



@end
