//
//  Attendance.m
//  wrapper
//
//  Created by Jinqiu Deng on 1/21/14.
//  Copyright (c) 2014 MusicKids. All rights reserved.
//

#import "Attendance.h"

@implementation Attendance

static NSMutableArray* _index;

- (instancetype)initWithAttendanceId:(NSNumber *)attendanceId attendanceMarkingId:(NSNumber *)attendanceMarkingId
                            rosterId:(NSNumber *)rosterId studentFirstName:(NSString *)studentFirstName
                     studentLastName:(NSString *)studentLastName teacherFirstName:(NSString *)teacherFirstName
                     teacherLastName:(NSString *)teacherLastName
{
    self = [super init];
    if (self) {
        self.attendanceId = attendanceId;
        self.attendanceMarkingId = attendanceMarkingId;
        self.rosterId = rosterId;
        self.studentFirstName = studentFirstName;
        self.studentLastName = studentLastName;
        self.teacherFirstName = teacherFirstName;
        self.teacherLastName = teacherLastName;
    }
    return self;
}

+ (void)addAttendance:(Attendance *)attendance
{
    if (!_index) {
        _index = [[NSMutableArray alloc] init];
    }
    [_index addObject:attendance];
}

+ (void)clearAttendance
{
    _index = nil;
}

+ (Attendance*)attendanceForIndex:(NSInteger)index
{
    return [_index objectAtIndex:index];
}

+ (NSInteger)AttendancesNum
{
    return [_index count];
}

@end
