//
//  CALayer+JSCategory.m
//  TestProject
//
//  Created by lmg on 2018/12/3.
//  Copyright © 2018 lmg. All rights reserved.
//

#import "CALayer+JSCategory.h"

@implementation CALayer (JSCategory)

- (void)js_setLayerShadow:(UIColor*)color offset:(CGSize)offset radius:(CGFloat)radius {
    self.shadowColor = color.CGColor;
    self.shadowOffset = offset;
    self.shadowRadius = radius;
    self.shadowOpacity = 1;
    self.shouldRasterize = YES;
    self.rasterizationScale = [UIScreen mainScreen].scale;
}

- (void)js_removeAllSublayers {
    while (self.sublayers.count) {
        [self.sublayers.lastObject removeFromSuperlayer];
    }
}

- (CGFloat)js_left {
    return self.frame.origin.x;
}

- (void)setJs_left:(CGFloat)x
{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (CGFloat)js_top {
    return self.frame.origin.y;
}

- (void)setJs_top:(CGFloat)js_top
{
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

- (CGPoint)js_center {
    return CGPointMake(self.frame.origin.x + self.frame.size.width * 0.5,
                       self.frame.origin.y + self.frame.size.height * 0.5);
}

- (void)setJs_center:(CGPoint)js_center
{
    CGRect frame = self.frame;
    frame.origin.x = js_center.x - frame.size.width * 0.5;
    frame.origin.y = js_center.y - frame.size.height * 0.5;
    self.frame = frame;
}

- (CGFloat)js_centerX {
    return self.frame.origin.x + self.frame.size.width * 0.5;
}

- (void)setJs_centerX:(CGFloat)js_centerX
{
    CGRect frame = self.frame;
    frame.origin.x = js_centerX - frame.size.width * 0.5;
    self.frame = frame;
}

- (CGFloat)js_centerY {
    return self.frame.origin.y + self.frame.size.height * 0.5;
}

- (void)setJs_centerY:(CGFloat)js_centerY
{
    CGRect frame = self.frame;
    frame.origin.y = js_centerY - frame.size.height * 0.5;
    self.frame = frame;
}

- (CGPoint)js_origin {
    return self.frame.origin;
}

- (void)setJs_origin:(CGPoint)js_origin
{
    CGRect frame = self.frame;
    frame.origin = js_origin;
    self.frame = frame;
}

- (CGSize)frameSize {
    return self.frame.size;
}

- (void)setFrameSize:(CGSize)size {
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

- (CGFloat)js_transformRotation {
    NSNumber *v = [self valueForKeyPath:@"transform.rotation"];
    return v.doubleValue;
}

- (void)setJs_transformRotation:(CGFloat)js_transformRotation
{
    [self setValue:@(js_transformRotation) forKeyPath:@"transform.rotation"];
}

- (CGFloat)js_transformRotationX {
    NSNumber *v = [self valueForKeyPath:@"transform.rotation.x"];
    return v.doubleValue;
}

- (void)setJs_transformRotationX:(CGFloat)js_transformRotationX
{
    [self setValue:@(js_transformRotationX) forKeyPath:@"transform.rotation.x"];
}

- (CGFloat)js_transformRotationY {
    NSNumber *v = [self valueForKeyPath:@"transform.rotation.y"];
    return v.doubleValue;
}

- (void)setJs_transformRotationY:(CGFloat)js_transformRotationY
{
    [self setValue:@(js_transformRotationY) forKeyPath:@"transform.rotation.y"];
}

- (CGFloat)js_transformRotationZ {
    NSNumber *v = [self valueForKeyPath:@"transform.rotation.z"];
    return v.doubleValue;
}

- (void)setJs_transformRotationZ:(CGFloat)js_transformRotationZ
{
    [self setValue:@(js_transformRotationZ) forKeyPath:@"transform.rotation.z"];
}

- (CGFloat)js_transformScale {
    NSNumber *v = [self valueForKeyPath:@"transform.scale"];
    return v.doubleValue;
}

- (void)setJs_transformScale:(CGFloat)js_transformScale
{
    [self setValue:@(js_transformScale) forKeyPath:@"transform.scale"];
}

- (CGFloat)js_transformScaleX {
    NSNumber *v = [self valueForKeyPath:@"transform.scale.x"];
    return v.doubleValue;
}

- (void)setJs_transformScaleX:(CGFloat)js_transformScaleX
{
    [self setValue:@(js_transformScaleX) forKeyPath:@"transform.scale.x"];
}

- (CGFloat)js_transformScaleY {
    NSNumber *v = [self valueForKeyPath:@"transform.scale.y"];
    return v.doubleValue;
}

- (void)setJs_transformScaleY:(CGFloat)js_transformScaleY
{
    [self setValue:@(js_transformScaleY) forKeyPath:@"transform.scale.y"];
}

- (CGFloat)js_transformScaleZ {
    NSNumber *v = [self valueForKeyPath:@"transform.scale.z"];
    return v.doubleValue;
}

- (void)setJs_transformScaleZ:(CGFloat)js_transformScaleZ
{
    [self setValue:@(js_transformScaleZ) forKeyPath:@"transform.scale.z"];
}

- (CGFloat)js_transformTranslationX {
    NSNumber *v = [self valueForKeyPath:@"transform.translation.x"];
    return v.doubleValue;
}

- (void)setJs_transformTranslationX:(CGFloat)js_transformTranslationX
{
    [self setValue:@(js_transformTranslationX) forKeyPath:@"transform.translation.x"];
}

- (CGFloat)js_transformTranslationY {
    NSNumber *v = [self valueForKeyPath:@"transform.translation.y"];
    return v.doubleValue;
}

-(void)setJs_transformTranslationY:(CGFloat)js_transformTranslationY
{
    [self setValue:@(js_transformTranslationY) forKeyPath:@"transform.translation.y"];
}

- (CGFloat)js_transformTranslationZ {
    NSNumber *v = [self valueForKeyPath:@"transform.translation.z"];
    return v.doubleValue;
}

- (void)setJs_transformTranslationZ:(CGFloat)js_transformTranslationZ
{
    [self setValue:@(js_transformTranslationZ) forKeyPath:@"transform.translation.z"];
}

- (void)js_addFadeAnimationWithDuration:(NSTimeInterval)duration curve:(UIViewAnimationCurve)curve {
    if (duration <= 0) return;
    
    NSString *mediaFunction;
    switch (curve) {
        case UIViewAnimationCurveEaseInOut: {
            mediaFunction = kCAMediaTimingFunctionEaseInEaseOut;
        } break;
        case UIViewAnimationCurveEaseIn: {
            mediaFunction = kCAMediaTimingFunctionEaseIn;
        } break;
        case UIViewAnimationCurveEaseOut: {
            mediaFunction = kCAMediaTimingFunctionEaseOut;
        } break;
        case UIViewAnimationCurveLinear: {
            mediaFunction = kCAMediaTimingFunctionLinear;
        } break;
        default: {
            mediaFunction = kCAMediaTimingFunctionLinear;
        } break;
    }
    
    CATransition *transition = [CATransition animation];
    transition.duration = duration;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:mediaFunction];
    transition.type = kCATransitionFade;
    [self addAnimation:transition forKey:@"JSCategory.fade"];
}

- (void)js_removePreviousFadeAnimation {
    [self removeAnimationForKey:@"JSCategory.fade"];
}


@end
