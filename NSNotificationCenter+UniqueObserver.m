//
//  NSNotificationCenter+UniqueObserver.m
//  CalendarCube
//
//  Created by Bob de Graaf on 17-02-14.
//  Copyright (c) 2014 MobilePioneers. All rights reserved.
//

#import "NSNotificationCenter+UniqueObserver.h"

@implementation NSNotificationCenter (UniqueObserver)

-(void)addUniqueObserver:(id)observer selector:(SEL)selector name:(NSString *)name object:(id)object
{
    [[NSNotificationCenter defaultCenter] removeObserver:observer name:name object:object];
    [[NSNotificationCenter defaultCenter] addObserver:observer selector:selector name:name object:object];
}

@end