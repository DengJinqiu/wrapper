//
//  HTTPManager.h
//  wrapper
//
//  Created by Jinqiu Deng on 12/20/13.
//  Copyright (c) 2013 MusicKids. All rights reserved.
//

#import "AFHTTPSessionManager.h"
#import "HTTPManagerDelegate.h"

@interface HTTPManager : AFHTTPSessionManager

+ (HTTPManager*)getInstance;

+ (void)loadTeacherWithEmail:(NSString*)email password:(NSString*)password delegate:(id<HTTPManagerDelegate>)delegate;

+ (void)loadTermWithDelegate:(id<HTTPManagerDelegate>)delegate;

+ (void)loadAttendanceMarkingWithDelegate:(id<HTTPManagerDelegate>)delegate;

+ (void)loadCoursesWithDelegate:(id<HTTPManagerDelegate>)delegate;

+ (void)loadSchedulesWithDelegate:(id<HTTPManagerDelegate>)delegate;

+ (void)loadRosterFor:(NSNumber*)courseId onDate:(NSString*)date withDelegate:(id<HTTPManagerDelegate>)delegate;

+ (void)updateAttendanceForAttendanceId:(NSNumber*)attendanceId rosterId:(NSNumber*)rosterId teacherId:(NSNumber*)teacherId
                    attendanceMarkingId:(NSNumber*)attendanceMarkingId date:(NSString*)date;

+ (void)createAttendanceForRosterId:(NSNumber*)rosterId teacherId:(NSNumber*)teacherId
                attendanceMarkingId:(NSNumber*)attendanceMarkingId date:(NSString*)date;

@end