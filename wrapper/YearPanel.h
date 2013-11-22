//
//  YearlyView.h
//  wrapper
//
//  Created by xcode-dev on 11/21/13.
//  Copyright (c) 2013 MusicKids. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YearPanel : UIView

- (id)initWithYear:(NSInteger)year;

@property (readonly, nonatomic, assign) NSInteger year;

@property (strong, nonatomic, readwrite) NSMutableArray *monthButtons;

@end
