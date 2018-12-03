//
//  UIWindow+JSCategory.m
//  TestProject
//
//  Created by lmg on 2018/11/30.
//  Copyright © 2018 lmg. All rights reserved.
//

#import "UIWindow+JSCategory.h"

@implementation UIWindow (JSCategory)
- (UIViewController*)js_topMostController
{
    UIViewController *topController = [self rootViewController];
    
    //  Getting topMost ViewController
    while ([topController presentedViewController])    topController = [topController presentedViewController];
    
    //  Returning topMost ViewController
    return topController;
}

- (UIViewController*)js_currentViewController;
{
    UIViewController *currentViewController = [self js_topMostController];
    
    while ([currentViewController isKindOfClass:[UINavigationController class]] && [(UINavigationController*)currentViewController topViewController])
        currentViewController = [(UINavigationController*)currentViewController topViewController];
    
    return currentViewController;
}
@end
