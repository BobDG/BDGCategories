//
//  NSObject+Helper.m
//
//  Created by Bob de Graaf on 01-02-14.
//  Copyright (c) 2014 GraafICT. All rights reserved.
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
