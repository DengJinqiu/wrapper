//
//  YearlyViewController.h
//  wrapper
//
//  Created by xcode-dev on 11/20/13.
//  Copyright (c) 2013 MusicKids. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MonthButton.h"
#import "Calendar.h"

@interface YearlyViewController : UIViewController

- (void)navigateToMonthlyView:(MonthButton*)sender;

- (instancetype)initWithCalendar:(Calendar*)calendar;

@end
