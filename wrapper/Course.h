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

- (instancetype)initWithCourseId:(NSNumber*)courseId courseName:(NSString*)courseName
              schoolName:(NSString*)schoolName instrumentName:(NSString*)instrumentName
             programType:(NSString*)programType courseType:(NSString*)courseType;

@property (nonatomic) NSNumber* courseId;

@property (nonatomic) NSString* courseName;

@property (nonatomic) NSString* schoolName;

@property (nonatomic) NSString* instrumentName;

@property (nonatomic) NSString* programType;

@property (nonatomic) NSString* courseType;

@end
