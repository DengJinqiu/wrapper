//
//  YearlyView.h
//  wrapper
//
//  Created by xcode-dev on 11/21/13.
//  Copyright (c) 2013 MusicKids. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YearlyView : UIView

- (id)initWithYear:(NSInteger)year delegate:(id)delegate;

@property (readonly, nonatomic, assign) NSInteger year;

@property (strong, nonatomic, readwrite) NSMutableArray *monthButtons;

@end
