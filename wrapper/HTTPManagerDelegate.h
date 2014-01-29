//
//  HTTPManagerDelegate.h
//  wrapper
//
//  Created by Jinqiu Deng on 12/20/13.
//  Copyright (c) 2013 MusicKids. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol HTTPManagerDelegate <NSObject>

- (void)loadingUserStart;

- (void)loadingUserSuccess;

- (void)loadingUserFailed;

- (void)loadingScheduleStart;

- (void)loadingScheduleSuccess;

- (void)loadingScheduleFailed;

- (void)loadingRosterStart;

- (void)loadingRosterSuccessWithCourseId:(NSNumber*)courseId;

- (void)loadingRosterFailed;

- (void)changingAttendanceStartWithRowIndex:(NSInteger)index;

- (void)changingAttendanceSuccessWithAttendanceId:(NSNumber*)attendanceId AttendanceMarkingId:(NSNumber*)attendanceMarkingId
                                         RowIndex:(NSInteger)index;

- (void)changingAttendanceFailedWithRowIndex:(NSInteger)index;

@end
    