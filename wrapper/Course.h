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

@property (nonatomic) NSString* courseId;

@property (nonatomic) NSString* courseName;

@property (nonatomic) NSString* schoolName;

+ (void)addWithCourseName:(NSString*)courseName schoolName:(NSString*)schoolName courseId:(NSString*)courseId;

- (BOOL)hasScheduleOnYear:(NSInteger)year month:(NSInteger)month;

- (Attendance*)attendanceOnYear:(NSInteger)year month:(NSInteger)month day:(NSInteger)day;

- (Attendance*)setAttendanceOnYear:(NSInteger)year month:(NSInteger)month day:(NSInteger)day
                              hour:(NSInteger)hour min:(NSInteger)min duration:(NSInteger)duration;

+ (Course*)getCourseById:(NSString*)id;

+ (NSMutableDictionary*)courseIds;

+ (void)clearCourseIds;

@end
