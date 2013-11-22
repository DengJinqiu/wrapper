//
//  YearlyView.m
//  wrapper
//
//  Created by xcode-dev on 11/21/13.
//  Copyright (c) 2013 MusicKids. All rights reserved.
//

#import "YearlyView.h"
#import "MonthButton.h"

@interface YearlyView ()

@property (strong, nonatomic, readwrite) NSMutableArray *monthButtons;

@property (readwrite, nonatomic, assign) NSInteger year;

@property (readwrite, nonatomic, weak) id delegate;

@end

@implementation YearlyView

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

- (NSArray*)monthLabels
{
    return @[@"JAN", @"FEB", @"MAR", @"APR", @"MAY", @"JUN",
             @"JUL", @"AUG", @"SEP", @"OCT", @"NOV", @"DEC"];
}

#define HEIGHT_RADIUS 0.6

- (id)initWithYear:(NSInteger)year index:(NSInteger)index delegate:(id)delegate
{
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    screenRect.size.height = screenRect.size.width * HEIGHT_RADIUS;
    screenRect.origin.y = index * screenRect.size.height;
    
    self = [super initWithFrame:screenRect];
    if (self) {
        self.year = year;
        self.delegate = delegate;
        
        UILabel *yearLabel = [[UILabel alloc] init];
        yearLabel.text = [NSString stringWithFormat:@"%d", self.year];
        yearLabel.frame = CGRectMake(20, 20, 40, 20);
        [self addSubview:yearLabel];
        
        UIView *line = [[UIView alloc] init];
        line.frame = CGRectMake(20, 50, 280, 2);
        line.backgroundColor = [UIColor blackColor];
        [self addSubview:line];
        
        int i = 0;
        int j = 0;
        NSInteger month = 1;
        for (NSString* label in [self monthLabels]) {
            MonthButton *monthButton = [MonthButton buttonWithType:UIButtonTypeRoundedRect];
            monthButton.frame = CGRectMake(20+i*81, 60+j*40, 35, 35);
 
            [monthButton setTitle:label forState:UIControlStateNormal];
            [monthButton month:month year:self.year];
            
            SEL selector = sel_registerName("navigateToMonthlyView:");
            [monthButton addTarget:delegate
                            action:selector
                  forControlEvents:UIControlEventTouchUpInside];

            [self.monthButtons addObject:monthButton];
            [self addSubview:monthButton];
            if (i >= 3) {
                i = 0;
                j++;
            } else {
                i++;
            }
            month++;
        }
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
