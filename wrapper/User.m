//
//  User.m
//  wrapper
//
//  Created by Jinqiu Deng on 12/6/13.
//  Copyright (c) 2013 MusicKids. All rights reserved.
//

#import "User.h"
#import "Course.h"
#import "Schedule.h"
#import "Student.h"
#import "Attendance.h"
#import "HTTPManager.h"

@implementation User

static User* _user;

+ (void)createInstanceWithEmail:(NSString*)email password:(NSString*)password delegate:(id<UserDelegate>)delegate {
    NSDictionary *parameters = @{@"email": email, @"password": password};
    
    [[HTTPManager getInstance] GET:@"users/verify" parameters:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
        _user = [[User alloc] init];
        _user.userId = [(NSDictionary*)responseObject objectForKey:@"id"];
        [delegate creatingUserSuccess];
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        _user = nil;
        [delegate creatingUserFailed];
    }];
}

+ (User*)getInstance
{
    return _user;
}

- (void)loadCourseStudentsAndAttendancesWithDelegate:(id<UserDelegate>)delegate
{
    [self loadCourseWithDelegate:delegate];
}

- (void)loadCourseWithDelegate:(id<UserDelegate>)delegate
{
    [Course clearCourseIds];
    NSString *relativeURL = [NSString stringWithFormat:@"users/%@/courses", _user.userId];
    [[HTTPManager getInstance] GET:relativeURL parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        for (NSDictionary* courseData in (NSDictionary*)responseObject) {
            [Course addWithCourseName:[courseData objectForKey:@"name"]
                           schoolName:[courseData objectForKey:@"school_name"]
                             courseId:[courseData objectForKey:@"id"]];
            [self.courseIds addObject:[courseData objectForKey:@"id"]];
        }
        [self loadStudentWithDelegate:delegate];
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        [delegate loadingDataFailed];
    }];
}

- (void)loadStudentWithDelegate:(id<UserDelegate>)delegate
{
    [Student clearStudentIds];
    NSString *relativeURL = [NSString stringWithFormat:@"users/%@/students", _user.userId];
    [[HTTPManager getInstance] GET:relativeURL parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        for (NSDictionary* studentData in (NSDictionary*)responseObject) {
            [Student addWithFirstName:[studentData objectForKey:@"first_name"]
                             lastName:[studentData objectForKey:@"last_name"]
                            studentId:[studentData objectForKey:@"id"]];
        }
        [self loadAttendanceWithDelegate:delegate];
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        [delegate loadingDataFailed];
    }];
}

- (void)loadAttendanceWithDelegate:(id<UserDelegate>)delegate
{
    NSString *relativeURL = [NSString stringWithFormat:@"users/%@/attendances", _user.userId];
    [[HTTPManager getInstance] GET:relativeURL parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        for (NSDictionary *attendanceData in (NSDictionary*)responseObject) {
            NSDictionary *dateTime = [self parseTime:[attendanceData objectForKey:@"start_time"]];
            
            Attendance *attendance = [[Course getCourseById:[attendanceData objectForKey:@"course_id"]]
                                      setAttendanceOnYear:[[dateTime objectForKey:@"year"] intValue]
                                      month:[[dateTime objectForKey:@"month"] intValue]
                                      day:[[dateTime objectForKey:@"day"] intValue]
                                      hour:[[dateTime objectForKey:@"hour"] intValue]
                                      min:[[dateTime objectForKey:@"min"] intValue]
                                      duration:[[attendanceData objectForKey:@"duration"] intValue]];
            [attendance markStudent:[attendanceData objectForKey:@"student_id"]
                         attendance:[[attendanceData objectForKey:@"mark"] isEqualToString:@"attend"]];
        }
        [delegate loadingDataSuccess];
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        [delegate loadingDataFailed];
    }];
}

- (NSMutableDictionary*)parseTime:(NSString*) time {
    NSMutableDictionary* dic = [[NSMutableDictionary alloc] init];
    [dic setObject:[time substringWithRange:NSMakeRange(0, 4)] forKey:@"year"];
    [dic setObject:[time substringWithRange:NSMakeRange(5, 2)] forKey:@"month"];
    [dic setObject:[time substringWithRange:NSMakeRange(8, 2)] forKey:@"day"];
    [dic setObject:[time substringWithRange:NSMakeRange(11, 2)] forKey:@"hour"];
    [dic setObject:[time substringWithRange:NSMakeRange(13, 2)] forKey:@"min"];
    
    return dic;
}

- (NSMutableSet*)courseIds
{
    if (!_courseIds) {
        _courseIds = [[NSMutableSet alloc] init];
    }
    return _courseIds;
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

- (BOOL)hasCourseOnYear:(NSInteger)year month:(NSInteger)month
{
    for (NSNumber* courseId in self.courseIds) {
        if ([[Course getCourseById:courseId] hasScheduleOnYear:year month:month]) {
            return TRUE;
        }
    }
    return FALSE;
}

- (BOOL)hasCourseOnYear:(NSInteger)year month:(NSInteger)month day:(NSInteger)day
{
    for (NSNumber* courseId in self.courseIds) {
        if ([[Course getCourseById:courseId] attendanceOnYear:year month:month day:day]) {
            return TRUE;
        }
    }
    return FALSE;
}

@end
