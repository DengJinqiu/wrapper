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
#import "Term.h"
#import "Schedule.h"

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
    
    NSInteger startYear = [[Term getInstance] startYear];
    NSInteger endYear = [[Term getInstance] endYear];
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:screenRect];
    scrollView.backgroundColor = [UIColor whiteColor];
    
    NSInteger scrollViewHeight = 0;
    
    for(NSInteger i = startYear; i <= endYear; i++) {
        YearPanel *yearPanel = [[YearPanel alloc] initWithYear:i originY:scrollViewHeight];
        
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
        MonthButton *monthButton = [[MonthButton alloc] initWithYear:yearPanel.year
                                                               month:month originX:i*81+20 originY:j*40+60];
    
        if (month == [[SchoolCalendar getInstance].currentDate month] &&
            yearPanel.year == [[SchoolCalendar getInstance].currentDate year]) {
            [monthButton markAsRed];
        }
        
        if ([Schedule hasCourseOnYear:yearPanel.year month:month]) {
            [monthButton markAsGreen];
            
        }
        
        [monthButton addTarget:self
                        action:@selector(navigateToMonthlyView:)
              forControlEvents:UIControlEventTouchUpInside];
        
        [yearPanel.calendarButtons addObject:monthButton];
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
    MonthlyViewController *monthlyViewController = [[MonthlyViewController alloc]initWithStartYear:sender.year startMonth:sender.month];
    
    [self.navigationController pushViewController:monthlyViewController animated:YES];
}

@end
