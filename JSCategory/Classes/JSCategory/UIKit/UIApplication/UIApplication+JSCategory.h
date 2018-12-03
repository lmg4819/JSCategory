//
//  UIApplication+JSCategory.h
//  TestProject
//
//  Created by lmg on 2018/11/30.
//  Copyright © 2018 lmg. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIApplication (JSCategory)

- (void)js_beganNetworkActivity;

- (void)js_endedNetworkActivity;

@end

NS_ASSUME_NONNULL_END
