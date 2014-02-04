//
//  Teacher.h
//  wrapper
//
//  Created by Jinqiu Deng on 12/6/13.
//  Copyright (c) 2013 MusicKids. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  The teacher.
 */
@interface Teacher : NSObject

/**
 *  Initialize a teacher with the teacher id.
 *  @param teacherId The teacherId.
 */
+ (void)createInstanceWithUserId:(NSNumber*)teacherId;

/**
 *  The instance of a teacher.
 *  @returns Teacher.
 */
+ (Teacher*)getInstance;

/**
 *  Teacher sign out.
 */
+ (void)signOut;

/**
 *  The teacherId.
 */
@property (nonatomic) NSNumber* teacherId;

@end
