//
//  Teacher.h
//  wrapper
//
//  Created by Jinqiu Deng on 12/6/13.
//  Copyright (c) 2013 MusicKids. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Teacher : NSObject

+ (void)createInstanceWithUserId:(NSNumber*)teacherId;

+ (Teacher*)getInstance;

+ (void)signOut;

@property (nonatomic) NSNumber* teacherId;

@end