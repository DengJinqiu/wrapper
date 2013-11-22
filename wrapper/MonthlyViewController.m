//
//  MonthlyViewController.m
//  wrapper
//
//  Created by Jinqiu Deng on 11/20/13.
//  Copyright (c) 2013 MusicKids. All rights reserved.
//

#import "MonthlyViewController.h"
#import "MonthPanel.h"
#import "DayButton.h"

@interface MonthlyViewController () <UIScrollViewDelegate>

@property (strong, nonatomic, readwrite) NSMutableArray *monthPanels;

@property (weak, nonatomic, readwrite) Calendar* calendar;

@property (assign, nonatomic, readwrite) NSInteger scrollViewHeight;

@end

@implementation MonthlyViewController

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
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:screenRect];
    scrollView.backgroundColor = [UIColor whiteColor];
    
    self.scrollViewHeight = 0;
    
    CGPoint pointScrollTo = CGPointMake(0, 0);
    
    NSInteger index = 0;
    for(NSInteger i = startYear; i <= endYear; i++) {
        for (NSInteger j = 1; j <= 12; j++) {

            MonthPanel *monthPanel = [[MonthPanel alloc] initWithYear:i month:j];
            CGRect frame = monthPanel.frame;
            frame.origin.y = self.scrollViewHeight;
            monthPanel.frame = frame;
            [scrollView addSubview:monthPanel];
            [self addDayButtonToMonthPanel:monthPanel];
            [self.monthPanels addObject:monthPanel];
            self.scrollViewHeight += monthPanel.frame.size.height;
            index++;
            
            if (i == year && j == month) {
                pointScrollTo = monthPanel.frame.origin;
            }
        }
    }
    
    scrollView.contentSize = CGSizeMake(scrollView.frame.size.width, self.scrollViewHeight);
    [scrollView scrollRectToVisible:
        CGRectMake(pointScrollTo.x, pointScrollTo.y,
                   screenRect.size.width, screenRect.size.height)
                           animated:NO];
    [self updateLeftBarButtonItem:year];
    
    scrollView.delegate = self;
    self.view = scrollView;
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
                                    action:@selector(popItself)];
    [[self navigationItem] setLeftBarButtonItem:yearlyViewButtonItem];
}

- (void)popItself
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

- (instancetype)initWithCalendar:(Calendar*)calendar
                  yearNavigateTo:(NSInteger)year monthNavigateTo:(NSInteger)month
{
    self.calendar = calendar;
    self = [self init];
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
