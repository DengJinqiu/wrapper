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
#import "AttendanceMarking.h"
#import "SelectionPicker.h"
#import "TwoSidesLabel.h"

@interface AttendanceViewController () <UIPickerViewDelegate, UIPickerViewDataSource>

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
    return [Attendance attendancesNum];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    BOOL isSelected = ![[self.cellsSelected objectForKey:[NSNumber numberWithInteger:[indexPath indexAtPosition:1]]] boolValue];
    [self.cellsSelected setObject:[NSNumber numberWithBool:isSelected]
                           forKey:[NSNumber numberWithInteger:[indexPath indexAtPosition:1]]];
    
    [tableView beginUpdates];
    [tableView endUpdates];
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [AttendanceMarking attendanceMarkingsCount];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [AttendanceMarking getAttendanceMarkingWithIndex:row].name;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
    
    Attendance* attendance = [Attendance attendanceOfIndex:[indexPath indexAtPosition:1]];

    NSString* name = [NSString stringWithFormat:@"%@ %@", attendance.studentFirstName, attendance.studentLastName];
    NSString* label;
    if ([attendance.attendanceId intValue] == -1) {
        label = @"no record";
    } else {
        label = [AttendanceMarking getAttendanceMarkingWithId:attendance.attendanceId].name;
    }
    TwoSidesLabel *nameLabel = [[TwoSidesLabel alloc] initWithFrame:CGRectMake(15, 0, tableView.frame.size.width-25, 44)];
    [nameLabel.leftLabel setText:name];
    [nameLabel.rightLabel setText:label];
    [cell.contentView addSubview:nameLabel];
    
    SelectionPicker* selectionPicker = [[SelectionPicker alloc] initWithPickerViewDelegate:self andPickerViewDataSource:self];
    CGRect frame = selectionPicker.frame;
    frame.origin.x = 15;
    frame.origin.y = 44;
    selectionPicker.frame = frame;
    [cell.contentView addSubview:selectionPicker];
    
    selectionPicker.remove.tag = [indexPath indexAtPosition:1];
    [selectionPicker.remove addTarget:self action:@selector(deleteAttendanceMarking:) forControlEvents:UIControlEventTouchUpInside];

    selectionPicker.cancel.tag = [indexPath indexAtPosition:1];
    [selectionPicker.cancel addTarget:self action:@selector(cancelAttendanceMarking:) forControlEvents:UIControlEventTouchUpInside];

    selectionPicker.done.tag = [indexPath indexAtPosition:1];
    [selectionPicker.done addTarget:self action:@selector(updateAttendanceMarking:) forControlEvents:UIControlEventTouchUpInside];
    
    return cell;
}

- (void)deleteAttendanceMarking:(id)sender
{
    NSIndexPath* indexPath = [NSIndexPath indexPathForRow:((ButtonWithTag*)sender).tag inSection:1];
    [self tableView:self.tableView didSelectRowAtIndexPath:indexPath];
}

- (void)updateAttendanceMarking:(id)sender
{
    NSIndexPath* indexPath = [NSIndexPath indexPathForRow:((ButtonWithTag*)sender).tag inSection:1];
    [self tableView:self.tableView didSelectRowAtIndexPath:indexPath];
}

- (void)cancelAttendanceMarking:(id)sender
{
    NSIndexPath* indexPath = [NSIndexPath indexPathForRow:((ButtonWithTag*)sender).tag inSection:1];
    [self tableView:self.tableView didSelectRowAtIndexPath:indexPath];
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
