//
//  SchoolCalendar.h
//  wrapper
//
//  Created by Jinqiu Deng on 11/20/13.
//  Copyright (c) 2013 MusicKids. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  The calendar.
 */
@interface SchoolCalendar : NSObject

/**
 *  Get a instance of calendar.
 */
+ (SchoolCalendar*)getInstance;

/**
 *  Get the current date.
 *  @returns The current date.
 */
- (NSDateComponents*)currentDate;

/**
 *  The date component on one day.
 *  @param year The year.
 *  @param month The month.
 *  @param day The day.
 *  @returns The date.
 */
- (NSDateComponents*)year:(NSInteger)year month:(NSInteger)month day:(NSInteger)day;

@end