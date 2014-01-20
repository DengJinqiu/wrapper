//
//  DateTimeParser.h
//  wrapper
//
//  Created by Jinqiu Deng on 1/19/14.
//  Copyright (c) 2014 MusicKids. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DateTimeParser : NSObject

+ (NSInteger)year:(NSString*)time;

+ (NSInteger)month:(NSString*)time;

+ (NSInteger)day:(NSString*)time;

+ (NSInteger)hour:(NSString*)time;

+ (NSInteger)min:(NSString*)time;

@end
