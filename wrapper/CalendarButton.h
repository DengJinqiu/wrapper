//
//  CalendarButton.h
//  wrapper
//
//  Created by Jinqiu Deng on 12/4/13.
//  Copyright (c) 2013 MusicKids. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  The calendar button.
 */
@interface CalendarButton : UIButton

/**
 *  The month of this button.
 */
@property (nonatomic, readonly) NSInteger month;

/**
 *  The year of this button.
 */
@property (nonatomic, readonly) NSInteger year;

/**
 *  Initialize this button.
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
