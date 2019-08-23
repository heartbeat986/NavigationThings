//
//  JXXNavigationViewController.m
//  NavigationTest
//
//  Created by 林文龙 on 2019/8/23.
//  Copyright © 2019 中环互联. All rights reserved.
//

#import "JXXNavigationViewController.h"

@interface JXXNavigationViewController ()<UINavigationBarDelegate,UINavigationControllerDelegate,UIGestureRecognizerDelegate>

@end

@implementation JXXNavigationViewController
+ (void)initialize{
    UINavigationBar *navigationBar = [UINavigationBar appearance];
    navigationBar.barTintColor = [UIColor yellowColor];
    navigationBar.translucent = NO;
    navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor whiteColor]};
    navigationBar.shadowImage = [[UIImage alloc] init];
}

- (void)viewDidLoad{
    [super viewDidLoad];
    self.delegate = self;
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if (self.viewControllers.count > 0) {
        [viewController setHidesBottomBarWhenPushed:YES];
        
        UIButton *backBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 80)];
        [backBtn setTitle:@"去返回" forState:UIControlStateNormal];
        [backBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [backBtn setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
        [backBtn addTarget:self action:@selector(toPop) forControlEvents:UIControlEventTouchUpInside];
        backBtn.titleEdgeInsets = UIEdgeInsetsMake(0, -20, 0, 0);
        backBtn.imageEdgeInsets = UIEdgeInsetsMake(0, -20, 0, 0);
        UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
        viewController.navigationItem.leftBarButtonItem = item;
    }
    [super pushViewController:viewController animated:animated];
}

- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if (self.viewControllers.count > 1) {
        self.interactivePopGestureRecognizer.delegate = self;
        self.interactivePopGestureRecognizer.enabled = YES;
    }else if(self.viewControllers.count == 1){
        self.interactivePopGestureRecognizer.delegate = nil;
        self.interactivePopGestureRecognizer.enabled = NO;
    }
}

- (void)toPop{
    [self popViewControllerAnimated:YES];
}






@end
