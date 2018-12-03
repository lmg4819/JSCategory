//
//  NSString+JSCategory.h
//  TestProject
//
//  Created by lmg on 2018/11/29.
//  Copyright © 2018 lmg. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (JSCategory)

/**
 Returns a lowercase NSString for md5 hash.
 */
- (nullable NSString *)js_md5String;

/**
Returns a lowercase NSString for sha1 hash.
 */
- (nullable NSString *)js_sha1String;

/**
 Returns a lowercase NSString for sha256 hash.
 */
- (nullable NSString *)js_sha256String;

/**
 Returns a lowercase NSString for sha512 hash.
 */
- (nullable NSString *)js_sha512String;

/**
 Returns a lowercase NSString for hmac using algorithm md5 with key.
 @param key The hmac key.
 */
- (nullable NSString *)js_hmacMD5StringWithKey:(NSString *)key;

/**
 Returns a lowercase NSString for hmac using algorithm sha1 with key.
 @param key The hmac key.
 */
- (nullable NSString *)js_hmacSHA1StringWithKey:(NSString *)key;

/**
 Returns a lowercase NSString for hmac using algorithm sha256 with key.
 @param key The hmac key.
 */
- (nullable NSString *)js_hmacSHA256StringWithKey:(NSString *)key;

/**
 Returns a lowercase NSString for hmac using algorithm sha512 with key.
 @param key The hmac key.
 */
- (nullable NSString *)js_hmacSHA512StringWithKey:(NSString *)key;

#pragma mark -size

- (CGFloat)js_heightWithFont:(UIFont *)font constrainedToWidth:(CGFloat)width;

- (CGFloat)js_widthWithFont:(UIFont *)font constrainedToHeight:(CGFloat)height;

- (CGSize)js_sizeWithFont:(UIFont *)font constrainedToWidth:(CGFloat)width;

- (CGSize)js_sizeWithFont:(UIFont *)font constrainedToHeight:(CGFloat)height;

+ (NSString *)js_reverseString:(NSString *)strSrc;


#pragma mark - Encode and decode

- (nullable NSString *)js_base64EncodedString;

+ (nullable NSString *)js_stringWithBase64EncodedString:(NSString *)base64EncodedString;

- (NSString *)js_stringByURLEncode;

- (NSString *)js_stringByURLDecode;

- (NSString *)js_stringByEscapingHTML;

#pragma mark - Regular Expression

- (BOOL)js_matchesRegex:(NSString *)regex options:(NSRegularExpressionOptions)options;

- (void)js_enumerateRegexMatches:(NSString *)regex
                      options:(NSRegularExpressionOptions)options
                   usingBlock:(void (^)(NSString *match, NSRange matchRange, BOOL *stop))block;

- (NSString *)js_stringByReplacingRegex:(NSString *)regex
                             options:(NSRegularExpressionOptions)options
                          withString:(NSString *)replacement;

+ (NSString *)js_stringWithUUID;

- (NSString *)js_stringByTrim;

- (BOOL)js_isNotBlank;

- (BOOL)js_containsString:(NSString *)string;

- (NSNumber *)js_numberValue;

- (NSData *)js_dataValue;

- (NSRange)js_rangeOfAll;

- (id)js_jsonValueDecoded;


@end

NS_ASSUME_NONNULL_END
