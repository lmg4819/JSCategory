//
//  NSNumber+JSCategory.h
//  TestProject
//
//  Created by lmg on 2018/11/29.
//  Copyright © 2018 lmg. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSNumber (JSCategory)

+ (nullable NSNumber *)js_numberWithString:(NSString *)string;

@end

NS_ASSUME_NONNULL_END
