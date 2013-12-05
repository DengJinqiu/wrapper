//
//  Calendar.m
//  wrapper
//
//  Created by Jinqiu Deng on 11/20/13.
//  Copyright (c) 2013 MusicKids. All rights reserved.
//

#import "Schedule.h"

@interface Schedule ()

@property (strong, nonatomic, readwrite) NSCalendar *calendar;

@end

@implementation Schedule

static Schedule* _schedule;

+ (Schedule*)getInstance
{
    if (!_schedule) {
        _schedule = [[Schedule alloc] init];
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

- (NSInteger)startYear
{
    return 2013;
}

- (NSInteger)endYear
{
    return 2014;
}

- (NSInteger)totalYearNumber
{
    return [self endYear] - [self startYear] + 1;
}

@end