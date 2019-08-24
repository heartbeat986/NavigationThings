//
//  UIViewController+NavbarHidden.m
//  NavigationTest
//
//  Created by 林文龙 on 2019/8/24.
//  Copyright © 2019 中环互联. All rights reserved.
//

#import "UIViewController+NavbarHidden.h"
#import <objc/runtime.h>

@implementation UIViewController (NavbarHidden)

- (void)setIsNavbarHidden:(BOOL)isNavbarHidden{
    objc_setAssociatedObject(self, @selector(isNavbarHidden), [NSNumber numberWithBool:isNavbarHidden], OBJC_ASSOCIATION_ASSIGN);
}

- (BOOL)isNavbarHidden{
   return [objc_getAssociatedObject(self, _cmd) boolValue];
}

@end
