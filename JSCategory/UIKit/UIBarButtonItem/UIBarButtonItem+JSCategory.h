//
//  UIBarButtonItem+JSCategory.h
//  TestProject
//
//  Created by lmg on 2018/11/30.
//  Copyright © 2018 lmg. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIBarButtonItem (JSCategory)

/**
 The block that invoked when the item is selected. The objects captured by block
 will retained by the ButtonItem.
 */
@property (nullable, nonatomic, copy) void (^js_actionBlock)(id);

@end

NS_ASSUME_NONNULL_END
