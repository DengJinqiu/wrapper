//
//  MonthlyViewController.h
//  wrapper
//
//  Created by Jinqiu Deng on 11/20/13.
//  Copyright (c) 2013 MusicKids. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainMode.h"

@interface MonthlyViewController : UIViewController

@property (assign, nonatomic, readwrite) NSInteger startYear;

@property (assign, nonatomic, readwrite) NSInteger startMonth;

@property (weak, nonatomic, readonly) MainMode* mainMode;

@end
