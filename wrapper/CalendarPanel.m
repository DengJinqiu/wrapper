//
//  CalendarPanel.m
//  wrapper
//
//  Created by Jinqiu Deng on 12/4/13.
//  Copyright (c) 2013 MusicKids. All rights reserved.
//

#import "CalendarPanel.h"

@implementation CalendarPanel

static const CGFloat HEIGHT_RADIUS = 0.6;

- (UILabel*) panelLabel
{
    UILabel *label = [[UILabel alloc] init];
    label.frame = CGRectMake(20, 20, 40, 20);
    [self addSubview:label];
    return label;
}

- (id)initWithYear:(NSInteger)year originY:(NSInteger)y
{
    NSInteger width = [[UIScreen mainScreen] bounds].size.width;
    self = [super initWithFrame:CGRectMake(0, y, width, width*HEIGHT_RADIUS)];
    if (self) {
        _year = year;

        [self panelLabel];
        
        UIView *line = [[UIView alloc] init];
        line.frame = CGRectMake(20, 50, 280, 1);
        line.backgroundColor = [UIColor blackColor];
        [self addSubview:line];
    }
    return self;
}

- (NSMutableArray*)calendarButtons
{
    if (!_calendarButtons) {
        _calendarButtons = [[NSMutableArray alloc] init];
    }
    return _calendarButtons;
}

@end
