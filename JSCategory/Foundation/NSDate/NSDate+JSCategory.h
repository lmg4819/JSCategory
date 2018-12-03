//
//  NSDate+JSCategory.h
//  TestProject
//
//  Created by lmg on 2018/11/29.
//  Copyright © 2018 lmg. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDate (JSCategory)

@property (nonatomic, readonly) NSInteger js_year; ///< Year component
@property (nonatomic, readonly) NSInteger js_month; ///< Month component (1~12)
@property (nonatomic, readonly) NSInteger js_day; ///< Day component (1~31)
@property (nonatomic, readonly) NSInteger js_hour; ///< Hour component (0~23)
@property (nonatomic, readonly) NSInteger js_minute; ///< Minute component (0~59)
@property (nonatomic, readonly) NSInteger js_second; ///< Second component (0~59)
@property (nonatomic, readonly) NSInteger js_nanosecond; ///< Nanosecond component
@property (nonatomic, readonly) NSInteger js_weekday; ///< Weekday component (1~7, first day is based on user setting)
@property (nonatomic, readonly) NSInteger js_weekdayOrdinal; ///< WeekdayOrdinal component
@property (nonatomic, readonly) NSInteger js_weekOfMonth; ///< WeekOfMonth component (1~5)
@property (nonatomic, readonly) NSInteger js_weekOfYear; ///< WeekOfYear component (1~53)
@property (nonatomic, readonly) NSInteger js_yearForWeekOfYear; ///< YearForWeekOfYear component
@property (nonatomic, readonly) NSInteger js_quarter; ///< Quarter component
@property (nonatomic, readonly) BOOL js_isLeapMonth; ///< Weather the month is leap month
@property (nonatomic, readonly) BOOL js_isLeapYear; ///< Weather the year is leap year
@property (nonatomic, readonly) BOOL js_isToday; ///< Weather date is today (based on current locale)
@property (nonatomic, readonly) BOOL js_isYesterday; ///< Weather date is yesterday (based on current locale)


#pragma mark - Date modify

- (nullable NSDate *)js_dateByAddingYears:(NSInteger)years;

- (nullable NSDate *)js_dateByAddingMonths:(NSInteger)months;

- (nullable NSDate *)js_dateByAddingWeeks:(NSInteger)weeks;

- (nullable NSDate *)js_dateByAddingDays:(NSInteger)days;

- (nullable NSDate *)js_dateByAddingHours:(NSInteger)hours;

- (nullable NSDate *)js_dateByAddingMinutes:(NSInteger)minutes;

- (nullable NSDate *)js_dateByAddingSeconds:(NSInteger)seconds;

#pragma mark - Date Format

- (nullable NSString *)js_stringWithFormat:(NSString *)format;

+ (nullable NSDate *)js_dateWithString:(NSString *)dateString format:(NSString *)format;

#pragma mark -LunarCalendar

+ (NSCalendar *)js_chineseCalendar;
//例如 五月初一
+ (NSString*)js_currentMDDateString;
//例如 乙未年五月初一
+ (NSString*)js_currentYMDDateString;
//例如 星期一
+ (NSString *)js_currentWeek:(NSDate*)date;
//例如 五月一
+ (NSString*)js_currentCapitalDateString;

@end

NS_ASSUME_NONNULL_END
