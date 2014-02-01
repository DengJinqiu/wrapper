//
//  HTTPManager.h
//  wrapper
//
//  Created by Jinqiu Deng on 12/20/13.
//  Copyright (c) 2013 MusicKids. All rights reserved.
//

#import "AFHTTPSessionManager.h"
#import "HTTPManagerDelegate.h"

/**
 *  The http manager.
 */
@interface HTTPManager : AFHTTPSessionManager

/**
 *  Get an instance of http manager.
 *  @returns The instance of http manager.
 */
+ (HTTPManager*)getInstance;

/**
 *  Load a teacher.
 *  @param email The email
 *  @param password The passowrd.
 *  @param delegete The HTTP manager delegate.
 */
+ (void)loadTeacherWithEmail:(NSString*)email password:(NSString*)password delegate:(id<HTTPManagerDelegate>)delegate;

/**
 *  Load a term.
 *  @param delegate The HTTP manager delegate.
 */
+ (void)loadTermWithDelegate:(id<HTTPManagerDelegate>)delegate;

/**
 *  Load attendance markings
 *  @param delegate The HTTP manager delegate.
 */
+ (void)loadAttendanceMarkingWithDelegate:(id<HTTPManagerDelegate>)delegate;

/**
 *  Load course
 *  @param delegate The HTTP manager delegate.
 */
+ (void)loadCoursesWithDelegate:(id<HTTPManagerDelegate>)delegate;

/**
 *  Load the schedule.
 *  @param delegate The HTTP manager delegate.
 */
+ (void)loadSchedulesWithDelegate:(id<HTTPManagerDelegate>)delegate;

/**
 *  Load roster.
 *  @param courseId The course id.
 *  @param date The date.
 *  @param delagate The HTTP manger delegate.
 */
+ (void)loadRosterFor:(NSNumber*)courseId onDate:(NSString*)date withDelegate:(id<HTTPManagerDelegate>)delegate;

/**
 *  Update the attendance.
 *  @param attendanceId The attendance id.
 *  @param rosterId The roster id.
 *  @param teacherId The teacher id.
 *  @param attendanceMarkingId The attendance marking id.
 *  @param date The date.
 *  @param delegate The HTTP manager delegate.
 *  @param index The attendance index.
 */
+ (void)updateAttendanceForAttendanceId:(NSNumber*)attendanceId rosterId:(NSNumber*)rosterId teacherId:(NSNumber*)teacherId
                    attendanceMarkingId:(NSNumber*)attendanceMarkingId date:(NSString*)date
                           withDelegate:(id<HTTPManagerDelegate>)delegate andIndex:(NSInteger)index;

/**
 *  Delete the attendance.
 *  @param attendanceId The attendance id.
 *  @param delegate The HTTP manager delegate.
 *  @param index The index.
 */
+ (void)deleteAttendanceForAttendanceId:(NSNumber *)attendanceId withDelegate:(id<HTTPManagerDelegate>)delegate
                               andIndex:(NSInteger)index;

@end