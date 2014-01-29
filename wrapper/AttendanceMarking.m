//
//  AttendanceMarking.m
//  wrapper
//
//  Created by Jinqiu Deng on 1/27/14.
//  Copyright (c) 2014 MusicKids. All rights reserved.
//

#import "AttendanceMarking.h"

@implementation AttendanceMarking

static NSMutableDictionary* _attendanceMarkings;

static NSMutableArray* _index;

+ (void)addAttendanceMarking:(AttendanceMarking *)attendanceMarking
{
    if (!_attendanceMarkings) {
        _attendanceMarkings = [[NSMutableDictionary alloc] init];
    }
    if (!_index) {
        _index = [[NSMutableArray alloc] init];
    }
    [_index addObject:attendanceMarking];
    [_attendanceMarkings setObject:attendanceMarking forKey:attendanceMarking.attendanceMarkingId];
}

+ (AttendanceMarking*)attendanceMarkingWithId:(NSNumber *)attendanceMarkingId
{
    return [_attendanceMarkings objectForKey:attendanceMarkingId];
}

+ (AttendanceMarking*)attendanceMarkingWithIndex:(NSInteger)index
{
    return [_index objectAtIndex:index];
}

- (instancetype)initWithAttendanceMarkingId:(NSNumber *)attendanceMarkingId abbrev:(NSString *)abbrev name:(NSString *)name
{
    self = [super init];
    if (self) {
        self.attendanceMarkingId = attendanceMarkingId;
        self.abbrev = abbrev;
        self.name = name;
    }
    return self;
}

+ (void)clearAttendanceMarkings
{
    _attendanceMarkings = nil;
    _index = nil;
}

+ (NSInteger)attendanceMarkingsCount
{
    return _attendanceMarkings.count;
}

+ (NSInteger)idToIndex:(NSNumber *)attendanceMarkingId
{
    for (int i = 0; i < [_index count]; i++) {
        if ([((AttendanceMarking*)_index[i]).attendanceMarkingId isEqualToNumber:attendanceMarkingId]) {
            return i;
        }
    }
    return -1;
}

@end
