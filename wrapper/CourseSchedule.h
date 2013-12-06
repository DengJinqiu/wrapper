//
//  CourseSchedule.h
//  wrapper
//
//  Created by Jinqiu Deng on 12/6/13.
//  Copyright (c) 2013 MusicKids. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CourseSchedule : NSObject

@property (nonatomic) NSDictionary* studentsAttendance;

@property (nonatomic) NSDateComponents* startTime;

@property (nonatomic) NSDateComponents* duration;

@end
