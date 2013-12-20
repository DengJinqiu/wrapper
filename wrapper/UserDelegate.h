//
//  UserDelegate.h
//  wrapper
//
//  Created by Jinqiu Deng on 12/20/13.
//  Copyright (c) 2013 MusicKids. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol UserDelegate <NSObject>

- (void)creatingUserStart;

- (void)creatingUserSuccess;

- (void)creatingUserFailed;

- (void)loadingDataStart;

- (void)loadingDataSuccess;

- (void)loadingDataFailed;

@end
