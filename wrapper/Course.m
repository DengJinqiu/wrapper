//
//  ClassAttendance.m
//  wrapper
//
//  Created by Jinqiu Deng on 12/6/13.
//  Copyright (c) 2013 MusicKids. All rights reserved.
//

#import "Course.h"

@implementation Course

- (NSMutableArray*)schedule
{
    if (_schedule) {
        _schedule = [[NSMutableArray alloc] init];
    }
    return _schedule;
}

@end