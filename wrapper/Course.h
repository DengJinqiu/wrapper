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

@property (nonatomic) NSString* courseName;

@property (nonatomic) NSString* schoolName;

@property (nonatomic) NSMutableArray* schedule;

@end
