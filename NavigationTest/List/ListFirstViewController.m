//
//  ListFirstViewController.m
//  NavigationTest
//
//  Created by 林文龙 on 2019/8/23.
//  Copyright © 2019 中环互联. All rights reserved.
//

#import "ListFirstViewController.h"
#import "ListSecondViewController.h"

@interface ListFirstViewController ()

@end

@implementation ListFirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"列表";
    [self buildSubViews];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.navigationItem.backBarButtonItem setTintColor:[UIColor redColor]];
}

- (void)buildSubViews{
    UIButton *pushBtn = [[UIButton alloc] initWithFrame:CGRectZero];
    [pushBtn setTitle:@"push" forState:UIControlStateNormal];
    [pushBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [pushBtn addTarget:self action:@selector(toPush) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:pushBtn];
    pushBtn.center = self.view.center;
    pushBtn.bounds = CGRectMake(0, 0, 100, 50);
    pushBtn.backgroundColor = [UIColor blueColor];
}

- (void)toPush{
    ListSecondViewController *listSecond = [[ListSecondViewController alloc] init];
    [self.navigationController pushViewController:listSecond animated:YES];
}


@end
