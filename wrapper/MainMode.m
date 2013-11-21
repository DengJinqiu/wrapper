//
//  MainMode.m
//  wrapper
//
//  Created by xcode-dev on 11/21/13.
//  Copyright (c) 2013 MusicKids. All rights reserved.
//

#import "MainMode.h"
#import "Calendar.h"

@interface MainMode ()

@property (readonly, strong, nonatomic) Calendar *calendar;

@end

@implementation MainMode

@synthesize calendar = _calendar;

- (Calendar*)calendar
{
    if (!_calendar) {
        _calendar = [[Calendar alloc] init];
    }
    return _calendar;
}

- (NSInteger)startYear
{
    return 2004;
}

- (NSInteger)currentYear
{
    return [[self.calendar currentDate] year];
}

- (NSInteger)currentMonth
{
    return [[self.calendar currentDate] month];
}

- (NSInteger)currentDate
{
    return [[self.calendar currentDate] day];
}

- (NSInteger)currentWeekDay
{
    return [[self.calendar currentDate] weekday];
}

@end
