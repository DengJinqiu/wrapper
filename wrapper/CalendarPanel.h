//
//  CalendarPanel.h
//  wrapper
//
//  Created by Jinqiu Deng on 12/4/13.
//  Copyright (c) 2013 MusicKids. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  The calendar panel represent a panel on calender.
 */
@interface CalendarPanel : UIView

/**
 *  The year of this panel.
 */
@property (nonatomic, readonly) NSInteger year;

/**
 *  The buttons on this panel.
 */
@property (nonatomic) NSMutableArray *calendarButtons;

/**
 *  Initialize this panel.
 *  @param year The year.
 *  @param originY The y coordinate of this panel.
 *  @returns The panel
 */
- (id)initWithYear:(NSInteger)year originY:(NSInteger)y;

/**
 *  The label of this panel.
 */
- (UILabel*) panelLabel;

@end
