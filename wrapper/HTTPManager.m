//
//  HTTPManager.m
//  wrapper
//
//  Created by Jinqiu Deng on 12/20/13.
//  Copyright (c) 2013 MusicKids. All rights reserved.
//

#import "HTTPManager.h"

@implementation HTTPManager

static HTTPManager *_manager;

+ (HTTPManager*)getInstance
{
    if (_manager == nil) {
        NSURL *baseURL = [NSURL URLWithString:@"http://wrapper-server.herokuapp.com/"];
        _manager = [[HTTPManager alloc] initWithBaseURL:baseURL];
    }
    return _manager;
}

@end
