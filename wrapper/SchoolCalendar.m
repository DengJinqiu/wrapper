//
//  SchoolCalendar.m
//  wrapper
//
//  Created by Jinqiu Deng on 11/20/13.
//  Copyright (c) 2013 MusicKids. All rights reserved.
//

#import "SchoolCalendar.h"

@interface SchoolCalendar ()

@property (strong, nonatomic, readwrite) NSCalendar *calendar;

@end

@implementation SchoolCalendar

static SchoolCalendar* _schedule;

+ (SchoolCalendar*)getInstance
{
    if (!_schedule) {
        _schedule = [[SchoolCalendar alloc] init];
    }
    return _schedule;
}

- (NSDateComponents*) currentDate
{
    NSDate *today = [NSDate date];
        
    NSDateComponents *currentDate =
    [self.calendar components:(kCFCalendarUnitYear | kCFCalendarUnitMonth |
                               kCFCalendarUnitDay | kCFCalendarUnitWeekday)
                     fromDate:today];
    return currentDate;
}

- (NSDateComponents*)year:(NSInteger)year month:(NSInteger)month day:(NSInteger)day
{
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    [comps setDay:day];
    [comps setMonth:month];
    [comps setYear:year];
    NSDate *date = [self.calendar dateFromComponents:comps];
    
    NSDateComponents *currentDate =
    [self.calendar components:(kCFCalendarUnitYear | kCFCalendarUnitMonth |
                               kCFCalendarUnitDay | kCFCalendarUnitWeekday)
                     fromDate:date];
    return currentDate;
}

- (NSCalendar*)calendar
{
    if (!_calendar) {
        _calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    }
    return _calendar;
}

@end