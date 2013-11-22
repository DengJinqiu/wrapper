//
//  MonthlyView.m
//  wrapper
//
//  Created by xcode-dev on 11/21/13.
//  Copyright (c) 2013 MusicKids. All rights reserved.
//

#import "MonthlyView.h"

@interface MonthlyView ()

@property (assign, nonatomic, readwrite) NSInteger year;

@property (assign, nonatomic, readwrite) NSInteger month;

@property (weak, nonatomic, readwrite) id delegate;

@end

@implementation MonthlyView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (NSArray*)monthLabels
{
    return @[@"JAN", @"FEB", @"MAR", @"APR", @"MAY", @"JUN",
             @"JUL", @"AUG", @"SEP", @"OCT", @"NOV", @"DEC"];
}

#define HEIGHT_RADIUS 0.6

- (instancetype)initWithYear:(NSInteger)year month:(NSInteger)month
             index:(NSInteger)index delegate:(id)delegate
{
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    screenRect.size.height = screenRect.size.width * HEIGHT_RADIUS;
    screenRect.origin.y = index * screenRect.size.height;
    
    self = [super initWithFrame:screenRect];
    if (self) {
        self.year = year;
        self.month = month;
        self.delegate = delegate;
        
        UILabel *yearLabel = [[UILabel alloc] init];
        yearLabel.text = [NSString stringWithFormat:@"%d", self.month];
        yearLabel.frame = CGRectMake(20, 20, 40, 20);
        [self addSubview:yearLabel];
        
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
