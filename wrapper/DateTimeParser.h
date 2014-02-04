//
//  DateTimeParser.h
//  wrapper
//
//  Created by Jinqiu Deng on 1/19/14.
//  Copyright (c) 2014 MusicKids. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  The date time parser a string and get the year, month, day, hour and minute from it.
 */
@interface DateTimeParser : NSObject

/**
 *  Get the year from a string.
 *  @param time The string represent the time.
 *  @returns The year.
 */
+ (NSInteger)year:(NSString*)time;

/**
 *  Get the month from a string.
 *  @param time The string represent the time.
 *  @returns The month.
 */
+ (NSInteger)month:(NSString*)time;

/**
 *  Get the day from a string.
 *  @param time The string represent the time.
 *  @returns The day.
 */
+ (NSInteger)day:(NSString*)time;

/**
 *  Get the hour from a string.
 *  @param time The string represent the time.
 *  @returns The hour.
 */
+ (NSInteger)hour:(NSString*)time;

/**
 *  Get the minute from a string.
 *  @param time The string represent the time.
 *  @returns The minute.
 */
+ (NSInteger)min:(NSString*)time;

@end
