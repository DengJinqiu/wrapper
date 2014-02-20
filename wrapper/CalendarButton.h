//
//  CalendarButton.h
//  wrapper
//
//  Created by Jinqiu Deng on 12/4/13.
//  Copyright (c) 2013 MusicKids. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  The button displayed on the calendar which has a label shows the date or the week day.
 */
@interface CalendarButton : UIButton

/**
 *  The month of this button, 1 => January, 2 => February ...
 */
@property (nonatomic, readonly) NSInteger month;

/**
 *  The year of this button.
 */
@property (nonatomic, readonly) NSInteger year;

/**
 *  Initialize this button with year, month and the left-up corner coordinate.
 *  @param year The year.
 *  @param month The month.
 *  @param originX The x coordinate of the left-up corner.
 *  @param originY The y coordinate of the left-up corner.
 *  @returns The button.
 */
- (id)initWithYear:(NSInteger)year month:(NSInteger)month originX:(NSInteger)x originY:(NSInteger)y;

/**
 *  Mark the button as red.
 */
- (void)markAsRed;

/**
 *  Mark this button as gray.
 */
- (void)markAsGray;

/**
 *  Mark this button as green.
 */
- (void)markAsGreen;

@end
