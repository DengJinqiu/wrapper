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

@interface DailyViewController ()

@property (nonatomic) NSInteger year;

@property (nonatomic) NSInteger month;

@property (nonatomic) NSInteger weekday;

@property (nonatomic) NSInteger day;

@property (nonatomic) NSMutableArray* courseIds;

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
        _courseIds = [[NSMutableArray alloc] init];
        for (NSNumber* courseId in [Schedule coursesOnYear:year month:month day:day]) {
            [_courseIds addObject:courseId];
        }
    }
    return self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.courseIds count];
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;

    Course* course = [Schedule courseOfId:[self.courseIds objectAtIndex:[indexPath indexAtPosition:1]]];
    
    cell.textLabel.text = course.courseName;
    cell.detailTextLabel.text = course.schoolName;
    
    return cell;
}

//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    Attendance* attendance = [[self.courseIndexOnCell objectAtIndex:[indexPath indexAtPosition:1]] attendanceOnYear:self.year month:self.month day:self.day];
//    AttendanceViewController *attendanceViewController = [[AttendanceViewController alloc] initWithYear:self.year month:self.month weekday:self.weekday day:self.day attendance:attendance];
//    UIBarButtonItem *signOutButtonItem =
//    [[UIBarButtonItem alloc] initWithTitle:@"Course"
//                                     style:UIBarButtonItemStyleBordered
//                                    target:nil
//                                    action:nil];
//    [[self navigationItem] setBackBarButtonItem:signOutButtonItem];
//    [self.navigationController pushViewController:attendanceViewController animated:YES];
//}

- (NSString*)tableTitle
{
    return [NSString stringWithFormat:@"%@ %@ %ld, %ld",
            [CalendarLabels weekdayFullNames][self.weekday],
            [CalendarLabels monthFullNames][self.month],
            (long)self.day, (long)self.year];
}

@end
