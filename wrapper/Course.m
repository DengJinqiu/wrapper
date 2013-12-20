//
//  ClassAttendance.m
//  wrapper
//
//  Created by Jinqiu Deng on 12/6/13.
//  Copyright (c) 2013 MusicKids. All rights reserved.
//

#import "Course.h"
#import "Student.h"
#import "Attendance.h"

@interface Course ()

@property (nonatomic) NSMutableSet* monthsContainCourses;

@property (nonatomic) NSMutableDictionary* schedule;

@end

@implementation Course

static NSMutableDictionary* _courses;

+ (NSMutableDictionary*)courseIds
{
    return _courses;
}

+ (void)clearCourseIds
{
    _courses = nil;
}

- (id)initWithCourseName:(NSString *)courseName schoolName:(NSString *)schoolName courseId:(NSString*)courseId
{
    self = [self init];
    if (self) {
        self.courseName = courseName;
        self.schoolName = schoolName;
        self.courseId = courseId;
        if (!_courses) {
            _courses = [[NSMutableDictionary alloc] init];
        }
        [_courses setValue:self forKey:courseId];
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
    return [self.monthsContainCourses containsObject:[NSString stringWithFormat:@"%ld,%ld", (long)year, (long)month]];
}

- (Attendance*)setAttendanceOnYear:(NSInteger)year month:(NSInteger)month day:(NSInteger)day
                                at:(NSInteger)startTime last:(NSInteger)duration
{
    Attendance* attendance = [[Attendance alloc] initWithStartTime:startTime duration:duration course:self];
    [self.schedule setObject:attendance
                      forKey:[NSString stringWithFormat:@"%ld,%ld,%ld", (long)year, (long)month, (long)day]];
    [self.monthsContainCourses addObject:[NSString stringWithFormat:@"%ld,%ld", (long)year, (long)month]];
    
    return attendance;
}

- (Attendance*)attendanceOnYear:(NSInteger)year month:(NSInteger)month day:(NSInteger)day;
{
    return [self.schedule objectForKey:[NSString stringWithFormat:@"%ld,%ld,%ld", (long)year, (long)month, (long)day]];
}

@end