//
//  DayButton.h
//  wrapper
//
//  Created by xcode-dev on 11/21/13.
//  Copyright (c) 2013 MusicKids. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DayButton : UIButton

@property (nonatomic, assign, readwrite) NSInteger day;

@property (nonatomic, assign, readwrite) NSInteger month;

@property (nonatomic, assign, readwrite) NSInteger year;

@property (nonatomic, assign, readwrite) NSInteger weekday;

- (void)year:(NSInteger)year month:(NSInteger)month
     weekday:(NSInteger)weekday day:(NSInteger)day;

+ (NSArray*)weekdayLabels;

+ (NSArray*)weekdayFullNames;
@end
