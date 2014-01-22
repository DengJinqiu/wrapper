//
//  HTTPManager.m
//  wrapper
//
//  Created by Jinqiu Deng on 12/20/13.
//  Copyright (c) 2013 MusicKids. All rights reserved.
//

#import "HTTPManager.h"
#import "Term.h"
#import "DateTimeParser.h"
#import "Teacher.h"
#import "Schedule.h"
#import "SchoolCalendar.h"
#import "Attendance.h"

@implementation HTTPManager

static HTTPManager *_manager;

+ (HTTPManager*)getInstance
{
    if (_manager == nil) {
        NSURL *baseURL = [NSURL URLWithString:@"http://taffy.herokuapp.com/"];
        _manager = [[HTTPManager alloc] initWithBaseURL:baseURL];
    }
    return _manager;
}

+ (void)loadTeacherWithEmail:(NSString *)email password:(NSString *)password delegate:(id<HTTPManagerDelegate>)delegate
{
    NSDictionary *parameters = @{@"email": email, @"password": password};
    
    [[HTTPManager getInstance] GET:@"users/verify" parameters:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
        if ([[(NSDictionary*)responseObject objectForKey:@"type"] isEqualToString:@"Teacher"]) {
             [Teacher createInstanceWithUserId:[(NSDictionary*)responseObject objectForKey:@"id"]];
            [delegate loadingUserSuccess];
        } else {
            [delegate loadingUserFailed];
        }
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        [delegate loadingUserFailed];
    }];
}

+ (void)loadTermWithDelegate:(id<HTTPManagerDelegate>)delegate
{
    NSString *relativeURL = @"terms/current";
    [[HTTPManager getInstance] GET:relativeURL parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        [Term createInstanceWithStartYear:[[(NSDictionary*)responseObject objectForKey:@"start_date"] intValue]
                                  endYear:[[(NSDictionary*)responseObject objectForKey:@"end_date"] intValue]
                                andTermId:[(NSDictionary*)responseObject objectForKey:@"id"]];
        [self loadCoursesWithDelegate:delegate];
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        [delegate loadingScheduleFailed];
    }];
}

+ (void)loadCoursesWithDelegate:(id<HTTPManagerDelegate>)delegate
{
    NSString *relativeURL = [NSString stringWithFormat:@"teachers/%@/courses", [Teacher getInstance].teacherId];
    [[HTTPManager getInstance] GET:relativeURL parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        for (NSDictionary* course in (NSArray*)responseObject) {
            if ([[course objectForKey:@"term_id"] isEqualToNumber:[Term getInstance].termId]) {
                Course* c = [[Course alloc] initWithCourseId:[course objectForKey:@"id"]
                                                  courseName:[course objectForKey:@"name"]
                                                  schoolName:[course objectForKey:@"school_name"]
                                              instrumentName:[course objectForKey:@"instrument_name"]
                                                 programType:[course objectForKey:@"program_type"]
                                                  courseType:[course objectForKey:@"course_type"]];
                [Schedule addCourse:c];
            }
        }
        [self loadScheduleFor:0 withDelegate:delegate];
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        [	delegate loadingScheduleFailed];
    }];
}

+ (void)loadScheduleFor:(NSInteger)courseIndex withDelegate:(id<HTTPManagerDelegate>)delegate
{
    if (courseIndex < [Schedule coursesNum]) {
        NSString *relativeURL = [NSString stringWithFormat:@"courses/%@/schedules", [Schedule courseOfIndex:courseIndex].courseId];
        [[HTTPManager getInstance] GET:relativeURL parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
            NSNumber* courseId = [Schedule courseOfIndex:courseIndex].courseId;
            for (NSDictionary* schedule in (NSArray*)responseObject) {
                NSInteger weekDay = [[schedule objectForKey:@"day_of_week"] intValue];
                
                NSString* startDate = [schedule objectForKey:@"start_date"];
                NSInteger startYear = [DateTimeParser year:startDate];
                NSInteger startMonth = [DateTimeParser month:startDate];
                NSInteger startDay = [DateTimeParser day:startDate];
                
                NSString* endDate = [schedule objectForKey:@"end_date"];
                NSInteger endYear = [DateTimeParser year:endDate];
                NSInteger endMonth = [DateTimeParser month:endDate];
                NSInteger endDay = [DateTimeParser day:endDate];
                
                for (NSInteger day = 0; ; day++) {
                    NSDateComponents* dayComponents = [[SchoolCalendar getInstance] year:startYear month:startMonth day:startDay+day];
                    if (dayComponents.weekday == weekDay) {
                        [Schedule addScheduleForCourse:courseId onYear:dayComponents.year
                                                 month:dayComponents.month andDay:dayComponents.day];
                    }
                    if (dayComponents.day == endDay && dayComponents.month == endMonth && dayComponents.year == endYear) {
                        break;
                    }
                }
            }
            [self loadScheduleFor:courseIndex+1 withDelegate:delegate];
        } failure:^(NSURLSessionDataTask *task, NSError *error) {
            [delegate loadingScheduleFailed];
        }];
    } else {
        [delegate loadingScheduleSuccess];
    }
}

+ (void)loadRosterFor:(NSNumber*)courseId onDate:(NSString *)date withDelegate:(id<HTTPManagerDelegate>)delegate
{
    NSDictionary *parameters = @{@"date": date};
    NSString *relativeURL = [NSString stringWithFormat:@"courses/%@/rosters", courseId];
    [[HTTPManager getInstance] GET:relativeURL parameters:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
        [Attendance clearAttendance];
        for (NSDictionary* attendance in (NSArray*)responseObject) {
            Attendance* a = [[Attendance alloc] initWithAttendanceId:[attendance objectForKey:@"attendance_id"]
                                                 attendanceMarkingId:[attendance objectForKey:@"attendance_marking_id"]
                                                            rosterId:[attendance objectForKey:@"roster_id"]
                                                    studentFirstName:[attendance objectForKey:@"student_first_name"]
                                                     studentLastName:[attendance objectForKey:@"student_last_name"]
                                                    teacherFirstName:[attendance objectForKey:@"teacher_first_name"]
                                                     teacherLastName:[attendance objectForKey:@"teacher_last_name"]];
            [Attendance addAttendance:a];
        }
        [delegate loadingRosterSuccess];
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        [delegate loadingRosterFailed];
    }];
}

@end