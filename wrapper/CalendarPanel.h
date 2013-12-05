//
//  CalendarPanel.h
//  wrapper
//
//  Created by Jinqiu Deng on 12/4/13.
//  Copyright (c) 2013 MusicKids. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CalendarPanel : UIView

@property (nonatomic, readonly) NSInteger year;

@property (nonatomic) NSMutableArray *calendarButtons;

- (id)initWithYear:(NSInteger)year originY:(NSInteger)y;

- (UILabel*) panelLabel;

@end