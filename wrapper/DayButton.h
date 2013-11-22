//
//  DayButton.h
//  wrapper
//
//  Created by xcode-dev on 11/21/13.
//  Copyright (c) 2013 MusicKids. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DayButton : UIButton

@property (nonatomic, assign, readonly) NSInteger day;

@property (nonatomic, assign, readonly) NSInteger month;

@property (nonatomic, assign, readonly) NSInteger year;

@property (nonatomic, assign, readonly) NSInteger weekday;

- (void)year:(NSInteger)year month:(NSInteger)month
     weekday:(NSInteger)weekday day:(NSInteger)day;

@end
