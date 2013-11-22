//
//  MonthButton.h
//  wrapper
//
//  Created by xcode-dev on 11/21/13.
//  Copyright (c) 2013 MusicKids. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MonthButton : UIButton

@property (nonatomic, assign, readonly) NSInteger month;

@property (nonatomic, assign, readonly) NSInteger year;

- (void)month:(NSInteger)month year:(NSInteger)year;

+ (NSArray*)monthLabels;

+ (NSArray*)monthFullNames;

@end
