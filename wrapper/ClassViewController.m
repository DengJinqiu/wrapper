//
//  ClassViewController.m
//  wrapper
//
//  Created by Jinqiu Deng on 12/5/13.
//  Copyright (c) 2013 MusicKids. All rights reserved.
//

#import "ClassViewController.h"
#import "User.h"
#import "Course.h"

@interface ClassViewController ()

@property (nonatomic) NSInteger courseId;

@end

@implementation ClassViewController

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
