//
//  Calendar.h
//  wrapper
//
//  Created by Jinqiu Deng on 11/20/13.
//  Copyright (c) 2013 MusicKids. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Calendar : NSObject

- (NSDateComponents*) currentDate;

- (NSDateComponents*)year:(NSInteger)year month:(NSInteger)month day:(NSInteger)day;

- (NSInteger) startYear;

- (NSInteger) endYear;

@end