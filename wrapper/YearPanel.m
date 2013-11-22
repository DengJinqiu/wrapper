//
//  YearlyView.m
//  wrapper
//
//  Created by xcode-dev on 11/21/13.
//  Copyright (c) 2013 MusicKids. All rights reserved.
//

#import "YearPanel.h"
#import "MonthButton.h"

@interface YearPanel ()

@end

@implementation YearPanel

@synthesize year = _year;

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

- (NSMutableArray*)months
{
    if (!_monthButtons) {
        _monthButtons = [[NSMutableArray alloc] init];
    }
    return _monthButtons;
}

#define HEIGHT_RADIUS 0.6

- (id)initWithYear:(NSInteger)year
{
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    screenRect.size.height = screenRect.size.width * HEIGHT_RADIUS;
    
    self = [super initWithFrame:screenRect];
    if (self) {
        self.year = year;
        
        UILabel *yearLabel = [[UILabel alloc] init];
        yearLabel.text = [NSString stringWithFormat:@"%d", self.year];
        yearLabel.frame = CGRectMake(20, 20, 40, 20);
        [self addSubview:yearLabel];
        
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
