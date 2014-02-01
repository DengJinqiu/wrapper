//
//  MonthlyViewController.h
//  wrapper
//
//  Created by Jinqiu Deng on 11/20/13.
//  Copyright (c) 2013 MusicKids. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SchoolCalendar.h"

/**
 *  The monthly view controller.
 */
@interface MonthlyViewController : UIViewController

/**
 *  Initialize this panel.
 *  @param startYear The year appeared at first.
 *  @param startMonth The month appeared at first.
 *  @returns The panel.
 */
- (id)initWithStartYear:(NSInteger)startYear startMonth:(NSInteger)startMonth;

@end
