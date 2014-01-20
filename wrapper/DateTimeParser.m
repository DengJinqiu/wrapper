//
//  DateTimeParser.m
//  wrapper
//
//  Created by Jinqiu Deng on 1/19/14.
//  Copyright (c) 2014 MusicKids. All rights reserved.
//

#import "DateTimeParser.h"

@implementation DateTimeParser

+ (NSInteger)year:(NSString *)time
{
    return [[time substringWithRange:NSMakeRange(0, 4)] intValue];
}

+ (NSInteger)month:(NSString *)time
{
    return [[time substringWithRange:NSMakeRange(5, 2)] intValue];
}

+ (NSInteger)day:(NSString *)time
{
    return [[time substringWithRange:NSMakeRange(8, 2)] intValue];
}

+ (NSInteger)hour:(NSString *)time
{
    return [[time substringWithRange:NSMakeRange(11, 2)] intValue];
}

+ (NSInteger)min:(NSString *)time
{
    return [[time substringWithRange:NSMakeRange(13, 2)] intValue];
}

@end
