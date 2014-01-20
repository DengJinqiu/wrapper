//
//  Schedule.h
//  wrapper
//
//  Created by Jinqiu Deng on 1/19/14.
//  Copyright (c) 2014 MusicKids. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Course.h"

@interface Schedule : NSObject

+ (void)addWithCourseId:(NSNumber*)courseId;

+ (NSInteger)coursesNum;

+ (NSArray*)coursesOnYear:(NSInteger)year month:(NSInteger)month day:(NSInteger)day;

+ (void)clearCourses;

+ (BOOL)hasCourseOnYear:(NSInteger)year month:(NSInteger)month;

+ (BOOL)hasCourseOnYear:(NSInteger)year month:(NSInteger)month day:(NSInteger)day;

@end
