//
//  NSNumberFormatter+Helper.h
//  Pods
//
//  Created by Roy Derks on 09/11/2016.
//
//

#import <Foundation/Foundation.h>

@interface NSNumberFormatter (Helper)

+(NSNumberFormatter *)currentNumberFormatterWithNoDecimals;
+(NSNumberFormatter *)currentNumberFormatterWithDecimalStyle:(NSNumberFormatterStyle)style fractionDigits:(NSUInteger)fractionDigits;
+(NSNumberFormatter *)currentNumberFormatterWithDecimalStyle:(NSNumberFormatterStyle)style minimumFractionDigits:(NSUInteger)minimumFractionDigits maximumFractionDigits:(NSUInteger)maximumFractionDigits;
+(NSNumberFormatter *)currentNumberFormatterWithMinimumFractionDigits:minimumFractionDigits:(NSUInteger)minimumFractionDigits andMaximumFractionDigits:(NSUInteger)maximumFractionDigits;

@end
