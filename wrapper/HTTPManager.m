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
#import "AttendanceMarking.h"

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
        [self loadAttendanceMarkingWithDelegate:delegate];
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        [delegate loadingScheduleFailed];
    }];
}

+ (void)loadAttendanceMarkingWithDelegate:(id<HTTPManagerDelegate>)delegate
{
    NSString *relativeURL = @"attendance_markings";
    [[HTTPManager getInstance] GET:relativeURL parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        for (NSDictionary* attendanceMarking in (NSArray*)responseObject) {
            AttendanceMarking* a = [[AttendanceMarking alloc] initWithAttendanceMarkingId:[attendanceMarking objectForKey:@"id"]
                                                                                   abbrev:[attendanceMarking objectForKey:@"abbrev"]
                                                                                     name:[attendanceMarking objectForKey:@"name"]];
            [AttendanceMarking addAttendanceMarking:a];
        }
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
        [self loadSchedulesWithDelegate:delegate];
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        [delegate loadingScheduleFailed];
    }];
}

+ (void)loadSchedulesWithDelegate:(id<HTTPManagerDelegate>)delegate
{
    NSString *relativeURL = @"schedules";
    [[HTTPManager getInstance] GET:relativeURL parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
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
            
            NSNumber* courseId = [schedule objectForKey:@"course_id"];
                
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
        [delegate loadingScheduleSuccess];
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        [delegate loadingScheduleFailed];
    }];
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
        [delegate loadingRosterSuccessWithCourseId:courseId];
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        [delegate loadingRosterFailed];
    }];
}

+ (void)updateAttendanceForAttendanceId:(NSNumber *)attendanceId rosterId:(NSNumber *)rosterId teacherId:(NSNumber *)teacherId
                    attendanceMarkingId:(NSNumber *)attendanceMarkingId date:(NSString *)date
{
    NSDictionary *parameters = @{@"roster_id": rosterId, @"teacher_id": teacherId,
                                 @"attendance_marking_id": attendanceMarkingId, @"date": date};
    NSString *relativeURL = [NSString stringWithFormat:@"attendances/%@", attendanceId];
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
//        [delegate loadingRosterSuccessWithCourseId:courseId];
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
//        [delegate loadingRosterFailed];
    }];
}

+ (void)createAttendanceForRosterId:(NSNumber *)rosterId teacherId:(NSNumber *)teacherId
                attendanceMarkingId:(NSNumber *)attendanceMarkingId date:(NSString *)date
{
    
}

@end