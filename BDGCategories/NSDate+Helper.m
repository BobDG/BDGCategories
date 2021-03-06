//
//  NSDateHelper.m
//
//  Created by Bob de Graaf on 01-02-14.
//  Copyright (c) 2014 GraafICT. All rights reserved.
//

#import "NSDate+Helper.h"

@implementation NSDate (helper)

-(NSDate *)dateByAddingDays:(NSInteger)days
{
    NSDateComponents *components = [NSDateComponents new];
    components.day = days;
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    return [calendar dateByAddingComponents:components toDate:self options:0];
}

-(NSDate *)dateByAddingYears:(NSInteger)years
{
    NSDateComponents *components = [NSDateComponents new];
    components.year = years;
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    return [calendar dateByAddingComponents:components toDate:self options:0];
}

-(NSDate *)dateByAddingMonths:(NSInteger)months
{
    NSDateComponents *components = [NSDateComponents new];
    components.month = months;
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    return [calendar dateByAddingComponents:components toDate:self options:0];
}

-(NSDate *)normalizedDate
{
    NSDateComponents *normalizedCurrentDateComponents = [[NSCalendar currentCalendar] components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay fromDate:self];
    return [[NSCalendar currentCalendar] dateFromComponents:normalizedCurrentDateComponents];
}

-(NSInteger)numberOfDaysUntilEndDate:(NSDate *)endDate
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:NSCalendarUnitDay fromDate:self toDate:endDate options:0];
    return [components day];
}

-(NSInteger)numberOfMonthsUntilEndDate:(NSDate *)endDate
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:NSCalendarUnitMonth fromDate:self toDate:endDate options:0];
    return [components month];
}

-(NSInteger)numberOfYearsUntilEndDate:(NSDate *)endDate
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:NSCalendarUnitYear fromDate:self toDate:endDate options:0];
    return [components year];
}

+(BOOL)checkDateIsDayBeforeYesterday:(NSDate *)date
{
	NSDateComponents *otherDay = [[NSCalendar currentCalendar] components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay fromDate:date];
	NSDateComponents *tomorrow = [[NSCalendar currentCalendar] components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay fromDate:[[NSDate date] dateByAddingTimeInterval:-2*86400]];
	if([tomorrow day] == [otherDay day] && [tomorrow month] == [otherDay month] && [tomorrow year] == [otherDay year])
	{
		return true;
	}
	return false;
}

+(BOOL)checkDateIsYesterday:(NSDate *)date
{
	NSDateComponents *otherDay = [[NSCalendar currentCalendar] components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay fromDate:date];
	NSDateComponents *tomorrow = [[NSCalendar currentCalendar] components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay fromDate:[[NSDate date] dateByAddingTimeInterval:-86400]];
	if([tomorrow day] == [otherDay day] && [tomorrow month] == [otherDay month] && [tomorrow year] == [otherDay year])
	{
		return true;
	}
	return false;
}

+(BOOL)checkDateIsToday:(NSDate *)date
{
	NSDateComponents *otherDay = [[NSCalendar currentCalendar] components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay fromDate:date];
	NSDateComponents *today = [[NSCalendar currentCalendar] components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay fromDate:[NSDate date]];
	if([today day] == [otherDay day] && [today month] == [otherDay month] && [today year] == [otherDay year]) 
	{
		return true;
	}
	return false;
}

+(BOOL)checkDateIsTheSameDay:(NSDate *)date date2:(NSDate *)date2
{
    NSDateComponents *date1Comps = [[NSCalendar currentCalendar] components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay fromDate:date];
	NSDateComponents *date2Comps = [[NSCalendar currentCalendar] components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay fromDate:date2];
	if([date1Comps day] == [date2Comps day] && [date1Comps month] == [date2Comps month] && [date1Comps year] == [date2Comps year])
	{
		return true;
	}
	return false;
}

+(BOOL)checkDateIsTheSameYear:(NSDate *)date
{
    NSDateComponents *otherDay = [[NSCalendar currentCalendar] components:NSCalendarUnitYear fromDate:date];
	NSDateComponents *today = [[NSCalendar currentCalendar] components:NSCalendarUnitYear fromDate:[NSDate date]];
	if([today year] == [otherDay year]) {
		return true;
	}
	return false;
}

+(BOOL)checkDateIsTodayIncludingNight:(NSDate *)date
{
    date = [date dateByAddingTimeInterval:-(6*86400)];
	NSDateComponents *otherDay = [[NSCalendar currentCalendar] components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay fromDate:date];
	NSDateComponents *today = [[NSCalendar currentCalendar] components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay fromDate:[NSDate date]];
	if([today day] == [otherDay day] && [today month] == [otherDay month] && [today year] == [otherDay year])
	{
		return true;
	}
	return false;
}

+(BOOL)checkDateIsTomorrow:(NSDate *)date
{
	NSDateComponents *otherDay = [[NSCalendar currentCalendar] components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay fromDate:date];
	NSDateComponents *tomorrow = [[NSCalendar currentCalendar] components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay fromDate:[[NSDate date] dateByAddingTimeInterval:86400]];
	if([tomorrow day] == [otherDay day] && [tomorrow month] == [otherDay month] && [tomorrow year] == [otherDay year])
	{
		return true;
	}
	return false;
}

+(BOOL)checkDateIsDayAfterTomorrow:(NSDate *)date
{
	NSDateComponents *otherDay = [[NSCalendar currentCalendar] components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay fromDate:date];
	NSDateComponents *tomorrow = [[NSCalendar currentCalendar] components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay fromDate:[[NSDate date] dateByAddingTimeInterval:2*86400]];
	if([tomorrow day] == [otherDay day] && [tomorrow month] == [otherDay month] && [tomorrow year] == [otherDay year])
	{
		return true;
	}
	return false;
}

+(BOOL)checkDateValid:(NSDate *)date
{
    //first check simply if the today is earlier
    NSDate *today = [NSDate date];
    
    if([today compare:date] == NSOrderedAscending)
    {
        //earlier!        
        return TRUE;
    }
    else
    {
        //later
        NSDateComponents *otherDay = [[NSCalendar currentCalendar] components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay fromDate:date];
        NSDateComponents *today = [[NSCalendar currentCalendar] components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay fromDate:[NSDate date]];
        if([today day] == [otherDay day] && [today month] == [otherDay month] && [today year] == [otherDay year]) 
        {
            //NSLog(@"Still valid, only seconds matter!");
            return true;
        }        
    }    
    return FALSE;
}

+(BOOL)checkDateTenMinutesLater:(NSDate *)date
{       
    double now = [[NSDate date] timeIntervalSince1970];
    double prev = [date timeIntervalSince1970];    
    if((now-prev)>600)
    {
        return true;
    }
    return false;    
}

+(BOOL)checkDateTwelveHoursLater:(NSDate *)date
{       
    double now = [[NSDate date] timeIntervalSince1970];
    double prev = [date timeIntervalSince1970];    
    if((now-prev)>43200)
    {
        return true;
    }    
    return false;    
}

+(BOOL)checkDateLaterThan:(int)seconds withDate:(NSDate *)date
{
    int now = [[NSDate date] timeIntervalSince1970];
    int prev = [date timeIntervalSince1970];
    if((now-prev)>seconds)
    {        
        return true;
    }    
    return false;
}

+(BOOL)date:(NSDate *)date isBetweenDate:(NSDate *)beginDate andDate:(NSDate *)endDate
{
    if([date compare:beginDate] == NSOrderedAscending)
    	return NO;
    
    if([date compare:endDate] == NSOrderedDescending)
    	return NO;
    
    return YES;
}

#pragma mark - Time based checks

-(NSDate *)setTimeFromDate:(NSDate *)date
{
    //Simply update the 'self' date with the hour/minute from a given date
    NSDateComponents *dateComps = [[NSCalendar currentCalendar] components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay fromDate:self];
    NSDateComponents *dateTimeComps = [[NSCalendar currentCalendar] components:NSCalendarUnitHour|NSCalendarUnitMinute fromDate:date];
    dateComps.hour = dateTimeComps.hour;
    dateComps.minute = dateTimeComps.minute;
    dateComps.second = 0;
    return [[NSCalendar currentCalendar] dateFromComponents:dateComps];
}

+(BOOL)checkTimeIsLaterThanNow:(NSDate *)date
{
    NSDateComponents *todayComps = [[NSCalendar currentCalendar] components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay fromDate:[NSDate date]];
    
    NSDateComponents *dateTimeComps = [[NSCalendar currentCalendar] components:NSCalendarUnitHour|NSCalendarUnitMinute fromDate:date];
    todayComps.hour = dateTimeComps.hour;
    todayComps.minute = dateTimeComps.minute;
    todayComps.second = 0;
    NSDate *todayWithUpdatedTime = [[NSCalendar currentCalendar] dateFromComponents:todayComps];
    
    double date1Unix = [todayWithUpdatedTime timeIntervalSince1970];
    double date2Unix = [[NSDate date] timeIntervalSince1970];
    if(date1Unix > date2Unix) {
        return TRUE;
    }
    return FALSE;
}

+(BOOL)checkTimeIsEarlierThanNow:(NSDate *)date
{
    return ![self checkTimeIsLaterThanNow:date];
}

+(BOOL)checkTimeIsLater:(NSDate *)date1 thanTime:(NSDate *)date2
{
    NSDateComponents *todayComps1 = [[NSCalendar currentCalendar] components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay fromDate:[NSDate date]];
    NSDateComponents *todayComps2 = [[NSCalendar currentCalendar] components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay fromDate:[NSDate date]];
    
    NSDateComponents *date1TimeComps = [[NSCalendar currentCalendar] components:NSCalendarUnitHour|NSCalendarUnitMinute fromDate:date1];
    todayComps1.hour = date1TimeComps.hour;
    todayComps1.minute = date1TimeComps.minute;
    todayComps1.second = 0;
    
    NSDateComponents *date2TimeComps = [[NSCalendar currentCalendar] components:NSCalendarUnitHour|NSCalendarUnitMinute fromDate:date2];
    todayComps2.hour = date2TimeComps.hour;
    todayComps2.minute = date2TimeComps.minute;
    todayComps2.second = 0;
    
    NSDate *finalDate1 = [[NSCalendar currentCalendar] dateFromComponents:todayComps1];
    NSDate *finalDate2 = [[NSCalendar currentCalendar] dateFromComponents:todayComps2];
    double date1Unix = [finalDate1 timeIntervalSince1970];
    double date2Unix = [finalDate2 timeIntervalSince1970];
    
    if(date1Unix > date2Unix) {
        return TRUE;
    }
    return FALSE;
}

+(BOOL)checkTimeIsEarlier:(NSDate *)date1 thanTime:(NSDate *)date2
{
    return ![self checkTimeIsLater:date1 thanTime:date2];
}

@end
