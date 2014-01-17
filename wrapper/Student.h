//
//  Student.h
//  wrapper
//
//  Created by Jinqiu Deng on 12/7/13.
//  Copyright (c) 2013 MusicKids. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Student : NSObject

@property (nonatomic) NSNumber* studentId;

@property (nonatomic) NSString* firstName;

@property (nonatomic) NSString* lastName;

+ (void)addWithFirstName:(NSString*)firstName lastName:(NSString*)lastName studentId:(NSNumber*)studentId;

+ (Student*)getStudent:(NSNumber*)studentId;

+ (NSMutableDictionary*)studentIds;

+ (void)clearStudentIds;

@end
