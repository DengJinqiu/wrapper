//
//  MonthButton.m
//  wrapper
//
//  Created by xcode-dev on 11/21/13.
//  Copyright (c) 2013 MusicKids. All rights reserved.
//

#import "MonthButton.h"

@implementation MonthButton

- (void)setMonth:(NSInteger)month
{
    _month = month;
}

- (void)setYear:(NSInteger)year
{
    _year = year;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)month:(NSInteger)month year:(NSInteger)year
{
    self.month = month;
    self.year = year;

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
