//
//  DateTimeParser.h
//  wrapper
//
//  Created by Jinqiu Deng on 1/19/14.
//  Copyright (c) 2014 MusicKids. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  The date time pareser.
 */
@interface DateTimeParser : NSObject

/**
 *  Get the year from a string.
 *  @param time The time
 *  @returns The year.
 */
+ (NSInteger)year:(NSString*)time;

/**
 *  Get the month from a string.
 *  @param time The time
 *  @returns The month.
 */
+ (NSInteger)month:(NSString*)time;

/**
 *  Get the day from a string.
 *  @param time The time
 *  @returns The day.
 */
+ (NSInteger)day:(NSString*)time;

/**
 *  Get the hour from a string.
 *  @param time The time
 *  @returns The hour.
 */
+ (NSInteger)hour:(NSString*)time;

/**
 *  Get the minutes from a string.
 *  @param time The time
 *  @returns The minutes.
 */
+ (NSInteger)min:(NSString*)time;

@end
