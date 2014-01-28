//
//  AttendanceMarking.h
//  wrapper
//
//  Created by Jinqiu Deng on 1/27/14.
//  Copyright (c) 2014 MusicKids. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AttendanceMarking : NSObject

@property (nonatomic) NSNumber* attendanceMarkingId;

@property (nonatomic) NSString* abbrev;

@property (nonatomic) NSString* name;

+ (AttendanceMarking*)getAttendanceMarkingWithId:(NSNumber*)attendanceMarkingId;

+ (AttendanceMarking*)getAttendanceMarkingWithIndex:(NSInteger)index;

+ (void)addAttendanceMarking:(AttendanceMarking*)attendanceMarking;

+ (void)clearAttendanceMarkings;

+ (NSInteger)attendanceMarkingsCount;

- (instancetype)initWithAttendanceMarkingId:(NSNumber*)attendanceMarkingId abbrev:(NSString*)abbrev name:(NSString*)name;

@end
