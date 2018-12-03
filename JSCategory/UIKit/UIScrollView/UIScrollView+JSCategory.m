//
//  UIScrollView+JSCategory.m
//  TestProject
//
//  Created by lmg on 2018/11/30.
//  Copyright © 2018 lmg. All rights reserved.
//

#import "UIScrollView+JSCategory.h"

@implementation UIScrollView (JSCategory)

- (void)js_scrollToTop {
    [self js_scrollToTopAnimated:YES];
}

- (void)js_scrollToBottom {
    [self js_scrollToBottomAnimated:YES];
}

- (void)js_scrollToLeft {
    [self js_scrollToLeftAnimated:YES];
}

- (void)scrollToRight {
    [self js_scrollToRightAnimated:YES];
}

- (void)js_scrollToTopAnimated:(BOOL)animated {
    CGPoint off = self.contentOffset;
    off.y = 0 - self.contentInset.top;
    [self setContentOffset:off animated:animated];
}

- (void)js_scrollToBottomAnimated:(BOOL)animated {
    CGPoint off = self.contentOffset;
    off.y = self.contentSize.height - self.bounds.size.height + self.contentInset.bottom;
    [self setContentOffset:off animated:animated];
}

- (void)js_scrollToLeftAnimated:(BOOL)animated {
    CGPoint off = self.contentOffset;
    off.x = 0 - self.contentInset.left;
    [self setContentOffset:off animated:animated];
}

- (void)js_scrollToRightAnimated:(BOOL)animated {
    CGPoint off = self.contentOffset;
    off.x = self.contentSize.width - self.bounds.size.width + self.contentInset.right;
    [self setContentOffset:off animated:animated];
}


@end
