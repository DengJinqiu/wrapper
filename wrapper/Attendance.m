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

static NSMutableDictionary* _attendances;

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
    if (!_attendances) {
        _attendances = [[NSMutableDictionary alloc] init];
    }
    [_attendances setObject:attendance forKey:attendance.attendanceId];
    [_index addObject:attendance];
}

+ (void)clearAttendance
{
    _index = nil;
    _attendances = nil;
}

+ (Attendance*)attendanceOfIndex:(NSInteger)index
{
    return [_index objectAtIndex:index];
}

+ (Attendance*)attendanceOfId:(NSNumber *)attendanceId
{
    return [_attendances objectForKey:attendanceId];
}

+ (NSInteger)AttendancesNum
{
    return [_attendances count];
}

@end
