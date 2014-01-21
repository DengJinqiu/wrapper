//
//  Term.h
//  wrapper
//
//  Created by Jinqiu Deng on 1/19/14.
//  Copyright (c) 2014 MusicKids. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Term : NSObject

+ (void)createInstanceWithStartYear:(NSInteger)startYear endYear:(NSInteger)endYear andTermId:(NSNumber*)termId;

+ (Term*)getInstance;

+ (void)clearTerm;

@property (nonatomic) NSNumber* termId;

@property (nonatomic) NSInteger startYear;

@property (nonatomic) NSInteger endYear;

- (NSInteger)totalYearNumber;

@end
