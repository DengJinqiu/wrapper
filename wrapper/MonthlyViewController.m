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

@property (weak, nonatomic, readwrite) Calendar* calendar;

@property (assign, nonatomic, readwrite) NSInteger scrollViewHeight;

@property (strong, nonatomic, readwrite) UIScrollView *scrollView;

@end

@implementation MonthlyViewController

#define NAVBAR_HEIGHT 64

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    
    }
    return self;
}

- (void)initLayoutWithYearNavigateTo:(NSInteger)year monthNavigateTo:(NSInteger)month
{
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    
    NSInteger startYear = [self.calendar startYear];
    NSInteger endYear = [self.calendar endYear];
    self.scrollView = [[UIScrollView alloc] initWithFrame:screenRect];
    self.scrollView.backgroundColor = [UIColor whiteColor];
    
    self.scrollViewHeight = 0;
    
    CGPoint pointScrollTo = CGPointMake(0, 0);
    
    NSInteger index = 0;
    for(NSInteger i = startYear; i <= endYear; i++) {
        for (NSInteger j = 1; j <= 12; j++) {

            MonthPanel *monthPanel = [[MonthPanel alloc] initWithYear:i month:j];
            CGRect frame = monthPanel.frame;
            frame.origin.y = self.scrollViewHeight;
            monthPanel.frame = frame;
            [self.scrollView addSubview:monthPanel];
            [self addDayButtonToMonthPanel:monthPanel];
            [self.monthPanels addObject:monthPanel];
            self.scrollViewHeight += monthPanel.frame.size.height;
            index++;
            
            if (i == year && j == month) {
                pointScrollTo = monthPanel.frame.origin;
            }
        }
    }
    
    self.scrollView.contentSize = CGSizeMake(self.scrollView.frame.size.width, self.scrollViewHeight);
    
    [self.scrollView scrollRectToVisible:
        CGRectMake(pointScrollTo.x, pointScrollTo.y,
                   screenRect.size.width, screenRect.size.height)
                           animated:NO];
    
    [self updateLeftBarButtonItem:year];
    
    UIBarButtonItem *today =
    [[UIBarButtonItem alloc] initWithTitle:@"Today"
                                     style:UIBarButtonItemStyleBordered
                                    target:self
                                    action:@selector(today)];
    
    [[self navigationItem] setRightBarButtonItem:today];
    
    self.scrollView.delegate = self;
    [self.view addSubview:self.scrollView];
}

- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView
                     withVelocity:(CGPoint)velocity
              targetContentOffset:(inout CGPoint *)targetContentOffset
{
    int yearNumber = self.calendar.endYear - self.calendar.startYear + 1;
    int height = self.scrollViewHeight / yearNumber;
    int year = self.calendar.startYear + abs(targetContentOffset->y/height);
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
    
    int numberMonth = (self.calendar.endYear - self.calendar.startYear + 1)*12;
    int y = ([self.calendar.currentDate month]-1) * abs(self.scrollViewHeight/numberMonth);
    
    [self.scrollView scrollRectToVisible:
     CGRectMake(0, y,
                screenRect.size.width, screenRect.size.height-NAVBAR_HEIGHT)
                           animated:YES];
}

- (void)back
{
    [[self navigationController] popViewControllerAnimated:YES];
}

- (void)addDayButtonToMonthPanel:(MonthPanel*)monthPanel
{
    NSDateComponents *dayComponents;
    int weekday = [[self.calendar year:monthPanel.year month:monthPanel.month day:1] weekday];
    int week = 0;
    for (NSInteger day = 1; ; day++) {
        dayComponents  = [self.calendar year:monthPanel.year month:monthPanel.month day:day];
        if (dayComponents.month != monthPanel.month) {
            break;
        }
        DayButton *dayButton = [DayButton buttonWithType:UIButtonTypeRoundedRect];
        dayButton.frame = CGRectMake(weekday*40-20, 60+week*40, 35, 35);
        
        [dayButton year:monthPanel.year month:monthPanel.month weekday:weekday day:day];
        
        [dayButton addTarget:self
                      action:@selector(navigateToDailyView:)
            forControlEvents:UIControlEventTouchUpInside];
        
        if (monthPanel.month == [self.calendar.currentDate month] &&
            monthPanel.year == [self.calendar.currentDate year] &&
            day == [self.calendar.currentDate day]) {
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
        [[DailyViewController alloc]initWithCalendar:self.calendar
                                                 day:sender.day
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

- (instancetype)initWithCalendar:(Calendar*)calendar
                  yearNavigateTo:(NSInteger)year monthNavigateTo:(NSInteger)month
{
    self = [self init];
    self.calendar = calendar;
    [self initLayoutWithYearNavigateTo:year monthNavigateTo:month];
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
