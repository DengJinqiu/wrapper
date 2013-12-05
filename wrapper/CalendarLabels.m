//
//  CalendarLabels.m
//  wrapper
//
//  Created by Jinqiu Deng on 12/4/13.
//  Copyright (c) 2013 MusicKids. All rights reserved.
//

#import "CalendarLabels.h"

@implementation CalendarLabels

+ (NSArray*)monthLabels
{
    return @[@"", @"JAN", @"FEB", @"MAR", @"APR", @"MAY", @"JUN",
             @"JUL", @"AUG", @"SEP", @"OCT", @"NOV", @"DEC"];
}

+ (NSArray*)monthFullNames
{
    return @[@"", @"January", @"February", @"March", @"April", @"May", @"June",
             @"July", @"August", @"September", @"October", @"November", @"December"];
}

+ (NSArray*)weekdayLabels
{
    return @[@"", @"S", @"M", @"T", @"W", @"T", @"F", @"S"];
}

+ (NSArray*)weekdayFullNames
{
    return @[@"", @"Sunday", @"Monday", @"Tuesday", @"Wednesday", @"Thursday", @"Friday", @"Saturday"];
}

@end
