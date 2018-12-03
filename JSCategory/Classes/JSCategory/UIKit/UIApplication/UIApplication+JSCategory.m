//
//  UIApplication+JSCategory.m
//  TestProject
//
//  Created by lmg on 2018/11/30.
//  Copyright © 2018 lmg. All rights reserved.
//

#import "UIApplication+JSCategory.h"
#import <stdatomic.h>

@implementation UIApplication (JSCategory)

static volatile atomic_int numberOfActiveNetworkConnectionsxxx = 0;

#pragma mark Public API

- (void)js_beganNetworkActivity
{
    atomic_fetch_add(&numberOfActiveNetworkConnectionsxxx,1);
    self.networkActivityIndicatorVisible = numberOfActiveNetworkConnectionsxxx > 0;
}

- (void)js_endedNetworkActivity
{
    atomic_fetch_sub(&numberOfActiveNetworkConnectionsxxx,1);
    self.networkActivityIndicatorVisible = numberOfActiveNetworkConnectionsxxx > 0;
}


@end
