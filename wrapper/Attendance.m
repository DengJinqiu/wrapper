//
//  CourseSchedule.m
//  wrapper
//
//  Created by Jinqiu Deng on 12/6/13.
//  Copyright (c) 2013 MusicKids. All rights reserved.
//

#import "Attendance.h"

@implementation Attendance

- (id)initWithStartHour:(NSInteger)hour startMin:(NSInteger)min duration:(NSInteger)duration course:(Course *)course
{
    self = [super init];
    if (self) {
        _startHour = hour;
        _startMin = min;
        _duration = duration;
        _course = course;
    }
    return self;
}

- (void)markStudent:(NSString*)id attendance:(BOOL)attendance
{
    if (!_studentAttendance) {
        _studentAttendance = [[NSMutableDictionary alloc] init];
    }
    [self.studentAttendance setValue:[[NSNumber alloc] initWithBool:attendance] forKey:id];
}

@end
