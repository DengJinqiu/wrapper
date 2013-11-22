//
//  MonthlyViewController.m
//  wrapper
//
//  Created by Jinqiu Deng on 11/20/13.
//  Copyright (c) 2013 MusicKids. All rights reserved.
//

#import "MonthlyViewController.h"
#import "MonthPanel.h"

@interface MonthlyViewController ()

@property (strong, nonatomic, readwrite) NSMutableArray *monthPanels;

@property (weak, nonatomic, readwrite) Calendar* calendar;

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
    
    NSInteger scrollViewHeight = 0;
    
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
        }
    }
    
    scrollView.contentSize = CGSizeMake(scrollView.frame.size.width, scrollViewHeight);
    self.view = scrollView;

}

- (void)addDayButtonToMonthPanel:(MonthPanel*)monthPanel
{
    int monthLength = 1;
    int i = 0;
    int j = 0;
    for (NSInteger day = 1; day <= monthLength; day++) {
      
    }
    
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
