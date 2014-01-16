//
//  CourseSchedule.h
//  wrapper
//
//  Created by Jinqiu Deng on 12/6/13.
//  Copyright (c) 2013 MusicKids. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Course;

@interface Attendance : NSObject

@property (nonatomic) NSMutableDictionary* studentAttendance;

@property (weak, nonatomic) Course* course;

@property (nonatomic, readonly) NSInteger startHour; // hour

@property (nonatomic, readonly) NSInteger startMin;  // minute

@property (nonatomic, readonly) NSInteger duration;  // minute

- (id)initWithStartHour:(NSInteger)hour startMin:(NSInteger)min duration:(NSInteger)duration course:(Course*)course;

- (void)markStudent:(NSString*)id attendance:(BOOL)attendance;

@end
