//
//  ClassViewController.h
//  wrapper
//
//  Created by Jinqiu Deng on 12/5/13.
//  Copyright (c) 2013 MusicKids. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TitleTableViewController.h"
#import "Attendance.h"

@interface AttendanceViewController : TitleTableViewController

- (id)initWithDay:(NSInteger)day weekday:(NSInteger)weekday
            month:(NSInteger)month year:(NSInteger)year attendance:(Attendance*)attendance;

@end
