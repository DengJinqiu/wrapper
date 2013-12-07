//
//  CourseSchedule.m
//  wrapper
//
//  Created by Jinqiu Deng on 12/6/13.
//  Copyright (c) 2013 MusicKids. All rights reserved.
//

#import "CourseAttendance.h"

@implementation CourseAttendance

- (id)initWithStartTime:(NSInteger)startTime duration:(NSInteger)duration students:(NSMutableDictionary *)students
{
    self = [super init];
    if (self) {
        _startTime = startTime;
        _duration = duration;
        _attendance = students;
    }
    return self;
}

@end
