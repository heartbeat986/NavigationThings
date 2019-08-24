//
//  ListSecondViewController.m
//  NavigationTest
//
//  Created by 林文龙 on 2019/8/23.
//  Copyright © 2019 中环互联. All rights reserved.
//

#import "ListSecondViewController.h"

@interface ListSecondViewController ()

@end

@implementation ListSecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
   
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationItem.backBarButtonItem.tintColor = [UIColor redColor];
}


@end
