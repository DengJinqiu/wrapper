//
//  MonthlyView.m
//  wrapper
//
//  Created by xcode-dev on 11/21/13.
//  Copyright (c) 2013 MusicKids. All rights reserved.
//

#import "MonthPanel.h"
#import "MonthButton.h"

@implementation MonthPanel

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

#define HEIGHT_RADIUS 1

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
        
        UIView *line = [[UIView alloc] init];
        line.frame = CGRectMake(20, 50, 280, 2);
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
