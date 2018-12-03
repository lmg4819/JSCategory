//
//  UIImage+JSCategory.h
//  TestProject
//
//  Created by lmg on 2018/11/30.
//  Copyright © 2018 lmg. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (JSCategory)

- (BOOL)js_hasAlphaChannel;

+ (nullable UIImage *)js_imageWithColor:(UIColor *)color;

+ (nullable UIImage *)js_imageWithColor:(UIColor *)color size:(CGSize)size;

- (void)js_drawInRect:(CGRect)rect withContentMode:(UIViewContentMode)contentMode clipsToBounds:(BOOL)clips;

- (nullable UIImage *)js_imageByResizeToSize:(CGSize)size;

- (nullable UIImage *)js_imageByResizeToSize:(CGSize)size contentMode:(UIViewContentMode)contentMode;

- (nullable UIImage *)js_imageByCropToRect:(CGRect)rect;

- (nullable UIImage *)js_imageByInsetEdge:(UIEdgeInsets)insets withColor:(nullable UIColor *)color;

- (nullable UIImage *)js_imageByRoundCornerRadius:(CGFloat)radius;

- (nullable UIImage *)js_imageByRoundCornerRadius:(CGFloat)radius
                                   borderWidth:(CGFloat)borderWidth
                                   borderColor:(nullable UIColor *)borderColor;

- (nullable UIImage *)js_imageByRoundCornerRadius:(CGFloat)radius
                                       corners:(UIRectCorner)corners
                                   borderWidth:(CGFloat)borderWidth
                                   borderColor:(nullable UIColor *)borderColor
                                borderLineJoin:(CGLineJoin)borderLineJoin;

/**
 Returns a new rotated image (relative to the center).
 */
- (nullable UIImage *)js_imageByRotate:(CGFloat)radians fitSize:(BOOL)fitSize;

- (nullable UIImage *)js_imageByRotateLeft90;

- (nullable UIImage *)js_imageByRotateRight90;

- (nullable UIImage *)js_imageByRotate180;

- (nullable UIImage *)js_imageByFlipVertical;

- (nullable UIImage *)js_imageByFlipHorizontal;

#pragma mark - Image Effect

- (nullable UIImage *)js_imageByTintColor:(UIColor *)color;

- (nullable UIImage *)js_imageByBlurWithTint:(UIColor *)tintColor;

#pragma mark -Bundle

/**
 *  @brief  根据main bundle中的文件名读取图片
 *
 *  @param name 图片名
 *
 *  @return 无缓存的图片
 */
+ (UIImage *)js_imageWithFileName:(NSString *)name;
/**
 *  @author JKCategories
 *
 *  根据指定bundle中的文件名读取图片
 *
 *  @param name   图片名
 *  @param bundle bundle
 *
 *  @return 无缓存的图片
 */
+ (UIImage *)js_imageWithFileName:(NSString *)name inBundle:(NSBundle*)bundle;

#pragma mark -Merge
/**
 *  @brief  合并两个图片
 *
 *  @param firstImage  一个图片
 *  @param secondImage 二个图片
 *
 *  @return 合并后图片
 */
+ (UIImage*)js_mergeImage:(UIImage*)firstImage withImage:(UIImage*)secondImage;


@end

NS_ASSUME_NONNULL_END
