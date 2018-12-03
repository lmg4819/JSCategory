//
//  CALayer+JSCategory.h
//  TestProject
//
//  Created by lmg on 2018/12/3.
//  Copyright © 2018 lmg. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CALayer (JSCategory)

- (void)js_setLayerShadow:(UIColor*)color offset:(CGSize)offset radius:(CGFloat)radius;

- (void)js_removeAllSublayers;

@property (nonatomic) CGFloat js_left;        ///< Shortcut for frame.origin.x.
@property (nonatomic) CGFloat js_top;         ///< Shortcut for frame.origin.y
@property (nonatomic) CGFloat js_right;       ///< Shortcut for frame.origin.x + frame.size.width
@property (nonatomic) CGFloat js_bottom;      ///< Shortcut for frame.origin.y + frame.size.height
@property (nonatomic) CGFloat js_width;       ///< Shortcut for frame.size.width.
@property (nonatomic) CGFloat js_height;      ///< Shortcut for frame.size.height.
@property (nonatomic) CGPoint js_center;      ///< Shortcut for center.
@property (nonatomic) CGFloat js_centerX;     ///< Shortcut for center.x
@property (nonatomic) CGFloat js_centerY;     ///< Shortcut for center.y
@property (nonatomic) CGPoint js_origin;      ///< Shortcut for frame.origin.
@property (nonatomic, getter=frameSize, setter=setFrameSize:) CGSize  js_size;///< Shortcut for frame.size.

@property (nonatomic) CGFloat js_transformRotation;     ///< key path "tranform.rotation"
@property (nonatomic) CGFloat js_transformRotationX;    ///< key path "tranform.rotation.x"
@property (nonatomic) CGFloat js_transformRotationY;    ///< key path "tranform.rotation.y"
@property (nonatomic) CGFloat js_transformRotationZ;    ///< key path "tranform.rotation.z"

@property (nonatomic) CGFloat js_transformScale;        ///< key path "tranform.scale"
@property (nonatomic) CGFloat js_transformScaleX;       ///< key path "tranform.scale.x"
@property (nonatomic) CGFloat js_transformScaleY;       ///< key path "tranform.scale.y"
@property (nonatomic) CGFloat js_transformScaleZ;       ///< key path "tranform.scale.z"

@property (nonatomic) CGFloat js_transformTranslationX; ///< key path "tranform.translation.x"
@property (nonatomic) CGFloat js_transformTranslationY; ///< key path "tranform.translation.y"
@property (nonatomic) CGFloat js_transformTranslationZ; ///< key path "tranform.translation.z"

- (void)js_addFadeAnimationWithDuration:(NSTimeInterval)duration curve:(UIViewAnimationCurve)curve;

- (void)js_removePreviousFadeAnimation;

@end

NS_ASSUME_NONNULL_END
