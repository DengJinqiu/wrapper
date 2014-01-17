//
//  ClassAttendance.h
//  wrapper
//
//  Created by Jinqiu Deng on 12/6/13.
//  Copyright (c) 2013 MusicKids. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Attendance;

@interface Course : NSObject

@property (nonatomic) NSNumber* courseId;

@property (nonatomic) NSString* courseName;

@property (nonatomic) NSString* schoolName;

+ (void)addWithCourseName:(NSString*)courseName schoolName:(NSString*)schoolName courseId:(NSNumber*)courseId;

- (BOOL)hasScheduleOnYear:(NSInteger)year month:(NSInteger)month;

- (Attendance*)attendanceOnYear:(NSInteger)year month:(NSInteger)month day:(NSInteger)day;

- (Attendance*)setAttendanceOnYear:(NSInteger)year month:(NSInteger)month day:(NSInteger)day
                              hour:(NSInteger)hour min:(NSInteger)min duration:(NSInteger)duration;

+ (Course*)getCourse:(NSNumber*)courseId;

+ (NSMutableDictionary*)courseIds;

+ (void)clearCourseIds;

@end
