//
//  ClassAttendance.h
//  wrapper
//
//  Created by Jinqiu Deng on 12/6/13.
//  Copyright (c) 2013 MusicKids. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  The course.
 */
@interface Course : NSObject

/**
 *  Initialize the course.
 *  @param courseId The course Id.
 *  @param courseName The course name.
 *  @param schoolName The school name.
 *  @param instrumentName The instrument name.
 *  @param programType The program type.
 *  @param courseType The course type.
 *  @returns The course.
 */
- (instancetype)initWithCourseId:(NSNumber*)courseId courseName:(NSString*)courseName
              schoolName:(NSString*)schoolName instrumentName:(NSString*)instrumentName
             programType:(NSString*)programType courseType:(NSString*)courseType;

/**
 *  The course id.
 */
@property (nonatomic) NSNumber* courseId;

/**
 *  The course name.
 */
@property (nonatomic) NSString* courseName;

/**
 *  The school name.
 */
@property (nonatomic) NSString* schoolName;

/**
 *  The instrument name.
 */
@property (nonatomic) NSString* instrumentName;

/**
 *  The program type.
 */
@property (nonatomic) NSString* programType;

/**
 *  The course type.
 */
@property (nonatomic) NSString* courseType;

@end
