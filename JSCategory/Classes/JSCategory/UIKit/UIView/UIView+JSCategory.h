//
//  UIView+JSCategory.h
//  TestProject
//
//  Created by lmg on 2018/11/30.
//  Copyright © 2018 lmg. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^JSGestureActionBlock)(UIGestureRecognizer *gestureRecoginzer);

@interface UIView (JSCategory)

#pragma mark -Frame
@property (nonatomic) CGFloat js_left;        ///< Shortcut for frame.origin.x.
@property (nonatomic) CGFloat js_top;         ///< Shortcut for frame.origin.y
@property (nonatomic) CGFloat js_right;       ///< Shortcut for frame.origin.x + frame.size.width
@property (nonatomic) CGFloat js_bottom;      ///< Shortcut for frame.origin.y + frame.size.height
@property (nonatomic) CGFloat js_width;       ///< Shortcut for frame.size.width.
@property (nonatomic) CGFloat js_height;      ///< Shortcut for frame.size.height.
@property (nonatomic) CGFloat js_centerX;     ///< Shortcut for center.x
@property (nonatomic) CGFloat js_centerY;     ///< Shortcut for center.y
@property (nonatomic) CGPoint js_origin;      ///< Shortcut for frame.origin.
@property (nonatomic) CGSize  js_size;        ///< Shortcut for frame.size.

- (void)js_removeAllSubviews;

- (void)js_setLayerShadow:(nullable UIColor*)color offset:(CGSize)offset radius:(CGFloat)radius;

/**
 Returns the view's view controller (may be nil).
 */
@property (nullable, nonatomic, readonly) UIViewController *js_viewController;

/**
 Returns the visible alpha on screen, taking into account superview and window.
 */
@property (nonatomic, readonly) CGFloat js_visibleAlpha;

- (CGPoint)js_convertPoint:(CGPoint)point toViewOrWindow:(nullable UIView *)view;

- (CGPoint)js_convertPoint:(CGPoint)point fromViewOrWindow:(nullable UIView *)view;

- (CGRect)js_convertRect:(CGRect)rect toViewOrWindow:(nullable UIView *)view;

- (CGRect)js_convertRect:(CGRect)rect fromViewOrWindow:(nullable UIView *)view;

#pragma mark -Gesture

- (void)js_addTapActionWithBlock:(JSGestureActionBlock)block;

- (void)js_addLongPressActionWithBlock:(JSGestureActionBlock)block;

@end

NS_ASSUME_NONNULL_END
