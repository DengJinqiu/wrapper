//
//  Student.m
//  wrapper
//
//  Created by Jinqiu Deng on 12/7/13.
//  Copyright (c) 2013 MusicKids. All rights reserved.
//

#import "Student.h"

@implementation Student

- (id)initWithFirstName:(NSString *)firstName lastName:(NSString *)lastName id:(NSString *)id
{
    self = [self init];
    if (self) {
        self.firstName = firstName;
        self.lastName = lastName;
        self.id = id;
        if (!_students) {
            _students = [[NSMutableDictionary alloc] init];
            [_students setValue:self forKey:id];
        }
    }
    return self;
}

static NSMutableDictionary* _students;

+ (Student*)getStudentById:(NSString*)id
{
    return [_students objectForKey:id];
}

+ (NSMutableDictionary*)students
{
    return _students;
}

@end
