//
//  YearlyViewController.m
//  wrapper
//
//  Created by xcode-dev on 11/20/13.
//  Copyright (c) 2013 MusicKids. All rights reserved.
//

#import "YearlyViewController.h"
#import "YearPanel.h"
#import "MonthlyViewController.h"
#import "MonthButton.h"

@interface YearlyViewController ()

@property (strong, nonatomic, readwrite) NSMutableArray *yearPanels;

@end

@implementation YearlyViewController

- (NSMutableArray*)yearPanels
{
    if (!_yearPanels) {
        _yearPanels = [[NSMutableArray alloc] init];
    }
    return _yearPanels;
}

- (void)loadView
{
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    
    NSInteger startYear = [[Schedule getInstance] startYear];
    NSInteger endYear = [[Schedule getInstance] endYear];
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:screenRect];
    scrollView.backgroundColor = [UIColor whiteColor];
    
    NSInteger scrollViewHeight = 0;
    
    for(NSInteger i = startYear; i <= endYear; i++) {
        YearPanel *yearPanel = [[YearPanel alloc] initWithYear:i];
        CGRect frame = yearPanel.frame;
        frame.origin.y = scrollViewHeight;
        yearPanel.frame = frame;
        [scrollView addSubview:yearPanel];
        [self addMonthButtonToYearPanel:yearPanel];
        [self.yearPanels addObject:yearPanel];
        scrollViewHeight += yearPanel.frame.size.height;
    }
    
    scrollView.contentSize = CGSizeMake(scrollView.frame.size.width, scrollViewHeight);
    self.view = scrollView;
}

- (void)addMonthButtonToYearPanel:(YearPanel*)yearPanel
{
    int i = 0;
    int j = 0;
    for (NSInteger month = 1; month <= 12; month++) {
        MonthButton *monthButton = [MonthButton buttonWithType:UIButtonTypeRoundedRect];
        monthButton.frame = CGRectMake(20+i*81, 60+j*40, 35, 35);
        
        [monthButton month:month year:yearPanel.year];
        
        if (month == [[Schedule getInstance].currentDate month] &&
            yearPanel.year == [[Schedule getInstance].currentDate year]) {
            monthButton.backgroundColor = [UIColor colorWithRed:1.0f
                                                          green:0.0f
                                                           blue:0.0f
                                                          alpha:0.6f];
        }
        
        [monthButton addTarget:self
                        action:@selector(navigateToMonthlyView:)
              forControlEvents:UIControlEventTouchUpInside];
        
        [yearPanel.monthButtons addObject:monthButton];
        [yearPanel addSubview:monthButton];
        if (i >= 3) {
            i = 0;
            j++;
        } else {
            i++;
        }
    }

}

- (void)navigateToMonthlyView:(MonthButton*)sender
{
    MonthlyViewController *monthlyViewController = [[MonthlyViewController alloc] init];
    
    [self.navigationController pushViewController:monthlyViewController animated:YES];
}

@end
