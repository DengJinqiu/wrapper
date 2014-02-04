//
//  MonthlyView.h
//  wrapper
//
//  Created by xcode-dev on 11/21/13.
//  Copyright (c) 2013 MusicKids. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CalendarPanel.h"

@interface MonthPanel : CalendarPanel

/**
 *  The panel of one month on the monthly calendar.
 */
@property (nonatomic, readonly) NSInteger month;

/**
 *  Initialize this panel
 *  @param year The year.
 *  @param month The month.
 *  @param originY The y coordinate of this panel.
 *  @returns The panel.
 */
- (id)initWithYear:(NSInteger)year month:(NSInteger)month originY:(NSInteger)y;

@end
