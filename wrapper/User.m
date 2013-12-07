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
        if ([[Course getCourseById:courseId] scheduleOnYear:year month:month day:day]) {
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
    
    [self.courseIds addObject:course1.id];
    [self.courseIds addObject:course2.id];
    
    NSInteger year = 2013;
    NSInteger month = 9;
    NSInteger day = 1;
    
    for (int i = 0; i < 180; i++) {
        day++;
        NSDateComponents* currentDate = [[Schedule getInstance] year:year month:month day:day];
        if (currentDate.weekday == 2) {
            NSMutableDictionary* students = [[NSMutableDictionary alloc] init];
            [students setValue:[[NSNumber alloc] initWithBool:FALSE] forKey:@"Steve Rifkin"];
            [students setValue:[[NSNumber alloc] initWithBool:FALSE] forKey:@"Steve DeBlasio"];
            [students setValue:[[NSNumber alloc] initWithBool:FALSE] forKey:@"Phil Gold"];
            [students setValue:[[NSNumber alloc] initWithBool:FALSE] forKey:@"Christopher Venghaus"];
            
            [course1 setScheduleeOnYear:currentDate.year month:currentDate.month
                                    day:currentDate.day at:10 last:40 students:students];
        }
        if (currentDate.weekday == 2 || currentDate.weekday == 5) {
            NSMutableDictionary* students = [[NSMutableDictionary alloc] init];
            [students setValue:[[NSNumber alloc] initWithBool:FALSE] forKey:@"Amihood Amir"];
            [students setValue:[[NSNumber alloc] initWithBool:FALSE] forKey:@"Mitra Basu"];
            [students setValue:[[NSNumber alloc] initWithBool:FALSE] forKey:@"Philippe Burlina"];
            [students setValue:[[NSNumber alloc] initWithBool:FALSE] forKey:@"Kenneth Church"];
            [students setValue:[[NSNumber alloc] initWithBool:FALSE] forKey:@"Bharat Doshi"];
            [students setValue:[[NSNumber alloc] initWithBool:FALSE] forKey:@"Gabor Fichtinger"];
            [students setValue:[[NSNumber alloc] initWithBool:FALSE] forKey:@"Brian Haberman"];
            [students setValue:[[NSNumber alloc] initWithBool:FALSE] forKey:@"Sheela Kosaraju"];
            [students setValue:[[NSNumber alloc] initWithBool:FALSE] forKey:@"Harold Lehmann"];
            [students setValue:[[NSNumber alloc] initWithBool:FALSE] forKey:@"Han Liu"];
            [students setValue:[[NSNumber alloc] initWithBool:FALSE] forKey:@"Adam Lopez"];
            [students setValue:[[NSNumber alloc] initWithBool:FALSE] forKey:@"James Mayfield"];
            
            
            [course2 setScheduleeOnYear:currentDate.year month:currentDate.month
                                    day:currentDate.day at:13 last:200 students:students];
        }
    }
}

@end
