//
//  MonthButton.m
//  wrapper
//
//  Created by xcode-dev on 11/21/13.
//  Copyright (c) 2013 MusicKids. All rights reserved.
//

#import "MonthButton.h"
#import "CalendarLabels.h"

@implementation MonthButton

- (id)initWithYear:(NSInteger)year month:(NSInteger)month originX:(NSInteger)x originY:(NSInteger)y
{
    self = [super initWithYear:year month:month originX:x originY:y];
    if (self) {
        [self setTitle:[CalendarLabels monthLabels][self.month] forState:UIControlStateNormal];
    }
    return self;
}

@end
