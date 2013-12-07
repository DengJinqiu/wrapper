//
//  ClassAttendance.h
//  wrapper
//
//  Created by Jinqiu Deng on 12/6/13.
//  Copyright (c) 2013 MusicKids. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Attendance.h"

@interface Course : NSObject

@property (nonatomic) NSString* id;

@property (nonatomic) NSString* courseName;

@property (nonatomic) NSString* schoolName;

- (id)initWithCourseName:(NSString*)courseName schoolName:(NSString*)schoolName id:(NSString*)id;

- (BOOL)hasScheduleOnYear:(NSInteger)year month:(NSInteger)month;

- (Attendance*)scheduleOnYear:(NSInteger)year month:(NSInteger)month day:(NSInteger)day;

- (Attendance*)setScheduleeOnYear:(NSInteger)year month:(NSInteger)month day:(NSInteger)day
                        at:(NSInteger)startTime last:(NSInteger)duration;

+ (Course*)getCourseById:(NSString*)id;

+ (NSMutableDictionary*)courses;

@end
