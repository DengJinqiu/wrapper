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
    }
    return self;
}

@end
