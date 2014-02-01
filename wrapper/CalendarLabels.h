//
//  CalendarLabels.h
//  wrapper
//
//  Created by Jinqiu Deng on 12/4/13.
//  Copyright (c) 2013 MusicKids. All rights reserved.
//

#import <Foundation/Foundation.h>

/** 
 *  The name of each month and week day, full name and abbreviation.
 */
@interface CalendarLabels : NSObject

/**
 *  The abbreviation of each month.
 *  @returns The abbreviation of each month.
 */
+ (NSArray*)monthLabels;

/**
 *  The full name of each month.
 *  @returns The full name of each month.
 */
+ (NSArray*)monthFullNames;

/**
 *  The abbreviation of each week day.
 *  @returns The abbreviation of each week day.
 */
+ (NSArray*)weekdayLabels;

/**
 *  The full name of each week day.
 *  @returns The full name of each week day.
 */
+ (NSArray*)weekdayFullNames;

@end
