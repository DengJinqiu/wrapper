//
//  DayButton.m
//  wrapper
//
//  Created by xcode-dev on 11/21/13.
//  Copyright (c) 2013 MusicKids. All rights reserved.
//

#import "DayButton.h"

@implementation DayButton

- (id)initWithYear:(NSInteger)year month:(NSInteger)month weekday:(NSInteger)weekday
               day:(NSInteger)day originX:(NSInteger)x originY:(NSInteger)y
{
    self = [super initWithYear:year month:month originX:x originY:y];
    if (self) {
        _weekday = weekday;
        _day = day;
        [self setTitle:[NSString stringWithFormat:@"%ld", (long)self.day] forState:UIControlStateNormal];
    }
    return self;
}

@end
