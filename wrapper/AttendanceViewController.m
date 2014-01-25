//
//  ClassViewController.m
//  wrapper
//
//  Created by Jinqiu Deng on 12/5/13.
//  Copyright (c) 2013 MusicKids. All rights reserved.
//

#import "AttendanceViewController.h"
#import "Teacher.h"
#import "Course.h"
#import "Attendance.h"
#import "Schedule.h"
#import "CalendarLabels.h"

@interface AttendanceViewController ()

@property (nonatomic) NSInteger year;

@property (nonatomic) NSInteger month;

@property (nonatomic) NSInteger weekday;

@property (nonatomic) NSInteger day;

@property (nonatomic) NSNumber* courseId;

@property (nonatomic) Attendance* attendance;

@property (nonatomic) NSMutableArray* students;

@end

@implementation AttendanceViewController

- (instancetype)initWithYear:(NSInteger)year month:(NSInteger)month weekday:(NSInteger)weekday day:(NSInteger)day courseId:(NSNumber *)courseId
{
    self = [super init];
    if (self) {
        self.year = year;
        self.month = month;
        self.weekday = weekday;
        self.day = day;
        self.courseId = courseId;
    }
    return self;
}

- (NSMutableArray*)students
{
    if (!_students) {
        _students = [[NSMutableArray alloc] init];
    }
    return _students;
}	

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [Attendance AttendancesNum];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell* cell = [tableView cellForRowAtIndexPath:indexPath];
    
//    UILabel* label = [[UILabel alloc] initWithFrame:CGRectMake(300, 0, 100, 100)];
//    label.text = @"dddddddd";
//    [cell.contentView addSubview:label];
//    [cell.contentView bringSubviewToFront:label];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
    
    Attendance* attendance = [Attendance attendanceOfIndex:[indexPath indexAtPosition:1]];

    cell.textLabel.text = [NSString stringWithFormat:@"%@ %@", attendance.studentFirstName, attendance.studentLastName  ];
    
    if ([attendance.attendanceId intValue] >= 0) {
    	cell.accessoryType = UITableViewCellAccessoryCheckmark;
    } else {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    return cell;
}

- (NSString*)tableTitle
{
    Course* course = [Schedule courseOfId:self.courseId];
    return [NSString stringWithFormat:@"%@ %@ %d, %d \n %@ - %@ - %@ \n %@ - %@", [CalendarLabels weekdayFullNames][self.weekday],
            [CalendarLabels monthFullNames][self.month],
            self.day, self.year, course.courseName, course.instrumentName,
            course.schoolName, course.programType, course.courseType];
}

@end
