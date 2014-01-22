//
//  ClassAttendance.m
//  wrapper
//
//  Created by Jinqiu Deng on 12/6/13.
//  Copyright (c) 2013 MusicKids. All rights reserved.
//

#import "Course.h"

@implementation Course

- (instancetype)initWithCourseId:(NSNumber *)courseId courseName:(NSString *)courseName
              schoolName:(NSString *)schoolName instrumentName:(NSString *)instrumentName
             programType:(NSString *)programType courseType:(NSString *)courseType
{
    self.courseId = courseId;
    self.courseName = courseName;
    self.schoolName = schoolName;
    self.instrumentName = instrumentName;
    self.programType = programType;
    self.courseType = courseType;
    return self;
}

@end