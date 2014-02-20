//
//  Term.h
//  wrapper
//
//  Created by Jinqiu Deng on 1/19/14.
//  Copyright (c) 2014 MusicKids. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  The term.
 */
@interface Term : NSObject

/**
 *  Create an instance of a term with the start year, end year and term id.
 *  @param startYear The start year of the term.
 *  @param endYear The end year of the term.
 *  @param termId The term id.
 */
+ (void)createInstanceWithStartYear:(NSInteger)startYear endYear:(NSInteger)endYear andTermId:(NSNumber*)termId;

/**
 *  Get an instance of a term.
 *  @return An instance of term.
 */
+ (Term*)getInstance;

/**
 *  Clear the information of a term.
 */
+ (void)clearTerm;

/**
 *  The term id.
 */
@property (nonatomic) NSNumber* termId;

/**
 *  The start year.
 */
@property (nonatomic) NSInteger startYear;

/**
 *  The end year.
 */
@property (nonatomic) NSInteger endYear;

/**
 *  The number of total year.
 *  @returns The number of total year.
 */
- (NSInteger)totalYearNumber;

@end
