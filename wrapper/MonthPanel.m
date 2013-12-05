//
//  MonthlyView.m
//  wrapper
//
//  Created by xcode-dev on 11/21/13.
//  Copyright (c) 2013 MusicKids. All rights reserved.
//

#import "MonthPanel.h"
#import "MonthButton.h"
#import "DayButton.h"
#import "CalendarLabels.h"

@implementation MonthPanel

- (id)initWithYear:(NSInteger)year month:(NSInteger)month originY:(NSInteger)y
{
    self = [super initWithYear:year originY:y];
    if (self) {
        _month = month;
        
        int i = 0;
        for (NSString *s in [CalendarLabels weekdayLabels]) {
            UILabel *weekdayLabel = [[UILabel alloc] init];
            weekdayLabel.text = s;
            weekdayLabel.frame = CGRectMake(i*40-20, 40, 35, 10);
            weekdayLabel.textAlignment = NSTextAlignmentCenter;
            [weekdayLabel setFont:[UIFont systemFontOfSize:9]];
            [self addSubview:weekdayLabel];
            i++;
        }
        
        [[self panelLabel] setText:[CalendarLabels monthLabels][self.month]];
    }
    return self;
}

@end
