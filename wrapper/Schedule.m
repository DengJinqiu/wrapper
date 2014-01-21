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

static NSMutableArray* _index;

static NSMutableDictionary* _schedule;

static NSMutableSet* _monthsContainCourses;

+ (void)clearSchedule
{
    _courses = nil;
    _index = nil;
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
    if (!_index) {
        _index = [[NSMutableArray alloc] init];
    }
    if (!_schedule) {
        _schedule = [[NSMutableDictionary alloc] init];
    }
    if (!_monthsContainCourses) {
        _monthsContainCourses = [[NSMutableSet alloc] init];
    }
    [_courses setObject:course forKey:courseId];
    [_index addObject:courseId];
}

+ (void)addScheduleForCourse:(NSNumber*)courseId onYear:(NSInteger)year month:(NSInteger)month andDay:(NSInteger)day
{
    if ([_schedule objectForKey:[NSString stringWithFormat:@"%d,%d,%d", year, month, day]] == NULL) {
        [_schedule setObject:[[NSMutableArray alloc] init] forKey:[NSString stringWithFormat:@"%d,%d,%d", year, month, day]];
    }
    if (!_monthsContainCourses) {
        _monthsContainCourses = [[NSMutableSet alloc] init];
    }
    [[_schedule objectForKey:[NSString stringWithFormat:@"%d,%d,%d", year, month, day]] addObject:courseId];
    [_monthsContainCourses addObject:[NSString stringWithFormat:@"%d,%d", year, month]];
}

+ (Course*)courseOfIndex:(NSInteger)index
{
    return [self courseOfId:[_index objectAtIndex:index]];
}

+ (Course*)courseOfId:(NSNumber*)couseId
{
    return [_courses objectForKey:couseId];
}

+ (NSMutableArray*)coursesOnYear:(NSInteger)year month:(NSInteger)month day:(NSInteger)day
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
    return [_index count];
}

@end