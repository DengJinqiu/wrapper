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
 *  The http manager used to connect with a RESTful database.
 */
@interface HTTPManager : AFHTTPSessionManager

/**
 *  Get an instance of the http manager.
 *  @returns The instance of http manager.
 */
+ (HTTPManager*)getInstance;

/**
 *  Load a teacher with the email, password and delegate.
 *  @param email The email.
 *  @param password The password.
 *  @param delegate The HTTP manager delegate.
 */
+ (void)loadTeacherWithEmail:(NSString*)email password:(NSString*)password delegate:(id<HTTPManagerDelegate>)delegate;

/**
 *  Load a term with the delegate.
 *  @param delegate The HTTP manager delegate.
 */
+ (void)loadTermWithDelegate:(id<HTTPManagerDelegate>)delegate;

/**
 *  Load attendance markings with the delegate.
 *  @param delegate The HTTP manager delegate.
 */
+ (void)loadAttendanceMarkingWithDelegate:(id<HTTPManagerDelegate>)delegate;

/**
 *  Load course of a teacher with the delegate.
 *  @param delegate The HTTP manager delegate.
 */
+ (void)loadCoursesWithDelegate:(id<HTTPManagerDelegate>)delegate;

/**
 *  Load the schedule of all the courses of a teacher with the delegate.
 *  @param delegate The HTTP manager delegate.
 */
+ (void)loadSchedulesWithDelegate:(id<HTTPManagerDelegate>)delegate;

/**
 *  Load roster of a course
 *  @param courseId The course id.
 *  @param date The date.
 *  @param delagate The HTTP manger delegate.
 */
+ (void)loadRosterFor:(NSNumber*)courseId onDate:(NSString*)date withDelegate:(id<HTTPManagerDelegate>)delegate;

/**
 *  Update the attendance of a roster id, if there is no attendance, a new attendance will be created else the attendance will be updated.
 *  @param attendanceId The attendance id, if equals -1, there is no attendance.
 *  @param rosterId The roster id.
 *  @param teacherId The id of the teacher who marks this attendance.
 *  @param attendanceMarkingId The attendance marking id.
 *  @param date The date of this attendance.
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
 *  @param index The attendance index.
 */
+ (void)deleteAttendanceForAttendanceId:(NSNumber *)attendanceId withDelegate:(id<HTTPManagerDelegate>)delegate
                               andIndex:(NSInteger)index;

@end
