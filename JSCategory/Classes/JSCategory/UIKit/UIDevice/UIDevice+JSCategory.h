//
//  UIDevice+JSCategory.h
//  TestProject
//
//  Created by lmg on 2018/11/30.
//  Copyright © 2018 lmg. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIDevice (JSCategory)

/// Device system version (e.g. 8.1)
+ (double)js_systemVersion;

/// Whether the device is iPad/iPad mini.
@property (nonatomic, readonly) BOOL js_isPad;

/// Whether the device is a simulator.
@property (nonatomic, readonly) BOOL js_isSimulator;

/// Whether the device is jailbroken.
@property (nonatomic, readonly) BOOL js_isJailbroken;

/// Wherher the device can make phone calls.
@property (nonatomic, readonly) BOOL js_canMakePhoneCalls NS_EXTENSION_UNAVAILABLE_IOS("");

/// The device's machine model.  e.g. "iPhone6,1" "iPad4,6"
/// @see http://theiphonewiki.com/wiki/Models
@property (nullable, nonatomic, readonly) NSString *js_machineModel;

/// The device's machine model name. e.g. "iPhone 5s" "iPad mini 2"
/// @see http://theiphonewiki.com/wiki/Models
@property (nullable, nonatomic, readonly) NSString *js_machineModelName;

#pragma mark - Disk Space

/// Total disk space in byte. (-1 when error occurs)
@property (nonatomic, readonly) int64_t js_diskSpace;

/// Free disk space in byte. (-1 when error occurs)
@property (nonatomic, readonly) int64_t js_diskSpaceFree;

/// Used disk space in byte. (-1 when error occurs)
@property (nonatomic, readonly) int64_t js_diskSpaceUsed;

@end

NS_ASSUME_NONNULL_END

#ifndef kSystemVersion
#define kSystemVersion [UIDevice js_systemVersion]
#endif

#ifndef kiOS6Later
#define kiOS6Later (kSystemVersion >= 6)
#endif

#ifndef kiOS7Later
#define kiOS7Later (kSystemVersion >= 7)
#endif

#ifndef kiOS8Later
#define kiOS8Later (kSystemVersion >= 8)
#endif

#ifndef kiOS9Later
#define kiOS9Later (kSystemVersion >= 9)
#endif
