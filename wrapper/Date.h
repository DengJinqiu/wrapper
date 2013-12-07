//
//  Date.h
//  wrapper
//
//  Created by Jinqiu Deng on 12/6/13.
//  Copyright (c) 2013 MusicKids. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Date : NSObject

- (id)initWithDateComponents:(NSDateComponents*)dateComponents;

- (NSString*)yearMonthDescription;

- (NSString*)yearMonthDayDescription;

- (NSInteger)year;

- (NSInteger)month;

- (NSInteger)weekday;

- (NSInteger)day;

@end
