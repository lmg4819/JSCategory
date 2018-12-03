//
//  NSData+JSCategory.h
//  TestProject
//
//  Created by lmg on 2018/11/29.
//  Copyright © 2018 lmg. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSData (JSCategory)

#pragma mark -Hash

- (NSString *)js_md5String;
- (NSData *)js_md5Data;

- (NSString *)js_sha1String;
- (NSData *)js_sha1Data;

- (NSString *)js_sha256String;
- (NSData *)js_sha256Data;

- (NSString *)js_sha512String;
- (NSData *)js_sha512Data;

- (NSString *)js_hmacMD5StringWithKey:(NSString *)key;
- (NSData *)js_hmacMD5DataWithKey:(NSData *)key;

- (NSString *)js_hmacSHA1StringWithKey:(NSString *)key;
- (NSData *)js_hmacSHA1DataWithKey:(NSData *)key;

- (NSString *)js_hmacSHA256StringWithKey:(NSString *)key;
- (NSData *)js_hmacSHA256DataWithKey:(NSData *)key;


- (NSString *)js_hmacSHA512StringWithKey:(NSString *)key;
- (NSData *)js_hmacSHA512DataWithKey:(NSData *)key;

- (NSString *)js_crc32String;
- (uint32_t)js_crc32;

#pragma mark - Encrypt and Decrypt

/**
 Returns an encrypted NSData using AES.
 */
- (nullable NSData *)js_aes256EncryptWithKey:(NSData *)key iv:(nullable NSData *)iv;

/**
 Returns an decrypted NSData using AES.
 */
- (nullable NSData *)js_aes256DecryptWithkey:(NSData *)key iv:(nullable NSData *)iv;

#pragma mark - Encode and decode

/**
 Returns string decoded in UTF8.
 */
- (nullable NSString *)js_utf8String;

/**
Returns a uppercase NSString in HEX.
 */
- (nullable NSString *)js_hexString;

/**
Returns an NSData from hex string.
 */
+ (nullable NSData *)js_dataWithHexString:(NSString *)hexString;

/**
 Returns an NSString for base64 encoded.
 */
- (nullable NSString *)js_base64EncodedString;

/**
Returns an NSData from base64 encoded string.
 */
+ (nullable NSData *)js_dataWithBase64EncodedString:(NSString *)base64EncodedString;

/**
 Returns an NSDictionary or NSArray for decoded self.
 Returns nil if an error occurs.
 */
- (nullable id)js_jsonValueDecoded;

#pragma mark - Inflate and deflate

/**
Comperss data to gzip in default compresssion level.
 */
- (nullable NSData *)js_gzipInflate;

/**
Comperss data to gzip in default compresssion level.
 */
- (nullable NSData *)js_gzipDeflate;

/**
 Decompress data from zlib-compressed data.
 */
- (nullable NSData *)js_zlibInflate;

/**
Comperss data to zlib-compressed in default compresssion level.
 */
- (nullable NSData *)js_zlibDeflate;

@end

NS_ASSUME_NONNULL_END
