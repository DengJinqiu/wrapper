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
    NSLog(@"loadCourseStudentsAndAttendancesWithDelegate");
    [self loadCourseWithDelegate:delegate];
}

- (void)loadCourseWithDelegate:(id<UserDelegate>)delegate
{
    NSLog(@"loadCourseWithDelegate");
    [Course clearCourseIds];
    NSString *relativeURL = [NSString stringWithFormat:@"users/%@/courses", _user.userId];
    [[HTTPManager getInstance] GET:relativeURL parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        for (NSDictionary* courseData in (NSDictionary*)responseObject) {
            Course *course = [[Course alloc] initWithCourseName:[courseData objectForKey:@"name"]
                                                     schoolName:[courseData objectForKey:@"school_name"]
                                                       courseId:[courseData objectForKey:@"id"]];
            [self.courseIds addObject:course.courseId];
        }
        [self loadStudentWithDelegate:delegate];
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        [delegate loadingDataFailed];
        
    }];
}

- (void)loadStudentWithDelegate:(id<UserDelegate>)delegate
{
    NSLog(@"loadStudentWithDelegate");
    [Student clearStudentIds];
    NSString *relativeURL = [NSString stringWithFormat:@"users/%@/students", _user.userId];
    [[HTTPManager getInstance] GET:relativeURL parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        for (NSDictionary* studentData in (NSDictionary*)responseObject) {
            Student *student = [[Student alloc] initWithFirstName:[studentData objectForKey:@"first_name"]
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
    NSLog(@"loadAttendanceWithDelegate");
    NSString *relativeURL = [NSString stringWithFormat:@"users/%@/attendances", _user.userId];
    [[HTTPManager getInstance] GET:relativeURL parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        for (NSDictionary *attendanceData in (NSDictionary*)responseObject) {
            NSDictionary *dateTime = [self parseTime:[attendanceData objectForKey:@"start_time"]];
            
            Attendance *attendance = [[Course getCourseById:[attendanceData objectForKey:@"course_id"]]
                                        setAttendanceOnYear:[[dateTime objectForKey:@"year"] intValue]
                                                      month:[[dateTime objectForKey:@"month"] intValue]
                                                        day:[[dateTime objectForKey:@"day"] intValue]
                                                         at:[[dateTime objectForKey:@"hour"] intValue]
                                                       last:[[attendanceData objectForKey:@"duration"] intValue]];
            [attendance markStudent:[attendanceData objectForKey:@"student_id"] attendance:FALSE];
        }
        [delegate loadingDataSuccess];
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        [delegate loadingDataFailed];
        
    }];
}
        
- (NSMutableDictionary*)parseTime:(NSString*) time {
    NSMutableDictionary* dic = [[NSMutableDictionary alloc] init];
    [dic setValue:[time substringWithRange:NSMakeRange(0, 4)] forKey:@"year"];
    [dic setValue:[time substringWithRange:NSMakeRange(5, 2)] forKey:@"month"];
    [dic setValue:[time substringWithRange:NSMakeRange(8, 2)] forKey:@"day"];
    [dic setValue:[time substringWithRange:NSMakeRange(11, 2)] forKey:@"hour"];
    
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
    for (NSString* courseId in self.courseIds) {
        if ([[Course getCourseById:courseId] hasScheduleOnYear:year month:month]) {
            return TRUE;
        }
    }
    return FALSE;
}

- (BOOL)hasCourseOnYear:(NSInteger)year month:(NSInteger)month day:(NSInteger)day
{
    for (NSString* courseId in self.courseIds) {
        if ([[Course getCourseById:courseId] attendanceOnYear:year month:month day:day]) {
            return TRUE;
        }
    }
    return FALSE;
}

#warning "hard code"

//- (void)hardCodeInit
//{
//    
//    Course* course1 = [[Course alloc] initWithCourseName:@"Software Engineering" schoolName:@"Johns Hopkins" courseId:@"1"];
//    Course* course2 = [[Course alloc] initWithCourseName:@"Compiler" schoolName:@"Baltimore University" courseId:@"2"];
//    
//    Student* student1 = [[Student alloc] initWithFirstName:@"Steve" lastName:@"Rifkin" studentId:@"1"];
//    Student* student2 = [[Student alloc] initWithFirstName:@"Steve" lastName:@"DeBlasio" studentId:@"2"];
//    Student* student3 = [[Student alloc] initWithFirstName:@"Phil" lastName:@"Gold" studentId:@"3"];
//    Student* student4 = [[Student alloc] initWithFirstName:@"Christopher" lastName:@"Venghaus" studentId:@"4"];
//    
//    [self.courseIds addObject:course1.id];
//    [self.courseIds addObject:course2.id];
//    
//    NSInteger year = 2013;
//    NSInteger month = 9;
//    NSInteger day = 1;
//    
//    for (int i = 0; i < 180; i++) {
//        day++;
//        NSDateComponents* currentDate = [[Schedule getInstance] year:year month:month day:day];
//        if (currentDate.weekday == 2) {
//            Attendance* attendance = [course1 setAttendanceOnYear:currentDate.year month:currentDate.month
//                                                                   day:currentDate.day at:10 last:40];
//            [attendance markStudent:student1.id attendance:FALSE];
//            [attendance markStudent:student2.id attendance:FALSE];
//        }
//        if (currentDate.weekday == 2 || currentDate.weekday == 5) {
//            Attendance* attendance = [course2 setAttendanceOnYear:currentDate.year month:currentDate.month
//                                                                   day:currentDate.day at:13 last:200];
//            [attendance markStudent:student2.id attendance:FALSE];
//            [attendance markStudent:student3.id attendance:FALSE];
//            [attendance markStudent:student4.id attendance:FALSE];
//        }
//    }
//}

@end
