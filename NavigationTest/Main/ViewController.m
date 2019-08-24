//
//  ViewController.m
//  NavigationTest
//
//  Created by 林文龙 on 2019/8/23.
//  Copyright © 2019 中环互联. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self navSetting];
    [self buildSubViews];
    self.view.backgroundColor = [UIColor yellowColor];
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

- (void)navSetting{
    self.title = @"第一个界面";
    
    self.navigationController.navigationBar.barTintColor = [UIColor blueColor];
    self.navigationController.navigationBar.translucent = YES;
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor whiteColor]};
    
    self.navigationController.navigationBar.backIndicatorImage = [[UIImage imageNamed:@"back"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.navigationController.navigationBar.backIndicatorTransitionMaskImage = [[UIImage imageNamed:@"back"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"要返回咯" style:UIBarButtonItemStylePlain target:self action:@selector(toPop)];
    [self.navigationItem.backBarButtonItem setTintColor:[UIColor redColor]];


}

- (void)toPush{
    SecondViewController *secondVc = [[SecondViewController alloc] init];
    [self.navigationController pushViewController:secondVc animated:YES];
    self.tabBarController.hidesBottomBarWhenPushed = YES;
}
- (void)toPop{
    NSLog(@"退出");
}


@end
