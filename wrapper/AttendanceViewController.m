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
#import "HTTPManager.h"

@interface AttendanceViewController () <UIPickerViewDelegate, UIPickerViewDataSource, HTTPManagerDelegate>

@property (nonatomic) NSInteger year;

@property (nonatomic) NSInteger month;

@property (nonatomic) NSInteger weekday;

@property (nonatomic) NSInteger day;

@property (nonatomic) NSNumber* courseId;

@property (nonatomic) Attendance* attendance;

@property (nonatomic) NSMutableArray* students;

@property (nonatomic) NSInteger pickerRowIndexSelected;

@property (nonatomic) NSMutableDictionary* pickers;

@property (nonatomic) NSMutableDictionary* labels;

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
        
        self.pickerRowIndexSelected = -1;
    }
    return self;
}

- (NSMutableDictionary*)pickers
{
    if (!_pickers) {
        _pickers = [[NSMutableDictionary alloc] init];
    }
    return _pickers;
}

- (NSMutableDictionary*)labels
{
    if (!_labels) {
        _labels = [[NSMutableDictionary alloc] init];
    }
    return _labels;
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
    NSInteger index = [indexPath indexAtPosition:1];
    if (![self.indexesUnableSelected containsObject:[NSNumber numberWithInteger:index]]) {
        if (self.indexSelected == [indexPath indexAtPosition:1]) {
            self.indexSelected = -1;
            self.pickerRowIndexSelected = -1;
        } else {
            self.indexSelected = index;
            Attendance* attendance = [Attendance attendanceOfIndex:index];
            if ([attendance.attendanceId intValue] == -1) {
                self.pickerRowIndexSelected = 0;
            } else {
                self.pickerRowIndexSelected = [AttendanceMarking idToIndex:attendance.attendanceMarkingId];
            }
            [((SelectionPicker*)[self.pickers objectForKey:[NSNumber numberWithInteger:index]]).picker selectRow:self.pickerRowIndexSelected
                                                                                                     inComponent:0 animated:YES];
        }
        
        [tableView beginUpdates];
        [tableView endUpdates];
    }
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    self.pickerRowIndexSelected = row;
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
    return [AttendanceMarking attendanceMarkingWithIndex:row].name;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger index = [indexPath indexAtPosition:1];
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
    
    Attendance* attendance = [Attendance attendanceOfIndex:index];

    NSString* name = [NSString stringWithFormat:@"%@ %@", attendance.studentFirstName, attendance.studentLastName];
    NSString* label;
    if ([attendance.attendanceId intValue] == -1) {
        label = @"no record";
    } else {
        label = [AttendanceMarking attendanceMarkingWithId:attendance.attendanceMarkingId].name;
    }
    
    TwoSidesLabel *nameLabel = [[TwoSidesLabel alloc] initWithFrame:CGRectMake(15, 0, tableView.frame.size.width-25, 44)];
    [nameLabel.leftLabel setText:name];
    [nameLabel.rightLabel setText:label];
    [cell.contentView addSubview:nameLabel];
    [self.labels setObject:nameLabel forKey:[NSNumber numberWithInteger:index]];
    
    SelectionPicker* selectionPicker = [[SelectionPicker alloc] initWithPickerViewDelegate:self andPickerViewDataSource:self];
    CGRect frame = selectionPicker.frame;
    frame.origin.x = 15;
    frame.origin.y = 44;
    selectionPicker.frame = frame;
    [cell.contentView addSubview:selectionPicker];
    [self.pickers setObject:selectionPicker forKey:[NSNumber numberWithInteger:[indexPath indexAtPosition:1]]];
    
    selectionPicker.remove.tag = index;
    [selectionPicker.remove addTarget:self action:@selector(removeAttendanceMarking) forControlEvents:UIControlEventTouchUpInside];

    selectionPicker.cancel.tag = index;
    [selectionPicker.cancel addTarget:self action:@selector(cancelAttendanceMarking) forControlEvents:UIControlEventTouchUpInside];

    selectionPicker.done.tag = index;
    [selectionPicker.done addTarget:self action:@selector(updateAttendanceMarking) forControlEvents:UIControlEventTouchUpInside];
    
    return cell;
}

- (void)removeAttendanceMarking
{
    NSInteger attendanceIndex = self.indexSelected;
    
    NSIndexPath* indexPath = [NSIndexPath indexPathForRow:attendanceIndex inSection:1];
    [self tableView:self.tableView didSelectRowAtIndexPath:indexPath];
    
    Attendance* attendance = [Attendance attendanceOfIndex:attendanceIndex];
    if ([attendance.attendanceId intValue] != -1) {
        [self changingAttendanceStartWithRowIndex:attendanceIndex];
        [HTTPManager deleteAttendanceForAttendanceId:attendance.attendanceId withDelegate:self andIndex:attendanceIndex];
    }
}

- (void)updateAttendanceMarking
{
    NSInteger attendanceIndex = self.indexSelected;
    NSInteger attendanceMarkingIndex = self.pickerRowIndexSelected;
    
    NSIndexPath* indexPath = [NSIndexPath indexPathForRow:attendanceIndex inSection:1];
    [self tableView:self.tableView didSelectRowAtIndexPath:indexPath];
    
    
    Attendance* attendance = [Attendance attendanceOfIndex:attendanceIndex];
    [self changingAttendanceStartWithRowIndex:attendanceIndex];
    [HTTPManager updateAttendanceForAttendanceId:attendance.attendanceId
                                        rosterId:attendance.rosterId
                                       teacherId:[Teacher getInstance].teacherId
                             attendanceMarkingId:[AttendanceMarking attendanceMarkingWithIndex:attendanceMarkingIndex].attendanceMarkingId
                                            date:[NSString stringWithFormat:@"%d-%d-%d", self.year, self.month, self.day]
                                    withDelegate:self andIndex:attendanceIndex];
}

- (void)cancelAttendanceMarking
{
    NSIndexPath* indexPath = [NSIndexPath indexPathForRow:self.indexSelected inSection:1];
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

- (void)changingAttendanceSuccessWithAttendanceId:(NSNumber *)attendanceId
                              AttendanceMarkingId:(NSNumber *)attendanceMarkingId RowIndex:(NSInteger)index
{
    Attendance* attendance = [Attendance attendanceOfIndex:index];
    attendance.attendanceId = attendanceId;
    attendance.attendanceMarkingId = attendanceMarkingId;
    
    TwoSidesLabel* nameLabel = [self.labels objectForKey:[NSNumber numberWithInteger:index]];
    nameLabel.rightLabel.textColor = [UIColor blackColor];
    NSString* label;
    if ([attendance.attendanceId intValue] == -1) {
        label = @"no record";
    } else {
        label = [AttendanceMarking attendanceMarkingWithId:attendance.attendanceMarkingId].name;
    }
    [nameLabel.rightLabel setText:label];
    
    [self.indexesUnableSelected removeObject:[NSNumber numberWithInteger:index]];
}

- (void)changingAttendanceStartWithRowIndex:(NSInteger)index
{
    ((TwoSidesLabel*)[self.labels objectForKey:[NSNumber numberWithInteger:index]]).rightLabel.textColor = [UIColor greenColor];
    [self.indexesUnableSelected addObject:[NSNumber numberWithInteger:index]];
}

- (void)changingAttendanceFailedWithRowIndex:(NSInteger)index
{
    ((TwoSidesLabel*)[self.labels objectForKey:[NSNumber numberWithInteger:index]]).rightLabel.textColor = [UIColor redColor];
    [self.indexesUnableSelected removeObject:[NSNumber numberWithInteger:index]];
}

- (void)loadingRosterFailed {}

- (void)loadingRosterStart {}

- (void)loadingRosterSuccessWithCourseId:(NSNumber *)courseId {}

- (void)loadingScheduleFailed {}

- (void)loadingScheduleSuccess {}

- (void)loadingScheduleStart {}

- (void)loadingUserStart {}

- (void)loadingUserFailed {}

- (void)loadingUserSuccess {}

@end
