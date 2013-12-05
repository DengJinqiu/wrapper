//
//  DayButton.h
//  wrapper
//
//  Created by xcode-dev on 11/21/13.
//  Copyright (c) 2013 MusicKids. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CalendarButton.h"

@interface DayButton : CalendarButton

@property (nonatomic) NSInteger day;

@property (nonatomic) NSInteger weekday;

- (id)initWithYear:(NSInteger)year month:(NSInteger)month weekday:(NSInteger)weekday
               day:(NSInteger)day originX:(NSInteger)x originY:(NSInteger)y;

@end
