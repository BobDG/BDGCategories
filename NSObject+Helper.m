//
//  NSObject+Helper.m
//  TVGiDS.tv 1.0
//
//  Created by Bob de Graaf on 08-07-13.
//  Copyright (c) 2013 MobilePioneers. All rights reserved.
//

#import "NSObject+Helper.h"

@implementation NSObject (Helper)

-(void)setValuesForKeysWithDictionarySafely:(NSDictionary *)keyedValues
{
    [keyedValues enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop)
    {
        @try
        {
            if(obj != [NSNull null])
            {
                [self setValue:obj forKey:key];
            }
        }
        @catch(NSException * e)
        {
            NSLog(@"Error tried to put: '%@' in a key that didn't exist:%@", obj, key);
        }
    }];
}

@end
