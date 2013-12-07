//
//  ClassViewController.m
//  wrapper
//
//  Created by Jinqiu Deng on 12/5/13.
//  Copyright (c) 2013 MusicKids. All rights reserved.
//

#import "AttendanceViewController.h"
#import "User.h"
#import "Course.h"

@interface AttendanceViewController ()

@property (nonatomic) NSInteger year;

@property (nonatomic) NSInteger month;

@property (nonatomic) NSInteger weekday;

@property (nonatomic) NSInteger day;

@property (nonatomic) Attendance* attendance;

@end

@implementation AttendanceViewController

- (id)initWithDay:(NSInteger)day weekday:(NSInteger)weekday month:(NSInteger)month year:(NSInteger)year attendance:(Attendance *)attendance
{
    self = [super init];
    if (self) {
        self.year = year;
        self.month = month;
        self.weekday = weekday;
        self.day = day;
        self.attendance = attendance;
    }
    return self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger num = 0;
    
    for (Course* course in [User getInstance].courseIds) {

    }
    
    return num;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
    cell.accessoryType = UITableViewCellAccessoryCheckmark;
    return cell;
}

- (NSString*)tableTitle
{
    return @"class name";
}

@end