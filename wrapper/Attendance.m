//
//  CourseSchedule.m
//  wrapper
//
//  Created by Jinqiu Deng on 12/6/13.
//  Copyright (c) 2013 MusicKids. All rights reserved.
//

#import "Attendance.h"

@implementation Attendance

- (id)initWithStartTime:(NSInteger)startTime duration:(NSInteger)duration
{
    self = [super init];
    if (self) {
        _startTime = startTime;
        _duration = duration;
    }
    return self;
}

- (void)markStudent:(NSString*)id attendance:(BOOL)attendance
{
    if (!_attendance) {
        _attendance = [[NSMutableDictionary alloc] init];
    }
    [self.attendance setValue:[[NSNumber alloc] initWithBool:attendance] forKey:id];
}

@end
