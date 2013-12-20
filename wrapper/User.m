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
        _user.id = (long)[(NSDictionary*)responseObject objectForKey:@"id"];
        NSLog(@"true");
        [delegate createUserSuccessfully];
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        _user = nil;
        NSLog(@"false");
    }];
}

+ (User*)getInstance
{
    return _user;
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

- (void)hardCodeInit
{
    self.name = @"Jinqiu Deng";
    
    Course* course1 = [[Course alloc] initWithCourseName:@"Software Engineering" schoolName:@"Johns Hopkins" id:@"1"];
    Course* course2 = [[Course alloc] initWithCourseName:@"Compiler" schoolName:@"Baltimore University" id:@"2"];
    
    Student* student1 = [[Student alloc] initWithFirstName:@"Steve" lastName:@"Rifkin" id:@"1"];
    Student* student2 = [[Student alloc] initWithFirstName:@"Steve" lastName:@"DeBlasio" id:@"2"];
    Student* student3 = [[Student alloc] initWithFirstName:@"Phil" lastName:@"Gold" id:@"3"];
    Student* student4 = [[Student alloc] initWithFirstName:@"Christopher" lastName:@"Venghaus" id:@"4"];
    
    [self.courseIds addObject:course1.id];
    [self.courseIds addObject:course2.id];
    
    NSInteger year = 2013;
    NSInteger month = 9;
    NSInteger day = 1;
    
    for (int i = 0; i < 180; i++) {
        day++;
        NSDateComponents* currentDate = [[Schedule getInstance] year:year month:month day:day];
        if (currentDate.weekday == 2) {
            Attendance* attendance = [course1 setAttendanceOnYear:currentDate.year month:currentDate.month
                                                                   day:currentDate.day at:10 last:40];
            [attendance markStudent:student1.id attendance:FALSE];
            [attendance markStudent:student2.id attendance:FALSE];
        }
        if (currentDate.weekday == 2 || currentDate.weekday == 5) {
            Attendance* attendance = [course2 setAttendanceOnYear:currentDate.year month:currentDate.month
                                                                   day:currentDate.day at:13 last:200];
            [attendance markStudent:student2.id attendance:FALSE];
            [attendance markStudent:student3.id attendance:FALSE];
            [attendance markStudent:student4.id attendance:FALSE];
        }
    }
}

@end
