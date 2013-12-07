//
//  Calendar.h
//  wrapper
//
//  Created by Jinqiu Deng on 11/20/13.
//  Copyright (c) 2013 MusicKids. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Date.h"

@interface Schedule : NSObject

+ (Schedule*)getInstance;

- (Date*)currentDate;

- (Date*)year:(NSInteger)year month:(NSInteger)month day:(NSInteger)day;

@end