//
//  UIScrollView+JSCategory.h
//  TestProject
//
//  Created by lmg on 2018/11/30.
//  Copyright © 2018 lmg. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIScrollView (JSCategory)

- (void)js_scrollToTop;

- (void)js_scrollToBottom;

- (void)js_scrollToLeft;

- (void)js_scrollToRight;

- (void)js_scrollToTopAnimated:(BOOL)animated;

- (void)js_scrollToBottomAnimated:(BOOL)animated;

- (void)js_scrollToLeftAnimated:(BOOL)animated;

- (void)js_scrollToRightAnimated:(BOOL)animated;


@end

NS_ASSUME_NONNULL_END
