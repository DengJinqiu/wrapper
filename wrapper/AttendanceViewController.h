//
//  ClassViewController.h
//  wrapper
//
//  Created by Jinqiu Deng on 12/5/13.
//  Copyright (c) 2013 MusicKids. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TitleTableViewController.h"

/**
 *  The attendace view controller.
 */
@interface AttendanceViewController : TitleTableViewController

/**
 *  Initialize this panel.
 *  @param year The year.
 *  @param month The month.
 *  @param weekday The week day.
 *  @param day The day.
 *  @param courseId The courseId.
 *  @returns The controller.
 */
- (id)initWithYear:(NSInteger)year month:(NSInteger)month weekday:(NSInteger)weekday day:(NSInteger)day courseId:(NSNumber*)courseId;

@end
