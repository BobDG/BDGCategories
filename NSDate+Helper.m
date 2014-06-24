//
//  NSDateHelper.m
//
//  Created by Bob de Graaf on 22-02-11.
//  Copyright 2011 GraafICT. All rights reserved.
//

#import "NSDate+Helper.h"

@implementation NSDate (helper)

+(BOOL)checkDateIsDayBeforeYesterday:(NSDate *)date
{
	NSDateComponents *otherDay = [[NSCalendar currentCalendar] components:NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit fromDate:date];
	NSDateComponents *tomorrow = [[NSCalendar currentCalendar] components:NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit fromDate:[[NSDate date] dateByAddingTimeInterval:-2*86400]];
	if([tomorrow day] == [otherDay day] && [tomorrow month] == [otherDay month] && [tomorrow year] == [otherDay year])
	{
		return true;
	}
	return false;
}

+(BOOL)checkDateIsYesterday:(NSDate *)date
{
	NSDateComponents *otherDay = [[NSCalendar currentCalendar] components:NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit fromDate:date];
	NSDateComponents *tomorrow = [[NSCalendar currentCalendar] components:NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit fromDate:[[NSDate date] dateByAddingTimeInterval:-86400]];
	if([tomorrow day] == [otherDay day] && [tomorrow month] == [otherDay month] && [tomorrow year] == [otherDay year])
	{
		return true;
	}
	return false;
}

+(BOOL)checkDateIsToday:(NSDate *)date
{
	NSDateComponents *otherDay = [[NSCalendar currentCalendar] components:NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit fromDate:date];
	NSDateComponents *today = [[NSCalendar currentCalendar] components:NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit fromDate:[NSDate date]];
	if([today day] == [otherDay day] && [today month] == [otherDay month] && [today year] == [otherDay year]) 
	{
		return true;
	}
	return false;
}

+(BOOL)checkDateIsTheSameDay:(NSDate *)date date2:(NSDate *)date2
{
    NSDateComponents *date1Comps = [[NSCalendar currentCalendar] components:NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit fromDate:date];
	NSDateComponents *date2Comps = [[NSCalendar currentCalendar] components:NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit fromDate:date2];
	if([date1Comps day] == [date2Comps day] && [date1Comps month] == [date2Comps month] && [date1Comps year] == [date2Comps year])
	{
		return true;
	}
	return false;
}

+(BOOL)checkDateIsTheSameYear:(NSDate *)date
{
    NSDateComponents *otherDay = [[NSCalendar currentCalendar] components:NSYearCalendarUnit fromDate:date];
	NSDateComponents *today = [[NSCalendar currentCalendar] components:NSYearCalendarUnit fromDate:[NSDate date]];
	if([today year] == [otherDay year]) {
		return true;
	}
	return false;
}

+(BOOL)checkDateIsTodayIncludingNight:(NSDate *)date
{
    date = [date dateByAddingTimeInterval:-(6*86400)];
	NSDateComponents *otherDay = [[NSCalendar currentCalendar] components:NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit fromDate:date];
	NSDateComponents *today = [[NSCalendar currentCalendar] components:NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit fromDate:[NSDate date]];
	if([today day] == [otherDay day] && [today month] == [otherDay month] && [today year] == [otherDay year])
	{
		return true;
	}
	return false;
}

+(BOOL)checkDateIsTomorrow:(NSDate *)date
{
	NSDateComponents *otherDay = [[NSCalendar currentCalendar] components:NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit fromDate:date];
	NSDateComponents *tomorrow = [[NSCalendar currentCalendar] components:NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit fromDate:[[NSDate date] dateByAddingTimeInterval:86400]];
	if([tomorrow day] == [otherDay day] && [tomorrow month] == [otherDay month] && [tomorrow year] == [otherDay year])
	{
		return true;
	}
	return false;
}

+(BOOL)checkDateIsDayAfterTomorrow:(NSDate *)date
{
	NSDateComponents *otherDay = [[NSCalendar currentCalendar] components:NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit fromDate:date];
	NSDateComponents *tomorrow = [[NSCalendar currentCalendar] components:NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit fromDate:[[NSDate date] dateByAddingTimeInterval:2*86400]];
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
        NSDateComponents *otherDay = [[NSCalendar currentCalendar] components:NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit fromDate:date];
        NSDateComponents *today = [[NSCalendar currentCalendar] components:NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit fromDate:[NSDate date]];
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

@end
