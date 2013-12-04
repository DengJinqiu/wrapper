//
//  MonthlyViewController.m
//  wrapper
//
//  Created by Jinqiu Deng on 11/20/13.
//  Copyright (c) 2013 MusicKids. All rights reserved.
//

#import "MonthlyViewController.h"
#import "DailyViewController.h"
#import "MonthPanel.h"
#import "DayButton.h"
#import "MonthButton.h"

@interface MonthlyViewController () <UIScrollViewDelegate>

@property (strong, nonatomic, readwrite) NSMutableArray *monthPanels;

@end

@implementation MonthlyViewController

- (void)loadView
{
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    
    NSInteger startYear = [Schedule getInstance].startYear;
    NSInteger endYear = [Schedule getInstance].endYear;
    NSInteger currentYear = [Schedule getInstance].currentDate.year;
    NSInteger currentMonth = [Schedule getInstance].currentDate.month;
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:screenRect];
    scrollView.backgroundColor = [UIColor whiteColor];
    
    NSInteger scrollViewHeight = 0;
    
    CGPoint pointScrollTo = CGPointMake(0, 0);
    
    NSInteger index = 0;
    for(NSInteger i = startYear; i <= endYear; i++) {
        for (NSInteger j = 1; j <= 12; j++) {

            MonthPanel *monthPanel = [[MonthPanel alloc] initWithYear:i month:j];
            CGRect frame = monthPanel.frame;
            frame.origin.y = scrollViewHeight;
            monthPanel.frame = frame;
            [scrollView addSubview:monthPanel];
            [self addDayButtonToMonthPanel:monthPanel];
            [self.monthPanels addObject:monthPanel];
            scrollViewHeight += monthPanel.frame.size.height;
            index++;
            
            if (i == currentYear && j == currentMonth) {
                pointScrollTo = monthPanel.frame.origin;
            }
        }
    }
    
    scrollView.contentSize = CGSizeMake(scrollView.frame.size.width, scrollViewHeight);
    
    [scrollView scrollRectToVisible:
        CGRectMake(pointScrollTo.x, pointScrollTo.y,
                   screenRect.size.width, screenRect.size.height)
                           animated:NO];
    
    [self updateLeftBarButtonItem:currentYear];
    
    UIBarButtonItem *today =
    [[UIBarButtonItem alloc] initWithTitle:@"Today"
                                     style:UIBarButtonItemStyleBordered
                                    target:self
                                    action:@selector(today)];
    
    [[self navigationItem] setRightBarButtonItem:today];
    
    scrollView.delegate = self;
    self.view = scrollView;
}

- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView
                     withVelocity:(CGPoint)velocity
              targetContentOffset:(inout CGPoint *)targetContentOffset
{
    int yearNumber = [[Schedule getInstance] totalYearNumber];
    int height = self.view.frame.size.height / yearNumber;
    int year = [Schedule getInstance].startYear + abs(targetContentOffset->y/height);
    [self updateLeftBarButtonItem:year];
}

- (void)updateLeftBarButtonItem:(NSInteger)year
{
    UIBarButtonItem *yearlyViewButtonItem =
    [[UIBarButtonItem alloc] initWithTitle:[NSString stringWithFormat:@"%d", year]
                                     style:UIBarButtonItemStyleBordered
                                    target:self
                                    action:@selector(back)];
    
    [[self navigationItem] setLeftBarButtonItem:yearlyViewButtonItem];
}

- (void)today
{
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    
    int numberMonth = [[Schedule getInstance] totalYearNumber] * 12;
    int y = ([[Schedule getInstance].currentDate month]-1) * abs(self.view.frame.size.height/numberMonth);
    
    [(UIScrollView*)self.view scrollRectToVisible:CGRectMake(0, y, screenRect.size.width, screenRect.size.height)
                                         animated:YES];
}

- (void)back
{
    [[self navigationController] popViewControllerAnimated:YES];
}

- (void)addDayButtonToMonthPanel:(MonthPanel*)monthPanel
{
    NSDateComponents *dayComponents;
    int weekday = [[[Schedule getInstance] year:monthPanel.year month:monthPanel.month day:1] weekday];
    int week = 0;
    for (NSInteger day = 1; ; day++) {
        dayComponents  = [[Schedule getInstance] year:monthPanel.year month:monthPanel.month day:day];
        if (dayComponents.month != monthPanel.month) {
            break;
        }
        DayButton *dayButton = [DayButton buttonWithType:UIButtonTypeRoundedRect];
        dayButton.frame = CGRectMake(weekday*40-20, 60+week*40, 35, 35);
        
        [dayButton year:monthPanel.year month:monthPanel.month weekday:weekday day:day];
        
        [dayButton addTarget:self
                      action:@selector(navigateToDailyView:)
            forControlEvents:UIControlEventTouchUpInside];
        
        if (monthPanel.month == [[Schedule getInstance].currentDate month] &&
            monthPanel.year == [[Schedule getInstance].currentDate year] &&
            day == [[Schedule getInstance].currentDate day]) {
            dayButton.backgroundColor = [UIColor colorWithRed:1.0f
                                                          green:0.0f
                                                           blue:0.0f
                                                          alpha:0.6f];
        }
        
        [monthPanel.dayButtons addObject:dayButton];
        [monthPanel addSubview:dayButton];
        if (weekday >= 7) {
            weekday = 1;
            week++;
        } else {
            weekday++;
        }
    }
}

- (void)navigateToDailyView:(DayButton*)sender
{
    DailyViewController *dailyViewController =
        [[DailyViewController alloc]initWithDay:sender.day
                                        weekday:sender.weekday
                                          month:sender.month
                                           year:sender.year];
    
    UIBarButtonItem *signOutButtonItem =
    [[UIBarButtonItem alloc] initWithTitle:[MonthButton monthFullNames][sender.month]
                                     style:UIBarButtonItemStyleBordered
                                    target:nil
                                    action:nil];
    [[self navigationItem] setBackBarButtonItem:signOutButtonItem];
    
    [self.navigationController pushViewController:dailyViewController animated:YES];
}

@end
