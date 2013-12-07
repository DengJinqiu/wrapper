//
//  Student.h
//  wrapper
//
//  Created by Jinqiu Deng on 12/7/13.
//  Copyright (c) 2013 MusicKids. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Student : NSObject

@property (nonatomic) NSString* id;

@property (nonatomic) NSString* firstName;

@property (nonatomic) NSString* lastName;

- (id)initWithFirstName:(NSString*)firstName lastName:(NSString*)lastName id:(NSString*)id;

@end
