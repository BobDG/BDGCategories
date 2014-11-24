//
//  NSObject+Helper.m
//
//  Created by Bob de Graaf on 08-07-13.
//  Copyright (c) 2014 GraafICT. All rights reserved.
//

#import "NSObject+Helper.h"

@implementation NSObject (Helper)

-(id)initWithDictionarySafely:(NSDictionary *)dictionary
{
    self = [self init];
    if(self) {
        [self setValuesForKeysWithDictionarySafely:dictionary];
    }
    return self;
}

+(id)convertDictionaryToObject:(NSDictionary *)dictionary objectType:(Class)objectType
{
    id object = [[objectType alloc] initWithDictionarySafely:dictionary];
    return object;
}

+(NSMutableArray *)convertDictionaryToObjects:(NSArray *)dictionaries objectType:(Class)objectType
{
    NSMutableArray *returnArray = [[NSMutableArray alloc] init];
    for(NSDictionary *dictionary in dictionaries) {
        id object = [[objectType alloc] initWithDictionarySafely:dictionary];
        [returnArray addObject:object];
    }
    return returnArray;
}

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
