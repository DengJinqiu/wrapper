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
#import "CalendarLabels.h"
#import "User.h"

@interface MonthlyViewController () <UIScrollViewDelegate>

@property (nonatomic) NSMutableArray *monthPanels;

@property (nonatomic) NSInteger startYear;

@property (nonatomic) NSInteger startMonth;

@property (weak, nonatomic) UIViewController* viewControllerBelow;

@end

@implementation MonthlyViewController

- (id)initWithStartYear:(NSInteger)startYear startMonth:(NSInteger)startMonth
{
    self = [self init];
    if (self != nil) {
        self.startYear = startYear;
        self.startMonth = startMonth;
    }
    return self;
}

- (void)loadView
{
    NSArray* viewControllers = self.navigationController.viewControllers;
    self.viewControllerBelow = viewControllers[viewControllers.count-2];
    
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    
    NSInteger startYear = [User getInstance].startYear;
    NSInteger endYear = [User getInstance].endYear;
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:screenRect];
    scrollView.backgroundColor = [UIColor whiteColor];
    
    NSInteger scrollViewHeight = 0;
    
    CGPoint pointScrollTo = CGPointMake(0, 0);
    
    NSInteger index = 0;
    for(NSInteger i = startYear; i <= endYear; i++) {
        for (NSInteger j = 1; j <= 12; j++) {
            MonthPanel *monthPanel = [[MonthPanel alloc] initWithYear:i month:j originY:scrollViewHeight];
            
            [scrollView addSubview:monthPanel];
            [self addDayButtonToMonthPanel:monthPanel];
            [self.monthPanels addObject:monthPanel];
            scrollViewHeight += monthPanel.frame.size.height;
            index++;
            
            if (i == self.startYear && j == self.startMonth) {
                pointScrollTo = monthPanel.frame.origin;
            }
        }
    }
    
    scrollView.contentSize = CGSizeMake(scrollView.frame.size.width, scrollViewHeight);
    
    [scrollView scrollRectToVisible:
        CGRectMake(pointScrollTo.x, pointScrollTo.y,
                   screenRect.size.width, screenRect.size.height)
                           animated:NO];
    
    [self updateLeftBarButtonItem:self.startYear];
    
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
    NSInteger yearNumber = [[User getInstance] totalYearNumber];
    NSInteger height = [self scrollViewContentHeight] / yearNumber;
    NSInteger year = [User getInstance].startYear + abs(targetContentOffset->y/height);
    [self updateLeftBarButtonItem:year];
}

- (CGFloat)scrollViewContentHeight
{
    return ((UIScrollView*)self.view).contentSize.height;
}

- (void)updateLeftBarButtonItem:(NSInteger)year
{
    NSString *yearString = [NSString stringWithFormat:@"%ld", (long)year];
    if (![self.viewControllerBelow.navigationItem.backBarButtonItem.title isEqualToString:yearString]) {
        UIBarButtonItem *backButtonItem =
            [[UIBarButtonItem alloc] initWithTitle:yearString
                                             style:UIBarButtonItemStyleBordered
                                            target:nil
                                            action:nil];
        [self.viewControllerBelow.navigationItem setBackBarButtonItem:backButtonItem];
    }
    
}

- (void)today
{
    NSInteger numberMonth = [[User getInstance] totalYearNumber] * 12;
    NSInteger y = (([[SchoolCalendar getInstance].currentDate year] - [[User getInstance] startYear])*12 +
                    [[SchoolCalendar getInstance].currentDate month]-1) * abs([self scrollViewContentHeight] / numberMonth);
    
    [(UIScrollView*)self.view scrollRectToVisible:CGRectMake(0, y, self.view.frame.size.width, self.view.frame.size.height)
                                         animated:YES];
}

- (void)addDayButtonToMonthPanel:(MonthPanel*)monthPanel
{
    NSDateComponents *dayComponents;
    NSInteger weekday = [[[SchoolCalendar getInstance] year:monthPanel.year month:monthPanel.month day:1] weekday];
    NSInteger week = 0;
    for (NSInteger day = 1; ; day++) {
        dayComponents  = [[SchoolCalendar getInstance] year:monthPanel.year month:monthPanel.month day:day];
        if (dayComponents.month != monthPanel.month) {
            break;
        }
        DayButton *dayButton = [[DayButton alloc] initWithYear:monthPanel.year month:monthPanel.month
                                                       weekday:weekday day:day originX:weekday*40-20 originY:week*40+60];
     
        if (weekday == 1 || weekday == 7) {
            [dayButton markAsGray];
        }
        
        if (monthPanel.month == [[SchoolCalendar getInstance].currentDate month] &&
            monthPanel.year == [[SchoolCalendar getInstance].currentDate year] &&
            day == [[SchoolCalendar getInstance].currentDate day]) {
            [dayButton markAsRed];
        }
        
        if ([[User getInstance] hasCourseOnYear:monthPanel.year month:monthPanel.month day:day]) {
            [dayButton markAsGreen];
            
            [dayButton addTarget:self
                          action:@selector(navigateToDailyView:)
                forControlEvents:UIControlEventTouchUpInside];
        }
        
        [monthPanel.calendarButtons addObject:dayButton];
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
    [[DailyViewController alloc] initWithYear:sender.year month:sender.month weekday:sender.weekday day:sender.day];
    UIBarButtonItem *signOutButtonItem =
    [[UIBarButtonItem alloc] initWithTitle:[CalendarLabels monthFullNames][sender.month]
                                     style:UIBarButtonItemStyleBordered
                                    target:nil
                                    action:nil];
    [[self navigationItem] setBackBarButtonItem:signOutButtonItem];
    
    [self.navigationController pushViewController:dailyViewController animated:YES];
}

@end
