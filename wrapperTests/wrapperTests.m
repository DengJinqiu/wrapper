//
//  wrapperTests.m
//  wrapperTests
//
//  Created by Jinqiu Deng on 11/20/13.
//  Copyright (c) 2013 MusicKids. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Schedule.h"

@interface wrapperTests : XCTestCase

@end

@implementation wrapperTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample
{
//    XCTFail(@"No implementation for \"%s\"", __PRETTY_FUNCTION__);
    NSLog(@"day: %d", [[[[Schedule alloc] init] currentDate] day]);
    NSLog(@"day: %d", [[[[Schedule alloc] init] currentDate] month]);
    NSLog(@"day: %d", [[[[Schedule alloc] init] currentDate] year]);
    NSLog(@"day: %d", [[[[Schedule alloc] init] currentDate] weekday]);
    NSLog(@"day: %d", [[[[Schedule alloc] init] currentDate] weekdayOrdinal]);
    NSLog(@"day: %d", [[[[Schedule alloc] init] currentDate] weekOfMonth]);
}

@end
