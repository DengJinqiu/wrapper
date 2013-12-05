//
//  MonthlyView.h
//  wrapper
//
//  Created by xcode-dev on 11/21/13.
//  Copyright (c) 2013 MusicKids. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CalendarPanel.h"

@interface MonthPanel : CalendarPanel

@property (nonatomic, readonly) NSInteger month;

- (id)initWithYear:(NSInteger)year month:(NSInteger)month originY:(NSInteger)y;

@end
