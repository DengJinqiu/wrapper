//
//  AttendanceMarking.h
//  wrapper
//
//  Created by Jinqiu Deng on 1/27/14.
//  Copyright (c) 2014 MusicKids. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  The attendace marking.
 */
@interface AttendanceMarking : NSObject

/**
 *  The attendance marking id.
 */
@property (nonatomic) NSNumber* attendanceMarkingId;

/**
 *  The abbreviation of attendance marking.
 */
@property (nonatomic) NSString* abbrev;

/**
 *  The full name of attendance marking.
 */
@property (nonatomic) NSString* name;

/**
 *  The attendance marking of an attendance marking id.
 *  @param attendanceMarkingId attendance marking id.
 *  @returns The attendance marking.
 */
+ (AttendanceMarking*)attendanceMarkingWithId:(NSNumber*)attendanceMarkingId;

/**
 *  The attendance marking of an attendance marking index.
 *  @param index The index.
 *  @returns The attendance marking.
 */
+ (AttendanceMarking*)attendanceMarkingWithIndex:(NSInteger)index;

/**
 *  Add attendance marking.
 *  @param attendanceMarking The attendance marking.
 */
+ (void)addAttendanceMarking:(AttendanceMarking*)attendanceMarking;

/**
 *  Clear all the attendance marking.
 */
+ (void)clearAttendanceMarkings;

/**
 *  The number of attendance marking.
 *  @returns The number.
 */
+ (NSInteger)attendanceMarkingsCount;

/**
 *  Get the index of id.
 *  @param attendanceMarkingId The attendance marking id.
 *  @returns The index.
 */
+ (NSInteger)idToIndex:(NSNumber*)attendanceMarkingId;

/**
 *  Initialize the attendance marking
 *  @param attendanceMarkingId The attendance marking id.
 *  @param abbrev The abbrevation.
 *  @param name The full name.
 *  @returns The attendance marking.
 */
- (instancetype)initWithAttendanceMarkingId:(NSNumber*)attendanceMarkingId abbrev:(NSString*)abbrev name:(NSString*)name;

@end
