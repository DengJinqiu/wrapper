//
//  Attendance.h
//  wrapper
//
//  Created by Jinqiu Deng on 1/21/14.
//  Copyright (c) 2014 MusicKids. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  The attendace.
 */
@interface Attendance : NSObject

/**
 *  The attendance id.
 */
@property (nonatomic) NSNumber* attendanceId;

/**
 *  The attendance marking id.
 */
@property (nonatomic) NSNumber* attendanceMarkingId;

/**
 *  The roster id.
 */
@property (nonatomic) NSNumber* rosterId;

/**
 *  The student first name.
 */
@property (nonatomic) NSString* studentFirstName;

/**
 *  The student last name.
 */
@property (nonatomic) NSString* studentLastName;

/**
 *  The teacher first name.
 */
@property (nonatomic) NSString* teacherFirstName;

/**
 *  The teacher last name.
 */
@property (nonatomic) NSString* teacherLastName;

/**
 *  Initialize an attendance with the attendance id, attendance marking id, roster id, student first name, student first name, teacher first name and teacher last name.
 *  @param attendanceId The attendance id.
 *  @param attendanceMarkingId The attendance marking id.
 *  @param rosterId The roster id.
 *  @param studentFirstName The student first name.
 *  @param studentLastName The student last name.
 *  @param teacherFirstName The teacher first name.
 *  @param teacherLastName The teacher last name.
 *  @returns The attendance.
 */
- (instancetype)initWithAttendanceId:(NSNumber*)attendanceId attendanceMarkingId:(NSNumber*)attendanceMarkingId
                            rosterId:(NSNumber*)rosterId studentFirstName:(NSString*)studentFirstName
                     studentLastName:(NSString*)studentLastName teacherFirstName:(NSString*)teacherFirstName
                     teacherLastName:(NSString*)teacherLastName;

/**
 *  Add an attendance.
 *  @param attendance The attendance.
 */
+ (void) addAttendance:(Attendance*)attendance;

/**
 *  Get an attendance of an index.
 *  @param index The index.
 *  @returns The attendance.
 */
+ (Attendance*)attendanceOfIndex:(NSInteger)index;

/**
 *  Get an attendance of an roster id.
 *  @param rosterId The roster id.
 *  @returns The attendance.
 */
+ (Attendance*)attendanceOfId:(NSNumber*)rosterId;

/**
 *  Clear attendance.
 */
+ (void)clearAttendance;

/**
 *  The number of attendances.
 *  @returns The attendance number.
 */
+ (NSInteger)attendancesNum;

@end
