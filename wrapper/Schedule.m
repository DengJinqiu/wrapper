//
//  Schedule.m
//  wrapper
//
//  Created by Jinqiu Deng on 1/19/14.
//  Copyright (c) 2014 MusicKids. All rights reserved.
//

#import "Schedule.h"

@implementation Schedule

static NSMutableDictionary* _courses;

static NSMutableDictionary* _schedule;

static NSMutableSet* _monthsContainCourses;

+ (void)clearCourses
{
    _courses = nil;
    _schedule = nil;
    _monthsContainCourses = nil;
}

+ (void)addWithCourseId:(NSNumber*)courseId
{
    Course *course = [[Course alloc] init];
    course.courseId = courseId;
    if (!_courses) {
        _courses = [[NSMutableDictionary alloc] init];
    }
    [_courses setObject:course forKey:courseId];
}

+ (NSArray*)coursesOnYear:(NSInteger)year month:(NSInteger)month day:(NSInteger)day
{
    return [_schedule objectForKey:[NSString stringWithFormat:@"%d,%d,%d", year, month, day]];
}

+ (BOOL)hasCourseOnYear:(NSInteger)year month:(NSInteger)month
{
    return [_monthsContainCourses containsObject:[NSString stringWithFormat:@"%d,%d", year, month]];
}

+ (BOOL)hasCourseOnYear:(NSInteger)year month:(NSInteger)month day:(NSInteger)day
{
    return [_schedule objectForKey:[NSString stringWithFormat:@"%d,%d,%d", year, month, day]] != NULL;
}

+ (NSInteger)coursesNum
{
    return [_courses count];
}

@end