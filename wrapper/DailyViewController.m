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
#import "AttendanceViewController.h"
#import "Course.h"
#import "User.h"

@interface DailyViewController () 

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
    int num = 0;
    for (NSString* courseId in [User getInstance].courseIds) {
        if ([[Course getCourseById:courseId] scheduleOnYear:self.year month:self.month day:self.day]) {
            num += 1;
        }
    }
    return num;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
    cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
    return cell;
}

- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
    AttendanceViewController *attendanceViewController = [[AttendanceViewController alloc] init];
    [self.navigationController pushViewController:attendanceViewController animated:YES];
}

- (NSString*)tableTitle
{
    return [NSString stringWithFormat:@"%@ %@ %d, %d",
            [CalendarLabels weekdayFullNames][self.weekday],
            [CalendarLabels monthFullNames][self.month],
            self.day, self.year];
}

@end
