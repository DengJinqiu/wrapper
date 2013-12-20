//
//  User.h
//  wrapper
//
//  Created by Jinqiu Deng on 12/6/13.
//  Copyright (c) 2013 MusicKids. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserDelegate.h"

@interface User : NSObject

+ (void)createInstanceWithEmail:(NSString*)email password:(NSString*)password delegate:(id<UserDelegate>)delegate;

+ (User*)getInstance;

@property (nonatomic) NSString* name;

@property (nonatomic) NSMutableSet* courseIds;

@property (nonatomic) NSInteger id;

- (NSInteger)startYear;

- (NSInteger)endYear;

- (NSInteger)totalYearNumber;

- (BOOL)hasCourseOnYear:(NSInteger)year month:(NSInteger)month day:(NSInteger)day;

- (BOOL)hasCourseOnYear:(NSInteger)year month:(NSInteger)month;

@end