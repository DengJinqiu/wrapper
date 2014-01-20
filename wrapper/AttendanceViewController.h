//
//  ClassViewController.h
//  wrapper
//
//  Created by Jinqiu Deng on 12/5/13.
//  Copyright (c) 2013 MusicKids. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TitleTableViewController.h"

@interface AttendanceViewController : TitleTableViewController

- (id)initWithYear:(NSInteger)year month:(NSInteger)month weekday:(NSInteger)weekday
               day:(NSInteger)day;

@end
