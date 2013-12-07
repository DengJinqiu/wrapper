//
//  CourseSchedule.m
//  wrapper
//
//  Created by Jinqiu Deng on 12/6/13.
//  Copyright (c) 2013 MusicKids. All rights reserved.
//

#import "CourseSchedule.h"

@implementation CourseSchedule

- (NSMutableDictionary*)studentsAttendance
{
    if (_studentsAttendance) {
        _studentsAttendance = [[NSMutableDictionary alloc] init];
    }
    return _studentsAttendance;
}

- (NSDateComponents*)startTime
{
    if (_startTime) {
        _startTime = [[NSDateComponents alloc] init];
    }
    return _startTime;
}

@end
