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

@property (strong, nonatomic, readwrite) Calendar *calendar;

@property (strong, nonatomic, readwrite) NSMutableArray *yearPanels;

@end

@implementation YearlyViewController

- (Calendar*)calendar
{
    if (!_calendar) {
        _calendar = [[Calendar alloc] init];
    }
    return _calendar;
}

- (NSMutableArray*)yearPanels
{
    if (!_yearPanels) {
        _yearPanels = [[NSMutableArray alloc] init];
    }
    return _yearPanels;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        CGRect screenRect = [[UIScreen mainScreen] bounds];
        
        NSInteger startYear = [self.calendar startYear];
        NSInteger endYear = [self.calendar endYear];
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
    return self;
}

- (void)addMonthButtonToYearPanel:(YearPanel*)yearPanel
{
    int i = 0;
    int j = 0;
    for (NSInteger month = 1; month <= 12; month++) {
        MonthButton *monthButton = [MonthButton buttonWithType:UIButtonTypeRoundedRect];
        monthButton.frame = CGRectMake(20+i*81, 60+j*40, 35, 35);
        
        [monthButton month:month year:yearPanel.year];
        
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
    MonthlyViewController *monthlyViewController =
        [[MonthlyViewController alloc]initWithCalendar:self.calendar
                                        yearNavigateTo:sender.year monthNavigateTo:sender.month];
    
    UIBarButtonItem *yearlyViewButtonItem =
        [[UIBarButtonItem alloc] initWithTitle:[NSString stringWithFormat:@"%d", sender.year]
                                         style:UIBarButtonItemStyleBordered
                                        target:nil
                                        action:nil];
    [[self navigationItem] setBackBarButtonItem:yearlyViewButtonItem];
    [self.navigationController pushViewController:monthlyViewController animated:YES];
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
