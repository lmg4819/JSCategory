//
//  NSFileManager+JSCategory.m
//  TestProject
//
//  Created by lmg on 2018/11/30.
//  Copyright © 2018 lmg. All rights reserved.
//

#import "NSFileManager+JSCategory.h"

@implementation NSFileManager (JSCategory)

+ (NSURL *)js_URLForDirectory:(NSSearchPathDirectory)directory
{
    return [self.defaultManager URLsForDirectory:directory inDomains:NSUserDomainMask].lastObject;
}

+ (NSString *)js_pathForDirectory:(NSSearchPathDirectory)directory
{
    return NSSearchPathForDirectoriesInDomains(directory, NSUserDomainMask, YES)[0];
}

+ (NSURL *)js_documentsURL
{
    return [self js_URLForDirectory:NSDocumentDirectory];
}

+ (NSString *)js_documentsPath
{
    return [self js_pathForDirectory:NSDocumentDirectory];
}

+ (NSURL *)js_libraryURL
{
    return [self js_URLForDirectory:NSLibraryDirectory];
}

+ (NSString *)js_libraryPath
{
    return [self js_pathForDirectory:NSLibraryDirectory];
}

+ (NSURL *)js_cachesURL
{
    return [self js_URLForDirectory:NSCachesDirectory];
}

+ (NSString *)js_cachesPath
{
    return [self js_pathForDirectory:NSCachesDirectory];
}

+ (BOOL)js_addSkipBackupAttributeToFile:(NSString *)path
{
    return [[NSURL.alloc initFileURLWithPath:path] setResourceValue:@(YES) forKey:NSURLIsExcludedFromBackupKey error:nil];
}

+ (double)js_availableDiskSpace
{
    NSDictionary *attributes = [self.defaultManager attributesOfFileSystemForPath:self.js_documentsPath error:nil];
    
    return [attributes[NSFileSystemFreeSize] unsignedLongLongValue] / (double)0x100000;
}
@end
