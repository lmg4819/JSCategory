//
//  UIScreen+JSCategory.h
//  TestProject
//
//  Created by lmg on 2018/11/30.
//  Copyright © 2018 lmg. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIScreen (JSCategory)

+ (CGFloat)js_screenScale;

- (CGRect)js_currentBounds NS_EXTENSION_UNAVAILABLE_IOS("");

- (CGRect)js_boundsForOrientation:(UIInterfaceOrientation)orientation;

@property (nonatomic, readonly) CGSize js_sizeInPixel;



@end

NS_ASSUME_NONNULL_END
