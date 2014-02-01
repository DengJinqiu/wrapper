//
//  HTTPManagerDelegate.h
//  wrapper
//
//  Created by Jinqiu Deng on 12/20/13.
//  Copyright (c) 2013 MusicKids. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  The HTTP manager delegate.
 */
@protocol HTTPManagerDelegate <NSObject>

/**
 *  Loading user start.
 */
- (void)loadingUserStart;

/**
 *  Loading user success.
 */
- (void)loadingUserSuccess;

/**
 *  Loading user failed.
 */
- (void)loadingUserFailed;

/**
 *  Loading schedule start.
 */
- (void)loadingScheduleStart;

/**
 *  Loading schedule success.
 */
- (void)loadingScheduleSuccess;

/**
 *  Loading schedule failed.
 */
- (void)loadingScheduleFailed;

/**
 *  Loading roster start.
 */
- (void)loadingRosterStart;

/**
 *  Loading roster success.
 *  @param courseId The course id.
 */
- (void)loadingRosterSuccessWithCourseId:(NSNumber*)courseId;

/**
 *  Loading roster failed.
 */
- (void)loadingRosterFailed;

/**
 *  Changing attendance start.
 *  @param index The index of the attendance.
 */
- (void)changingAttendanceStartWithRowIndex:(NSInteger)index;

/**
 *  Changing the attendance success.
 *  @param attendancId The attendance id.
 *  @param attendanceMarkingId The attendance marking id.
 *  @param index The row index.
 */
- (void)changingAttendanceSuccessWithAttendanceId:(NSNumber*)attendanceId AttendanceMarkingId:(NSNumber*)attendanceMarkingId
                                         RowIndex:(NSInteger)index;

/**
 *  Changing the attendance failed.
 *  @param index The row index.
 */
- (void)changingAttendanceFailedWithRowIndex:(NSInteger)index;

@end
    