//
//  Term.m
//  wrapper
//
//  Created by Jinqiu Deng on 1/19/14.
//  Copyright (c) 2014 MusicKids. All rights reserved.
//

#import "Term.h"

@implementation Term

static Term* _term;

+ (void)createInstanceWithStartYear:(NSInteger)startYear endYear:(NSInteger)endYear andTermId:(NSNumber*)termId
{
    _term = [[Term alloc] init];
    _term.startYear = startYear;
    _term.endYear = endYear;
    _term.termId = termId;
}

+ (Term*)getInstance
{
    return _term;
}

- (NSInteger)totalYearNumber
{
    return self.endYear - self.startYear + 1;
}

+ (void)clearTerm
{
    _term = nil;
}

@end
