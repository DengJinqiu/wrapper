//
//  teacher.m
//  wrapper
//
//  Created by Jinqiu Deng on 12/6/13.
//  Copyright (c) 2013 MusicKids. All rights reserved.
//

#import "Teacher.h"

@implementation Teacher

static Teacher* _teacher;

+ (void)createInstanceWithUserId:(NSNumber *)teacherId
{
    _teacher = [[Teacher alloc] init];
    _teacher.teacherId = teacherId;
}

+ (Teacher*)getInstance
{
    return _teacher;
}

@end
