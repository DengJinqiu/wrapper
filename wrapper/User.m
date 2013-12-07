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

@interface User ()

@end

@implementation User

static User* _user;

+ (User*)getInstance
{
    if (!_user) {
        _user = [[User alloc] init];
        [_user hardCodeInit];
    }
    return _user;
}

- (NSMutableArray*)courses
{
    if (!_courses) {
        _courses = [[NSMutableArray alloc] init];
    }
    return _courses;
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

- (BOOL)hasClassOnYear:(NSInteger)year month:(NSInteger)month
{
    return FALSE;
}

- (BOOL)hasClassOnYear:(NSInteger)year month:(NSInteger)month day:(NSInteger)day
{
    return FALSE;
}

#warning "hard code"

- (void)hardCodeInit
{
    self.name = @"Jinqiu Deng";
    
    Course* course1 = [[Course alloc] init];
    Course* course2 = [[Course alloc] init];
    Course* course3 = [[Course alloc] init];
    
    [self.courses addObject:course1];
    [self.courses addObject:course2];
    [self.courses addObject:course3];
    
    course1.schoolName = @"Johns Hopkins";
    course1.courseName = @"Software Engineering";
    
    course2.schoolName = @"Baltimore University";
    course2.courseName = @"Compiler";
    
    course3.schoolName = @"Johns Hopkins";
    course3.courseName = @"Computer Vision";
    
    NSInteger year = 2013;
    NSInteger month = 9;
    NSInteger day = 1;
    
    for (int i = 0; i < 180; i++) {
        day++;
        Date* currentDate = [[Schedule getInstance] year:year month:month day:day];
        if (currentDate.weekday == 1 || currentDate.weekday == 3) {
            CourseSchedule* courseSchedule = [[CourseSchedule alloc] init];
            courseSchedule.startTime = currentDate;
            courseSchedule.startTime.hour = 10;
            courseSchedule.duration = 40;
            [courseSchedule.studentsAttendance setValue:[[NSNumber alloc] initWithBool:FALSE] forKey:@"Steve Rifkin"];
            [courseSchedule.studentsAttendance setValue:[[NSNumber alloc] initWithBool:FALSE] forKey:@"Steve DeBlasio"];
            [courseSchedule.studentsAttendance setValue:[[NSNumber alloc] initWithBool:FALSE] forKey:@"Phil Gold"];
            [courseSchedule.studentsAttendance setValue:[[NSNumber alloc] initWithBool:FALSE] forKey:@"Christopher Venghaus"];
            [course1.schedule addObject:courseSchedule];
        }
        if (currentDate.weekday == 2 || currentDate.weekday == 4) {
            CourseSchedule* courseSchedule = [[CourseSchedule alloc] init];
            courseSchedule.startTime = currentDate;
            courseSchedule.startTime.hour = 13;
            courseSchedule.duration = 200;
            [courseSchedule.studentsAttendance setValue:[[NSNumber alloc] initWithBool:FALSE] forKey:@"Amihood Amir"];
            [courseSchedule.studentsAttendance setValue:[[NSNumber alloc] initWithBool:FALSE] forKey:@"Mitra Basu"];
            [courseSchedule.studentsAttendance setValue:[[NSNumber alloc] initWithBool:FALSE] forKey:@"Philippe Burlina"];
            [courseSchedule.studentsAttendance setValue:[[NSNumber alloc] initWithBool:FALSE] forKey:@"Kenneth Church"];
            [courseSchedule.studentsAttendance setValue:[[NSNumber alloc] initWithBool:FALSE] forKey:@"Bharat Doshi"];
            [courseSchedule.studentsAttendance setValue:[[NSNumber alloc] initWithBool:FALSE] forKey:@"Gabor Fichtinger"];
            [courseSchedule.studentsAttendance setValue:[[NSNumber alloc] initWithBool:FALSE] forKey:@"Brian Haberman"];
            [courseSchedule.studentsAttendance setValue:[[NSNumber alloc] initWithBool:FALSE] forKey:@"Sheela Kosaraju"];
            [courseSchedule.studentsAttendance setValue:[[NSNumber alloc] initWithBool:FALSE] forKey:@"Harold Lehmann"];
            [courseSchedule.studentsAttendance setValue:[[NSNumber alloc] initWithBool:FALSE] forKey:@"Han Liu"];
            [courseSchedule.studentsAttendance setValue:[[NSNumber alloc] initWithBool:FALSE] forKey:@"Adam Lopez"];
            [courseSchedule.studentsAttendance setValue:[[NSNumber alloc] initWithBool:FALSE] forKey:@"James Mayfield"];
            [course2.schedule addObject:courseSchedule];
        }
        if (currentDate.weekday == 5) {
            CourseSchedule* courseSchedule = [[CourseSchedule alloc] init];
            courseSchedule.startTime = currentDate;
            courseSchedule.startTime.hour = 16;
            courseSchedule.duration = 100;
            [courseSchedule.studentsAttendance setValue:[[NSNumber alloc] initWithBool:FALSE] forKey:@"Nicolas Padoy"];
            [course3.schedule addObject:courseSchedule];
        }
    }

}

@end
