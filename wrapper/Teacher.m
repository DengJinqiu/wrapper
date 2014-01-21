//
//  teacher.m
//  wrapper
//
//  Created by Jinqiu Deng on 12/6/13.
//  Copyright (c) 2013 MusicKids. All rights reserved.
//

#import "Teacher.h"
#import "Course.h"
#import "Term.h"
#import "Schedule.h"

@implementation Teacher

static Teacher* _teacher;

+ (void)createInstanceWithUserId:(NSNumber *)teacherId
{
    _teacher = [[Teacher alloc] init];
    _teacher.teacherId = teacherId;
}

+ (Teacher*)getInstance
{
    return _teacher;
}

+ (void)signOut
{
    _teacher = nil;
    [Term clearTerm];
    [Schedule clearSchedule];
}

@end
