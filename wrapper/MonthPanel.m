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

@implementation MonthPanel

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

#define HEIGHT_RADIUS 0.9

- (instancetype)initWithYear:(NSInteger)year month:(NSInteger)month
{
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    screenRect.size.height = screenRect.size.width * HEIGHT_RADIUS;
    
    self = [super initWithFrame:screenRect];
    if (self) {
        self.year = year;
        self.month = month;
        
        UILabel *monthLabel = [[UILabel alloc] init];
        monthLabel.text = [MonthButton monthLabels][self.month];
        monthLabel.frame = CGRectMake(20, 20, 40, 20);
        [self addSubview:monthLabel];
        
        int i = 0;
        for (NSString *s in [DayButton weekdayLabels]) {
            UILabel *weekdayLabel = [[UILabel alloc] init];
            weekdayLabel.text = s;
            weekdayLabel.frame = CGRectMake(i*40-20, 40, 35, 10);
            weekdayLabel.textAlignment = NSTextAlignmentCenter;
            [weekdayLabel setFont:[UIFont systemFontOfSize:9]];
            [self addSubview:weekdayLabel];
            i++;
        }
        
        UIView *line = [[UIView alloc] init];
        line.frame = CGRectMake(20, 50, 280, 1);
        line.backgroundColor = [UIColor blackColor];
        [self addSubview:line];
    }
    return self;
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
