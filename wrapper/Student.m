//
//  Student.m
//  wrapper
//
//  Created by Jinqiu Deng on 12/7/13.
//  Copyright (c) 2013 MusicKids. All rights reserved.
//

#import "Student.h"

@implementation Student

+ (void)addWithFirstName:(NSString*)firstName lastName:(NSString*)lastName studentId:(NSString*)studentId
{
    Student* student = [[Student alloc] init];

    student.firstName = firstName;
    student.lastName = lastName;
    student.studentId = studentId;
    if (!_students) {
        _students = [[NSMutableDictionary alloc] init];
    }
    [_students setValue:student forKey:studentId];
}

static NSMutableDictionary* _students;

+ (Student*)getStudentById:(NSString*)id
{
    return [_students objectForKey:id];
}

+ (NSMutableDictionary*)studentIds
{
    return _students;
}

+ (void)clearStudentIds
{
    _students = nil;
}

@end
