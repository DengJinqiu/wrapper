//
//  Schedule.h
//  wrapper
//
//  Created by Jinqiu Deng on 1/19/14.
//  Copyright (c) 2014 MusicKids. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Course.h"

/**
 *  The schedule of all the courses.
 */
@interface Schedule : NSObject

/**
 *  Add a course.
 *  @param course The course.
 */
+ (void)addCourse:(Course*)course;

/**
 *  Get a course of an id
 *  @param courseId The course id.
 *  @returns The course.
 */
+ (Course*)courseOfId:(NSNumber*)courseId;

/**
 *  Get the number of courses.
 *  @returns The number of courses.
 */
+ (NSInteger)coursesNum;

/**
 *  Clear the schedule.
 */
+ (void)clearSchedule;

/**
 *  Add the course on the year, month and day.
 *  @param courseId The course id.
 *  @param year The year.
 *  @param month The month.
 *  @param day The day.
 */
+ (void)addScheduleForCourse:(NSNumber*)courseId onYear:(NSInteger)year month:(NSInteger)month andDay:(NSInteger)day;

/**
 *  Get the course on the year, month and day.
 *  @param year The year.
 *  @param month The month.
 *  @param day The day.
 *  @returns The courses.
 */
+ (NSMutableArray*)coursesOnYear:(NSInteger)year month:(NSInteger)month day:(NSInteger)day;

/**
 *  Whether there is a course on the year and month.
 *  @param year The year.
 *  @param month The month.
 *  @returns Whether there is a course on one month.
 */
+ (BOOL)hasCourseOnYear:(NSInteger)year month:(NSInteger)month;

/**
 *  Whether there is a course on the year, month and day.
 *  @param year The year.
 *  @param month The month.
 *  @param day The day.
 *  @returns Whether there is a course on one day.
 */
+ (BOOL)hasCourseOnYear:(NSInteger)year month:(NSInteger)month day:(NSInteger)day;

@end
