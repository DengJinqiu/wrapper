//
//  HTTPManager.h
//  wrapper
//
//  Created by Jinqiu Deng on 12/20/13.
//  Copyright (c) 2013 MusicKids. All rights reserved.
//

#import "AFHTTPSessionManager.h"

@interface HTTPManager : AFHTTPSessionManager

+ (HTTPManager*)getInstance;

@end
