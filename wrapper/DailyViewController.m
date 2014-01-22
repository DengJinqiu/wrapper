//
//  DailyViewController.m
//  wrapper
//
//  Created by xcode-dev on 11/22/13.
//  Copyright (c) 2013 MusicKids. All rights reserved.
//

#import "DailyViewController.h"
#import "SchoolCalendar.h"
#import "MonthButton.h"
#import "DayButton.h"
#import "CalendarLabels.h"
#import "AttendanceViewController.h"
#import "Course.h"
#import "Teacher.h"
#import "Schedule.h"
#import "HTTPManagerDelegate.h"
#import "HTTPManager.h"

@interface DailyViewController () <HTTPManagerDelegate>

@property (nonatomic) NSInteger year;

@property (nonatomic) NSInteger month;

@property (nonatomic) NSInteger weekday;

@property (nonatomic) NSInteger day;

@end

@implementation DailyViewController

- (id)initWithYear:(NSInteger)year month:(NSInteger)month weekday:(NSInteger)weekday day:(NSInteger)day
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
    return [[Schedule coursesOnYear:self.year month:self.month day:self.day] count];
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;

    Course* course = [Schedule courseOfId:[[Schedule coursesOnYear:self.year month:self.month day:self.day]
                                           objectAtIndex:[indexPath indexAtPosition:1]]];
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@ - %@", course.courseName, course.courseType];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@ - %@ - %@", course.schoolName, course.instrumentName, course.programType];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [HTTPManager loadRosterFor:[[Schedule coursesOnYear:self.year month:self.month day:self.day] objectAtIndex:[indexPath indexAtPosition:1]]
                        onDate:[NSString stringWithFormat:@"%d-%d-%d", self.year, self.month, self.day]
                  withDelegate:self];
    [self loadingRosterStart];
}

- (void)loadingRosterStart
{
    
}

- (void)loadingRosterSuccess
{
    AttendanceViewController *attendanceViewController =
        [[AttendanceViewController alloc] initWithYear:self.year month:self.month weekday:self.weekday day:self.day];
    UIBarButtonItem *backButtonItem =
    [[UIBarButtonItem alloc] initWithTitle:@"Course"
                                     style:UIBarButtonItemStyleBordered
                                    target:nil
                                    action:nil];
    [[self navigationItem] setBackBarButtonItem:backButtonItem];
    [self.navigationController pushViewController:attendanceViewController animated:YES];
}

- (void)loadingRosterFailed
{
    
}

- (void)loadingScheduleStart{}

- (void)loadingScheduleSuccess{}

- (void)loadingScheduleFailed{}

- (void)loadingUserStart{}

- (void)loadingUserSuccess{}

- (void)loadingUserFailed{}

- (NSString*)tableTitle
{
    return [NSString stringWithFormat:@"%@ %@ %ld, %ld",
            [CalendarLabels weekdayFullNames][self.weekday],
            [CalendarLabels monthFullNames][self.month],
            (long)self.day, (long)self.year];
}

@end
