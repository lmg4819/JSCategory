//
//  NSFileManager+JSCategory.h
//  TestProject
//
//  Created by lmg on 2018/11/30.
//  Copyright © 2018 lmg. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSFileManager (JSCategory)

+ (NSURL *)js_documentsURL;

+ (NSString *)js_documentsPath;

+ (NSURL *)js_libraryURL;

+ (NSString *)js_libraryPath;

+ (NSURL *)js_cachesURL;

+ (NSString *)js_cachesPath;

/**
 Adds a special filesystem flag to a file to avoid iCloud backup it.
 */
+ (BOOL)js_addSkipBackupAttributeToFile:(NSString *)path;

/**
 Get available disk space.
 */
+ (double)js_availableDiskSpace;

@end

NS_ASSUME_NONNULL_END
