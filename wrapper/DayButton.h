//
//  DayButton.h
//  wrapper
//
//  Created by xcode-dev on 11/21/13.
//  Copyright (c) 2013 MusicKids. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CalendarButton.h"

/**
 *  The day button represent a day on the monthly view calendar.
 */
@interface DayButton : CalendarButton

/**
 *  The day of this button.
 */
@property (nonatomic) NSInteger day;

/**
 *  The week day of this button.
 */
@property (nonatomic) NSInteger weekday;

/**
 *  Initialize this button.
 *  @param year The year.
 *  @param month The month.
 *  @param weekday The week day.
 *  @param day The day.
 *  @param originX The x coordinate of the left-up corner.
 *  @param originY The y coordinate of the left-up corner.
 *  @returns The button.
 */
- (id)initWithYear:(NSInteger)year month:(NSInteger)month weekday:(NSInteger)weekday
               day:(NSInteger)day originX:(NSInteger)x originY:(NSInteger)y;

@end
