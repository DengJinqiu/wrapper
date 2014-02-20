//
//  YearlyViewController.h
//  wrapper
//
//  Created by xcode-dev on 11/20/13.
//  Copyright (c) 2013 MusicKids. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MonthButton.h"
#import "SchoolCalendar.h"

/**
 *  The yearly view controller which lists the months during the term.
 */
@interface YearlyViewController : UIViewController

/**
 *  Navigate to the monthly view.
 *  @param sender The button trigger the navigation.
 */
- (void)navigateToMonthlyView:(MonthButton*)sender;

@end
