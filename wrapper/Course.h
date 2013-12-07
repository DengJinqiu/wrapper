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

@property (nonatomic) NSString* id;

@property (nonatomic) NSString* courseName;

@property (nonatomic) NSString* schoolName;

- (id)initWithCourseName:(NSString*)courseName schoolName:(NSString*)schoolName id:(NSString*)id;

- (BOOL)hasScheduleOnYear:(NSInteger)year month:(NSInteger)month;

- (Attendance*)attendanceOnYear:(NSInteger)year month:(NSInteger)month day:(NSInteger)day;

- (Attendance*)setAttendanceOnYear:(NSInteger)year month:(NSInteger)month day:(NSInteger)day
                                at:(NSInteger)startTime last:(NSInteger)duration;

+ (Course*)getCourseById:(NSString*)id;

+ (NSMutableDictionary*)courseIds;

@end
