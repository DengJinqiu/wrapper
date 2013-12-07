//
//  ClassAttendance.m
//  wrapper
//
//  Created by Jinqiu Deng on 12/6/13.
//  Copyright (c) 2013 MusicKids. All rights reserved.
//

#import "Course.h"

@interface Course ()

@property (nonatomic) NSMutableSet* monthsContainCourses;

@property (nonatomic) NSMutableDictionary* schedule;

@end

@implementation Course

- (NSMutableSet*)monthsContainCourses
{
    if (!_monthsContainCourses) {
        _monthsContainCourses = [[NSMutableSet alloc] init];
    }
    return _monthsContainCourses;
}

- (NSMutableDictionary*)schedule
{
    if (!_schedule) {
        _schedule = [[NSMutableDictionary alloc] init];
    }
    return _schedule;
}

- (BOOL)hasScheduleOnYear:(NSInteger)year month:(NSInteger)month
{
    return [self.monthsContainCourses containsObject:[NSString stringWithFormat:@"%d,%d", year, month]];
}

- (void)setScheduleeOnYear:(NSInteger)year month:(NSInteger)month day:(NSInteger)day at:(NSInteger)startTime last:(NSInteger)duration students:(NSMutableDictionary*)students
{
    [self.schedule setObject:[[CourseAttendance alloc] initWithStartTime:startTime duration:duration students:students]
                      forKey:[NSString stringWithFormat:@"%d,%d,%d", year, month, day]];
    [self.monthsContainCourses addObject:[NSString stringWithFormat:@"%d,%d", year, month]];
}

- (CourseAttendance*)scheduleOnYear:(NSInteger)year month:(NSInteger)month day:(NSInteger)day;
{
    return [self.schedule objectForKey:[NSString stringWithFormat:@"%d,%d,%d", year, month, day]];
}

@end