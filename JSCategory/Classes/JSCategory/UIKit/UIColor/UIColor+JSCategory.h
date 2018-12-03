//
//  UIColor+JSCategory.h
//  TestProject
//
//  Created by lmg on 2018/11/30.
//  Copyright © 2018 lmg. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (JSCategory)

@property (nonatomic, readonly) CGFloat js_alpha;

- (uint32_t)js_rgbValue;

- (uint32_t)js_rgbaValue;

/**
 Such as @"0066cc".
 */
- (nullable NSString *)js_hexString;

/**
Such as @"0066ccff".
 */
- (nullable NSString *)js_hexStringWithAlpha;

+ (UIColor *)js_colorWithRGB:(uint32_t)rgbValue;

+ (UIColor *)js_colorWithRGBA:(uint32_t)rgbaValue;

///值不需要除以255.0
+ (UIColor *)js_colorWithWholeRed:(CGFloat)red
                            green:(CGFloat)green
                             blue:(CGFloat)blue
                            alpha:(CGFloat)alpha;
///值不需要除以255.0
+ (UIColor *)js_colorWithWholeRed:(CGFloat)red
                            green:(CGFloat)green
                             blue:(CGFloat)blue;

/**
 rgbValue  The rgb value such as 0x66CCFF
 */
+ (UIColor *)js_colorWithRGB:(uint32_t)rgbValue alpha:(CGFloat)alpha;

/**
hexStr   @"0xF0F", @"66ccff", @"#66CCFF88"
 */
+ (nullable UIColor *)js_colorWithHexString:(NSString *)hexStr;

#pragma mark -#pragma mark - Gradient Color

/**
 *  @brief  渐变颜色
 *
 *  @param c1     开始颜色
 *  @param c2     结束颜色
 *  @param height 渐变高度
 *
 *  @return 渐变颜色
 */
+ (UIColor*)js_gradientFromColor:(UIColor*)c1 toColor:(UIColor*)c2 withHeight:(int)height;

@end

NS_ASSUME_NONNULL_END

#ifndef UIColorHex
#define UIColorHex(_hex_)   [UIColor js_colorWithHexString:((__bridge NSString *)CFSTR(#_hex_))]
#endif
