//
//  MonthlyView.h
//  wrapper
//
//  Created by xcode-dev on 11/21/13.
//  Copyright (c) 2013 MusicKids. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MonthPanel : UIView

- (instancetype)initWithYear:(NSInteger)year month:(NSInteger)month;

@property (assign, nonatomic, readwrite) NSInteger year;

@property (assign, nonatomic, readwrite) NSInteger month;

@end
