//
//  CalendarButton.h
//  wrapper
//
//  Created by Jinqiu Deng on 12/4/13.
//  Copyright (c) 2013 MusicKids. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CalendarButton : UIButton

@property (nonatomic, readonly) NSInteger month;

@property (nonatomic, readonly) NSInteger year;

- (id)initWithYear:(NSInteger)year month:(NSInteger)month originX:(NSInteger)x originY:(NSInteger)y;

- (void)markCurrent;

@end
