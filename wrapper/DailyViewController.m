//
//  DailyViewController.m
//  wrapper
//
//  Created by xcode-dev on 11/22/13.
//  Copyright (c) 2013 MusicKids. All rights reserved.
//

#import "DailyViewController.h"
#import "Calendar.h"
#import "MonthButton.h"
#import "DayButton.h"

@interface DailyViewController ()

@property (strong, nonatomic, readwrite) Calendar *calendar;

@property (assign, nonatomic, readwrite) NSInteger year;

@property (assign, nonatomic, readwrite) NSInteger month;

@property (assign, nonatomic, readwrite) NSInteger weekday;

@property (assign, nonatomic, readwrite) NSInteger day;

@end

@implementation DailyViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (instancetype)initWithCalendar:(Calendar *)calendar day:(NSInteger)day
                         weekday:(NSInteger)weekday month:(NSInteger)month year:(NSInteger)year
{
    self.calendar = calendar;
    self.year = year;
    self.month = month;
    self.weekday = weekday;
    self.day = day;
    self = [self init];
    [self initLayout];
    return self;
}

- (void)initLayout
{
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:screenRect];
    scrollView.backgroundColor = [UIColor whiteColor];
    
    NSString *titleString = [NSString stringWithFormat:@"%@ %@ %d, %d",
                             [DayButton weekdayFullNames][self.weekday],
                             [MonthButton monthFullNames][self.month],
                             self.day, self.year];
    
    UILabel *title = [[UILabel alloc] init];
    title.frame = CGRectMake(20, 0, 280, 30);
    title.text = titleString;
    title.textAlignment = NSTextAlignmentCenter;
    [title setFont:[UIFont systemFontOfSize:12]];
    [scrollView addSubview:title];
    self.view = scrollView;
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
