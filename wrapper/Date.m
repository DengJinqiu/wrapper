//
//  Date.m
//  wrapper
//
//  Created by Jinqiu Deng on 12/6/13.
//  Copyright (c) 2013 MusicKids. All rights reserved.
//

#import "Date.h"

@interface Date ()

@property (nonatomic) NSDateComponents* dateComponents;

@end

@implementation Date

- (id)initWithDateComponents:(NSDateComponents*)dateComponents
{
    self = [super init];
    if (self) {
        self.dateComponents = dateComponents;
    }
    return self;
}

- (NSString*)yearMonthDescription
{
    return [NSString stringWithFormat:@"%d%d", self.year, self.month];
}

- (NSString*)yearMonthDayDescription
{
    return [NSString stringWithFormat:@"%@%d", self.yearMonthDescription, self.day];
}

- (NSInteger)year
{
    return self.dateComponents.year;
}

- (NSInteger)month
{
    return self.dateComponents.month;
}

- (NSInteger)weekday
{
    return self.dateComponents.weekday;
}

- (NSInteger)day
{
    return self.dateComponents.day;
}

@end