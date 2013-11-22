//
//  MonthlyViewController.h
//  wrapper
//
//  Created by Jinqiu Deng on 11/20/13.
//  Copyright (c) 2013 MusicKids. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Calendar.h"

@interface MonthlyViewController : UIViewController


- (instancetype)initWithCalendar:(Calendar*)calendar
                  yearNavigateTo:(NSInteger)year monthNavigateTo:(NSInteger)month;

@end
