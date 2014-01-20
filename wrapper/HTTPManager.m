//
//  HTTPManager.m
//  wrapper
//
//  Created by Jinqiu Deng on 12/20/13.
//  Copyright (c) 2013 MusicKids. All rights reserved.
//

#import "HTTPManager.h"
#import "Term.h"
#import "DateTimeParser.h"
#import "Teacher.h"
#import "Schedule.h"

@implementation HTTPManager

static HTTPManager *_manager;

+ (HTTPManager*)getInstance
{
    if (_manager == nil) {
        NSURL *baseURL = [NSURL URLWithString:@"http://taffy.herokuapp.com/"];
        _manager = [[HTTPManager alloc] initWithBaseURL:baseURL];
    }
    return _manager;
}

+ (void)loadTeacherWithEmail:(NSString *)email password:(NSString *)password delegate:(id<HTTPManagerDelegate>)delegate
{
    NSDictionary *parameters = @{@"email": email, @"password": password};
    
    [[HTTPManager getInstance] GET:@"users/verify" parameters:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
        NSLog(@"%@",[(NSDictionary*)responseObject objectForKey:@"id"]);
         if ([[(NSDictionary*)responseObject objectForKey:@"type"] isEqualToString:@"Teacher"]) {
             [Teacher createInstanceWithUserId:[(NSDictionary*)responseObject objectForKey:@"id"]];
            [self loadTermWithDelegate:delegate];
            [delegate creatingUserSuccess];
        } else {
            [delegate creatingUserFailed];
        }
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        [delegate creatingUserFailed];
    }];
}

+ (void)loadTermWithDelegate:(id<HTTPManagerDelegate>)delegate
{
    NSString *relativeURL = @"terms/current";
    [[HTTPManager getInstance] GET:relativeURL parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        [Term createInstanceWithStartYear:[[(NSDictionary*)responseObject objectForKey:@"start_date"] intValue]
                                  endYear:[[(NSDictionary*)responseObject objectForKey:@"end_date"] intValue]
                                andTermId:[(NSDictionary*)responseObject objectForKey:@"id"]];
        [self loadCoursesWithDelegate:delegate];
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        [delegate loadingDataFailed];
    }];
}

+ (void)loadCoursesWithDelegate:(id<HTTPManagerDelegate>)delegate
{
    NSString *relativeURL = [NSString stringWithFormat:@"teachers/%@/courses", [Teacher getInstance].teacherId];
    [[HTTPManager getInstance] GET:relativeURL parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        [Term createInstanceWithStartYear:[[(NSDictionary*)responseObject objectForKey:@"start_date"] intValue]
                                  endYear:[[(NSDictionary*)responseObject objectForKey:@"end_date"] intValue]
                                andTermId:[(NSDictionary*)responseObject objectForKey:@"id"]];
        [self loadScheduleFor:0 WithDelegate:delegate];
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        [delegate loadingDataFailed];
    }];
}

+ (void)loadScheduleFor:(NSInteger)courseIndex WithDelegate:(id<HTTPManagerDelegate>)delegate
{
    if (courseIndex < [Schedule coursesNum]) {
        
    } else {
        [delegate loadingDataSuccess];
    }
}

@end