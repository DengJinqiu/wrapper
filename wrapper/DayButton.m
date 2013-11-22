//
//  DayButton.m
//  wrapper
//
//  Created by xcode-dev on 11/21/13.
//  Copyright (c) 2013 MusicKids. All rights reserved.
//

#import "DayButton.h"

@implementation DayButton

@synthesize day = _day;
@synthesize month = _month;
@synthesize year = _year;
@synthesize weekday = _weekday;

- (void)setDay:(NSInteger)day
{
    _day = day;
}

- (void)setMonth:(NSInteger)month
{
    _month = month;
}

- (void)setYear:(NSInteger)year
{
    _year = year;
}

- (void)setWeekday:(NSInteger)weekday
{
    _weekday = weekday;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)year:(NSInteger)year month:(NSInteger)month
     weekday:(NSInteger)weekday day:(NSInteger)day
{
    self.day = day;
    self.weekday = weekday;
    self.month = month;
    self.year = year;
    [self setTitle:[NSString stringWithFormat:@"%d", day] forState:UIControlStateNormal];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
