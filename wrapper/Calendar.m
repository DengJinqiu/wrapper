//
//  Calendar.m
//  wrapper
//
//  Created by Jinqiu Deng on 11/20/13.
//  Copyright (c) 2013 MusicKids. All rights reserved.
//

#import "Calendar.h"

@implementation Calendar

@synthesize currentDate = _currentDate;

- (NSDateComponents*) currentDate
{
    if (!_currentDate) {
        NSDate *today = [NSDate date];
        NSCalendar *gregorianCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
        _currentDate = [gregorianCalendar components:(kCFCalendarUnitYear | kCFCalendarUnitMonth |
                                              kCFCalendarUnitDay | kCFCalendarUnitWeekday)
                                    fromDate:today];
    }
    return _currentDate;
}

@end