//
//  NSDateHelper.h
//
//  Created by Bob de Graaf on 22-02-11.
//  Copyright 2011 GraafICT. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (helper)

+(BOOL)checkDateValid:(NSDate *)date;
+(BOOL)checkDateIsToday:(NSDate *)date;
+(BOOL)checkDateIsTomorrow:(NSDate *)date;
+(BOOL)checkDateIsYesterday:(NSDate *)date;
+(BOOL)checkDateIsTheSameYear:(NSDate *)date;
+(BOOL)checkDateTenMinutesLater:(NSDate *)date;
+(BOOL)checkDateTwelveHoursLater:(NSDate *)date;
+(BOOL)checkDateIsDayAfterTomorrow:(NSDate *)date;
+(BOOL)checkDateIsDayBeforeYesterday:(NSDate *)date;
+(BOOL)checkDateIsTodayIncludingNight:(NSDate *)date;
+(BOOL)checkDateLaterThan:(int)seconds withDate:(NSDate *)date;
+(BOOL)checkDateIsTheSameDay:(NSDate *)date date2:(NSDate *)date2;
+(BOOL)date:(NSDate *)date isBetweenDate:(NSDate *)beginDate andDate:(NSDate *)endDate;

@end
