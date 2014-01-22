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

@interface AttendanceViewController ()

@property (nonatomic) NSInteger year;

@property (nonatomic) NSInteger month;

@property (nonatomic) NSInteger weekday;

@property (nonatomic) NSInteger day;

@property (nonatomic) Attendance* attendance;

@property (nonatomic) NSMutableArray* students;

@end

@implementation AttendanceViewController

- (id)initWithYear:(NSInteger)year month:(NSInteger)month weekday:(NSInteger)weekday day:(NSInteger)day
{
    self = [super init];
    if (self) {
        self.year = year;
        self.month = month;
        self.weekday = weekday;
        self.day = day;
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
//    Student* student = [self.students objectAtIndex:[indexPath indexAtPosition:1]];
//    [self.attendance changeAttendance:student.studentId];
//    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
//    
//    if ([[self.attendance.studentAttendance objectForKey:student.studentId] boolValue]) {
//        cell.accessoryType = UITableViewCellAccessoryCheckmark;
//    } else {
//        cell.accessoryType = UITableViewCellAccessoryNone;
//    }
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];

//    Student* student = [self.students objectAtIndex:[indexPath indexAtPosition:1]];
//    cell.textLabel.text = [NSString stringWithFormat:@"%@ %@", [student firstName], [student lastName]];
//    
//    if ([[self.attendance.studentAttendance objectForKey:student.studentId] boolValue]) {
//    	cell.accessoryType = UITableViewCellAccessoryCheckmark;
//    } else {
//        cell.accessoryType = UITableViewCellAccessoryNone;
//    }
    
    return cell;
}

- (NSString*)tableTitle
{
//    return [NSString stringWithFormat:@"%@, %@", self.attendance.course.courseName, self.attendance.course.schoolName];
    return @"ddd";
}

@end
