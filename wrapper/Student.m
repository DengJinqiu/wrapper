//
//  Student.m
//  wrapper
//
//  Created by Jinqiu Deng on 12/7/13.
//  Copyright (c) 2013 MusicKids. All rights reserved.
//

#import "Student.h"

@implementation Student

- (id)initWithFirstName:(NSString *)firstName lastName:(NSString *)lastName studentId:(NSString *)studentId
{
    self = [self init];
    if (self) {
        self.firstName = firstName;
        self.lastName = lastName;
        self.studentId = studentId;
        if (!_students) {
            _students = [[NSMutableDictionary alloc] init];
        }
        [_students setValue:self forKey:studentId];
    }
    return self;
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
