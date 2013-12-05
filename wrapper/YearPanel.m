//
//  YearlyView.m
//  wrapper
//
//  Created by xcode-dev on 11/21/13.
//  Copyright (c) 2013 MusicKids. All rights reserved.
//

#import "YearPanel.h"
#import "MonthButton.h"

@implementation YearPanel

- (id)initWithYear:(NSInteger)year originY:(NSInteger)y
{
    self = [super initWithYear:year originY:y];
    if (self) {
        [[super panelLabel] setText:[NSString stringWithFormat:@"%ld", (long)self.year]];
    }
    return self;
}

@end
