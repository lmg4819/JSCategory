//
//  UIView+JSCategory.m
//  TestProject
//
//  Created by lmg on 2018/11/30.
//  Copyright © 2018 lmg. All rights reserved.
//

#import "UIView+JSCategory.h"
#import <objc/runtime.h>


static char js_kActionHandlerTapBlockKey;
static char js_kActionHandlerTapGestureKey;
static char js_kActionHandlerLongPressBlockKey;
static char js_kActionHandlerLongPressGestureKey;

@implementation UIView (JSCategory)

- (CGFloat)js_left {
    return self.frame.origin.x;
}

- (void)setJs_left:(CGFloat)js_left
{
    CGRect frame = self.frame;
    frame.origin.x = js_left;
    self.frame = frame;
}


- (CGFloat)js_top {
    return self.frame.origin.y;
}

- (void)setJs_top:(CGFloat)js_top {
    CGRect frame = self.frame;
    frame.origin.y = js_top;
    self.frame = frame;
}

- (CGFloat)js_right {
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setJs_right:(CGFloat)js_right
{
    CGRect frame = self.frame;
    frame.origin.x = js_right - frame.size.width;
    self.frame = frame;
}

- (CGFloat)js_bottom {
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setJs_bottom:(CGFloat)js_bottom
{
    CGRect frame = self.frame;
    frame.origin.y = js_bottom - frame.size.height;
    self.frame = frame;
}

- (CGFloat)js_width {
    return self.frame.size.width;
}

- (void)setJs_width:(CGFloat)js_width
{
    CGRect frame = self.frame;
    frame.size.width = js_width;
    self.frame = frame;
}

- (CGFloat)js_height {
    return self.frame.size.height;
}

- (void)setJs_height:(CGFloat)js_height
{
    CGRect frame = self.frame;
    frame.size.height = js_height;
    self.frame = frame;
}

- (CGFloat)js_centerX {
    return self.center.x;
}

-(void)setJs_centerX:(CGFloat)js_centerX
{
    self.center = CGPointMake(js_centerX, self.center.y);
}

- (CGFloat)js_centerY {
    return self.center.y;
}

-(void)setJs_centerY:(CGFloat)js_centerY
{
    self.center = CGPointMake(self.center.x, js_centerY);
}

- (CGPoint)js_origin {
    return self.frame.origin;
}

-(void)setJs_origin:(CGPoint)js_origin
{
    CGRect frame = self.frame;
    frame.origin = js_origin;
    self.frame = frame;
}

- (CGSize)js_size {
    return self.frame.size;
}

-(void)setJs_size:(CGSize)js_size
{
    CGRect frame = self.frame;
    frame.size = js_size;
    self.frame = frame;
}

- (void)js_addTapActionWithBlock:(JSGestureActionBlock)block
{
    UITapGestureRecognizer *gesture = objc_getAssociatedObject(self, &js_kActionHandlerTapGestureKey);
    if (!gesture)
    {
        gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(js_handleActionForTapGesture:)];
        [self addGestureRecognizer:gesture];
        objc_setAssociatedObject(self, &js_kActionHandlerTapGestureKey, gesture, OBJC_ASSOCIATION_RETAIN);
    }
    objc_setAssociatedObject(self, &js_kActionHandlerTapBlockKey, block, OBJC_ASSOCIATION_COPY);
}
- (void)js_handleActionForTapGesture:(UITapGestureRecognizer*)gesture
{
    if (gesture.state == UIGestureRecognizerStateRecognized)
    {
        JSGestureActionBlock block = objc_getAssociatedObject(self, &js_kActionHandlerTapBlockKey);
        if (block)
        {
            block(gesture);
        }
    }
}
- (void)js_addLongPressActionWithBlock:(JSGestureActionBlock)block
{
    UILongPressGestureRecognizer *gesture = objc_getAssociatedObject(self, &js_kActionHandlerLongPressGestureKey);
    if (!gesture)
    {
        gesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(js_handleActionForLongPressGesture:)];
        [self addGestureRecognizer:gesture];
        objc_setAssociatedObject(self, &js_kActionHandlerLongPressGestureKey, gesture, OBJC_ASSOCIATION_RETAIN);
    }
    objc_setAssociatedObject(self, &js_kActionHandlerLongPressBlockKey, block, OBJC_ASSOCIATION_COPY);
}
- (void)js_handleActionForLongPressGesture:(UITapGestureRecognizer*)gesture
{
    if (gesture.state == UIGestureRecognizerStateRecognized)
    {
        JSGestureActionBlock block = objc_getAssociatedObject(self, &js_kActionHandlerLongPressBlockKey);
        if (block)
        {
            block(gesture);
        }
    }
}

- (void)js_removeAllSubviews {
    //[self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    while (self.subviews.count) {
        [self.subviews.lastObject removeFromSuperview];
    }
}

- (void)js_setLayerShadow:(UIColor*)color offset:(CGSize)offset radius:(CGFloat)radius {
    self.layer.shadowColor = color.CGColor;
    self.layer.shadowOffset = offset;
    self.layer.shadowRadius = radius;
    self.layer.shadowOpacity = 1;
    self.layer.shouldRasterize = YES;
    self.layer.rasterizationScale = [UIScreen mainScreen].scale;
}

- (UIViewController *)js_viewController {
    for (UIView *view = self; view; view = view.superview) {
        UIResponder *nextResponder = [view nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)nextResponder;
        }
    }
    return nil;
}

- (CGFloat)js_visibleAlpha {
    if ([self isKindOfClass:[UIWindow class]]) {
        if (self.hidden) return 0;
        return self.alpha;
    }
    if (!self.window) return 0;
    CGFloat alpha = 1;
    UIView *v = self;
    while (v) {
        if (v.hidden) {
            alpha = 0;
            break;
        }
        alpha *= v.alpha;
        v = v.superview;
    }
    return alpha;
}

- (CGPoint)js_convertPoint:(CGPoint)point toViewOrWindow:(UIView *)view {
    if (!view) {
        if ([self isKindOfClass:[UIWindow class]]) {
            return [((UIWindow *)self) convertPoint:point toWindow:nil];
        } else {
            return [self convertPoint:point toView:nil];
        }
    }
    
    UIWindow *from = [self isKindOfClass:[UIWindow class]] ? (id)self : self.window;
    UIWindow *to = [view isKindOfClass:[UIWindow class]] ? (id)view : view.window;
    if ((!from || !to) || (from == to)) return [self convertPoint:point toView:view];
    point = [self convertPoint:point toView:from];
    point = [to convertPoint:point fromWindow:from];
    point = [view convertPoint:point fromView:to];
    return point;
}

- (CGPoint)js_convertPoint:(CGPoint)point fromViewOrWindow:(UIView *)view {
    if (!view) {
        if ([self isKindOfClass:[UIWindow class]]) {
            return [((UIWindow *)self) convertPoint:point fromWindow:nil];
        } else {
            return [self convertPoint:point fromView:nil];
        }
    }
    
    UIWindow *from = [view isKindOfClass:[UIWindow class]] ? (id)view : view.window;
    UIWindow *to = [self isKindOfClass:[UIWindow class]] ? (id)self : self.window;
    if ((!from || !to) || (from == to)) return [self convertPoint:point fromView:view];
    point = [from convertPoint:point fromView:view];
    point = [to convertPoint:point fromWindow:from];
    point = [self convertPoint:point fromView:to];
    return point;
}

- (CGRect)js_convertRect:(CGRect)rect toViewOrWindow:(UIView *)view {
    if (!view) {
        if ([self isKindOfClass:[UIWindow class]]) {
            return [((UIWindow *)self) convertRect:rect toWindow:nil];
        } else {
            return [self convertRect:rect toView:nil];
        }
    }
    
    UIWindow *from = [self isKindOfClass:[UIWindow class]] ? (id)self : self.window;
    UIWindow *to = [view isKindOfClass:[UIWindow class]] ? (id)view : view.window;
    if (!from || !to) return [self convertRect:rect toView:view];
    if (from == to) return [self convertRect:rect toView:view];
    rect = [self convertRect:rect toView:from];
    rect = [to convertRect:rect fromWindow:from];
    rect = [view convertRect:rect fromView:to];
    return rect;
}

- (CGRect)js_convertRect:(CGRect)rect fromViewOrWindow:(UIView *)view {
    if (!view) {
        if ([self isKindOfClass:[UIWindow class]]) {
            return [((UIWindow *)self) convertRect:rect fromWindow:nil];
        } else {
            return [self convertRect:rect fromView:nil];
        }
    }
    
    UIWindow *from = [view isKindOfClass:[UIWindow class]] ? (id)view : view.window;
    UIWindow *to = [self isKindOfClass:[UIWindow class]] ? (id)self : self.window;
    if ((!from || !to) || (from == to)) return [self convertRect:rect fromView:view];
    rect = [from convertRect:rect fromView:view];
    rect = [to convertRect:rect fromWindow:from];
    rect = [self convertRect:rect fromView:to];
    return rect;
}


@end
