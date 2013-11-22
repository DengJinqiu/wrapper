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


- (instancetype)initWithMainMode:(MainMode*)mainMode
                  yearNavigateTo:(NSInteger)year monthNavigateTo:(NSInteger)month;

@end
