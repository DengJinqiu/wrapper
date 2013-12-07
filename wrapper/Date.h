//
//  Date.h
//  wrapper
//
//  Created by Jinqiu Deng on 12/6/13.
//  Copyright (c) 2013 MusicKids. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Date : NSObject

@property (nonatomic) NSInteger year;

@property (nonatomic) NSInteger month;

@property (nonatomic) NSInteger weekday;

@property (nonatomic) NSInteger day;

@property (nonatomic) NSInteger hour;

- (id)initWithDateComponents:(NSDateComponents*)dateComponents;

- (NSString*)yearMonthDescription;

- (NSString*)yearMonthDayDescription;

@end
