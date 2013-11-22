//
//  MonthlyView.h
//  wrapper
//
//  Created by xcode-dev on 11/21/13.
//  Copyright (c) 2013 MusicKids. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MonthlyView : UIView

- (instancetype)initWithYear:(NSInteger)year month:(NSInteger)month
               index:(NSInteger)index delegate:(id)delegate;

@end
