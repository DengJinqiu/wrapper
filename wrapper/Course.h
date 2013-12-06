//
//  ClassAttendance.h
//  wrapper
//
//  Created by Jinqiu Deng on 12/6/13.
//  Copyright (c) 2013 MusicKids. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CourseSchedule.h"

@interface Course : NSObject

@property (nonatomic) NSDateComponents* startDate;

@property (nonatomic) NSDateComponents* endDate;

@property (nonatomic) NSString* className;

@property (nonatomic) NSString* schoolName;

@property (nonatomic) CourseSchedule* schedule;

@end
