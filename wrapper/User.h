//
//  User.h
//  wrapper
//
//  Created by Jinqiu Deng on 12/6/13.
//  Copyright (c) 2013 MusicKids. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject

+ (User*)getInstance;

@property (nonatomic) NSString* name;

@property (nonatomic) NSMutableArray* courses;

- (NSInteger)startYear;

- (NSInteger)endYear;

- (NSInteger)totalYearNumber;

- (BOOL)hasClassOnYear:(NSInteger)year month:(NSInteger)month day:(NSInteger)day;

- (BOOL)hasClassOnYear:(NSInteger)year month:(NSInteger)month;

@end
