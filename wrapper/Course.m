//
//  ClassAttendance.m
//  wrapper
//
//  Created by Jinqiu Deng on 12/6/13.
//  Copyright (c) 2013 MusicKids. All rights reserved.
//

#import "Course.h"
#import "Student.h"

@interface Course ()

@property (nonatomic) NSMutableSet* monthsContainCourses;

@property (nonatomic) NSMutableDictionary* schedule;

@end

@implementation Course

static NSMutableDictionary* _courses;

+ (NSMutableDictionary*)courses
{
    return _courses;
}

- (id)initWithCourseName:(NSString *)courseName schoolName:(NSString *)schoolName id:(NSString*)id
{
    self = [self init];
    if (self) {
        self.courseName = courseName;
        self.schoolName = schoolName;
        self.id = id;
        if (!_courses) {
            _courses = [[NSMutableDictionary alloc] init];
        }
        [_courses setValue:self forKey:id];
    }
    return self;
}

+ (Course*)getCourseById:(NSString *)id
{
    return [_courses objectForKey:id];
}

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

- (Attendance*)setScheduleeOnYear:(NSInteger)year month:(NSInteger)month day:(NSInteger)day
                        at:(NSInteger)startTime last:(NSInteger)duration
{
    Attendance* attendance = [[Attendance alloc] initWithStartTime:startTime duration:duration];
    [self.schedule setObject:attendance
                      forKey:[NSString stringWithFormat:@"%d,%d,%d", year, month, day]];
    [self.monthsContainCourses addObject:[NSString stringWithFormat:@"%d,%d", year, month]];
    
    return attendance;
}

- (Attendance*)scheduleOnYear:(NSInteger)year month:(NSInteger)month day:(NSInteger)day;
{
    return [self.schedule objectForKey:[NSString stringWithFormat:@"%d,%d,%d", year, month, day]];
}

@end