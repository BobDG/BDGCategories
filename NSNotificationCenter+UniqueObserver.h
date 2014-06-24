//
//  NSNotificationCenter+UniqueObserver.h
//  CalendarCube
//
//  Created by Bob de Graaf on 17-02-14.
//  Copyright (c) 2014 MobilePioneers. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSNotificationCenter (UniqueObserver)

-(void)addUniqueObserver:(id)observer selector:(SEL)selector name:(NSString *)name object:(id)object;

@end