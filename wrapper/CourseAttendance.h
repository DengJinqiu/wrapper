//
//  CourseSchedule.h
//  wrapper
//
//  Created by Jinqiu Deng on 12/6/13.
//  Copyright (c) 2013 MusicKids. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CourseAttendance : NSObject

@property (nonatomic, readonly) NSMutableDictionary* attendance;

@property (nonatomic, readonly) NSInteger startTime; // hour

@property (nonatomic, readonly) NSInteger duration; // minute

- (id)initWithStartTime:(NSInteger)startTime duration:(NSInteger)duration students:(NSMutableDictionary*)students;

@end
