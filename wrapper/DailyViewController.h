//
//  DailyViewController.h
//  wrapper
//
//  Created by xcode-dev on 11/22/13.
//  Copyright (c) 2013 MusicKids. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SchoolCalendar.h"
#import "TitleTableViewController.h"

/**
 *  The daily view controller.
 */
@interface DailyViewController : TitleTableViewController

/**
 *  Initialzie this controller.
 *  @param year The year.
 *  @param month The month.
 *  @param weekday The week day.
 *  @param day The day.
 *  @returns The controller.
 */
- (id)initWithYear:(NSInteger)year month:(NSInteger)month weekday:(NSInteger)weekday day:(NSInteger)day;

@end
