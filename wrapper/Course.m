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

+ (void)addWithCourseName:(NSString*)courseName schoolName:(NSString*)schoolName courseId:(NSNumber*)courseId
{
    Course *course = [[Course alloc] init];
    course.courseName = courseName;
    course.schoolName = schoolName;
    course.courseId = courseId;
    if (!_courses) {
        _courses = [[NSMutableDictionary alloc] init];
    }
    [_courses setObject:course forKey:courseId];
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
                              hour:(NSInteger)hour min:(NSInteger)min duration:(NSInteger)duration
{
    Attendance* attendance = [[Attendance alloc] initWithStartHour:hour startMin:min duration:duration course:self];
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