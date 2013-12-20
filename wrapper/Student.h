//
//  Student.h
//  wrapper
//
//  Created by Jinqiu Deng on 12/7/13.
//  Copyright (c) 2013 MusicKids. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Student : NSObject

@property (nonatomic) NSString* studentId;

@property (nonatomic) NSString* firstName;

@property (nonatomic) NSString* lastName;

+ (void)addWithFirstName:(NSString*)firstName lastName:(NSString*)lastName studentId:(NSString*)studentId;

+ (Student*)getStudentById:(NSString*)id;

+ (NSMutableDictionary*)studentIds;

+ (void)clearStudentIds;

@end
