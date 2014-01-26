//
//  Attendance.h
//  wrapper
//
//  Created by Jinqiu Deng on 1/21/14.
//  Copyright (c) 2014 MusicKids. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Attendance : NSObject

@property (nonatomic) NSNumber* attendanceId;

@property (nonatomic) NSNumber* attendanceMarkingId;

@property (nonatomic) NSNumber* rosterId;

@property (nonatomic) NSString* studentFirstName;

@property (nonatomic) NSString* studentLastName;

@property (nonatomic) NSString* teacherFirstName;

@property (nonatomic) NSString* teacherLastName;

- (instancetype)initWithAttendanceId:(NSNumber*)attendanceId attendanceMarkingId:(NSNumber*)attendanceMarkingId
                            rosterId:(NSNumber*)rosterId studentFirstName:(NSString*)studentFirstName
                     studentLastName:(NSString*)studentLastName teacherFirstName:(NSString*)teacherFirstName
                     teacherLastName:(NSString*)teacherLastName;

+ (void) addAttendance:(Attendance*)attendance;

+ (Attendance*)attendanceOfIndex:(NSInteger)index;

+ (Attendance*)attendanceOfId:(NSNumber*)rosterId;

+ (void)clearAttendance;

+ (NSInteger)attendancesNum;

@end
