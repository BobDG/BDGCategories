//
//  NSDateFormatter+Helper.h
//  TVGiDS.tv 1.0
//
//  Created by Bob de Graaf on 10-06-13.
//  Copyright (c) 2013 MobilePioneers. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDateFormatter (Helper)
{
    
}

+(NSDateFormatter *)currentDateFormatterWithFormat:(NSString*)format;
+(NSDateFormatter *)currentDateFormatterWithFormat:(NSString*)format timeZone:(NSTimeZone *)timeZone;

@end