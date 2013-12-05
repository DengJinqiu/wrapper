//
//  CalendarButton.m
//  wrapper
//
//  Created by Jinqiu Deng on 12/4/13.
//  Copyright (c) 2013 MusicKids. All rights reserved.
//

#import "CalendarButton.h"

#define SIZE 35

@interface CalendarButton ()

@property (nonatomic, readonly) UIColor *defaultTitleColor;

@end

@implementation CalendarButton

@synthesize defaultTitleColor = _defaultTitleColor;

- (id)initWithYear:(NSInteger)year month:(NSInteger)month originX:(NSInteger)x originY:(NSInteger)y
{
    self = [super initWithFrame:CGRectMake(x, y, SIZE, SIZE)];
    if (self) {
        [self setTitleColor:self.defaultTitleColor forState:UIControlStateNormal];
        self.titleLabel.font = [UIFont systemFontOfSize:14];
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.frame = CGRectMake(x, y, SIZE, SIZE);
        self.layer.cornerRadius = SIZE / 2;
        _month = month;
        _year = year;
    }
    return self;
}

- (void)markAsCurrent
{
    self.backgroundColor = [UIColor colorWithRed:1.0f green:0.0f
                                            blue:0.0f alpha:0.6f];
    [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.titleLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:14];
}

- (UIColor*)defaultTitleColor
{
    if (!_defaultTitleColor) {
        _defaultTitleColor = [[UIButton buttonWithType:UIButtonTypeRoundedRect] titleColorForState:UIControlStateNormal];
    }
    return _defaultTitleColor;
}

@end
