//
//  NSKeyedUnarchiver+JSCategory.h
//  JSCategory
//
//  Created by lmg on 2018/12/3.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSKeyedUnarchiver (JSCategory)

+ (nullable id)js_unarchiveObjectWithData:(NSData *)data
                                exception:(NSException *_Nullable *_Nullable)exception;

+ (nullable id)js_unarchiveObjectWithFile:(NSString *)path
                                exception:(NSException *_Nullable *_Nullable)exception;
@end

NS_ASSUME_NONNULL_END
