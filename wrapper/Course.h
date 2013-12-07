//
//  ClassAttendance.h
//  wrapper
//
//  Created by Jinqiu Deng on 12/6/13.
//  Copyright (c) 2013 MusicKids. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CourseAttendance.h"

@interface Course : NSObject

@property (nonatomic) NSString* courseName;

@property (nonatomic) NSString* schoolName;

- (BOOL)hasScheduleOnYear:(NSInteger)year month:(NSInteger)month;

- (CourseAttendance*)scheduleOnYear:(NSInteger)year month:(NSInteger)month day:(NSInteger)day;

- (void)setScheduleeOnYear:(NSInteger)year month:(NSInteger)month day:(NSInteger)day
                        at:(NSInteger)startTime last:(NSInteger)duration students:(NSMutableDictionary*)students;

@end
