//
//  DailyViewController.m
//  wrapper
//
//  Created by xcode-dev on 11/22/13.
//  Copyright (c) 2013 MusicKids. All rights reserved.
//

#import "DailyViewController.h"
#import "Schedule.h"
#import "MonthButton.h"
#import "DayButton.h"
#import "CalendarLabels.h"

@interface DailyViewController () <UITableViewDataSource, UITableViewDelegate>

@property (assign, nonatomic, readwrite) NSInteger year;

@property (assign, nonatomic, readwrite) NSInteger month;

@property (assign, nonatomic, readwrite) NSInteger weekday;

@property (assign, nonatomic, readwrite) NSInteger day;

@end

@implementation DailyViewController

- (id)initWithDay:(NSInteger)day weekday:(NSInteger)weekday month:(NSInteger)month year:(NSInteger)year
{
    self = [self init];
    if (self) {
        self.year = year;
        self.month = month;
        self.weekday = weekday;
        self.day = day;
    }
    return self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    
    NSString *titleString = [NSString stringWithFormat:@"%@ %@ %d, %d",
                             [CalendarLabels weekdayFullNames][self.weekday],
                             [CalendarLabels monthFullNames][self.month],
                             self.day, self.year];
    
    UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(20, 0, 280, 30)];
    title.text = titleString;
    title.textAlignment = NSTextAlignmentCenter;
    [title setFont:[UIFont systemFontOfSize:12]];
    [self.view addSubview:title];
    
    NSInteger titleHeight = title.frame.size.height;
    CGRect tableFrame = CGRectMake(0, titleHeight, screenRect.size.width, screenRect.size.height-titleHeight);

    UITableView *table = [[UITableView alloc] initWithFrame:tableFrame style:UITableViewStylePlain];
    table.dataSource = self;
    table.delegate = self;
    [self.view addSubview:table];
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
}

@end
