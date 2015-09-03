//
//  HMStopWatchTest.m
//  HMStopWatch
//
//  Created by MuronakaHiroaki on 2015/09/02.
//  Copyright © 2015年 hmu. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "HMStopWatch.h"

@interface HMStopWatchTest : XCTestCase

@end

@implementation HMStopWatchTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

-(void)testInit {
    
    HMStopWatch* stopwatch = [HMStopWatch new];
    XCTAssertEqual(stopwatch.time, 0);
}

-(void)testSleep1 {
    
    HMStopWatch* stopwatch = [HMStopWatch new];
    
    [stopwatch start];
    sleep(1);
    [stopwatch stop];
    
    double second = 1 * 1000000;
    double ms = 5 * 1000;
    XCTAssertEqualWithAccuracy(stopwatch.time,
                               second,
                               ms);
}

-(void)testContinue {

    HMStopWatch* stopwatch = [HMStopWatch new];
    
    [stopwatch start];
    sleep(1);
    [stopwatch stop];
    
    [stopwatch start];
    sleep(1);
    [stopwatch stop];
    
    double second = 2 * 1000000;
    double ms = 5 * 1000;
    XCTAssertEqualWithAccuracy(stopwatch.time,
                               second,
                               ms);
}

-(void)testReset {
    HMStopWatch* stopwatch = [HMStopWatch new];
    
    [stopwatch start];
    sleep(1);
    [stopwatch stop];
    
    double second = 1 * 1000000;
    double ms = 5 * 1000;
    XCTAssertEqualWithAccuracy(stopwatch.time,
                               second,
                               ms);
    
    [stopwatch reset];
    XCTAssertEqual(stopwatch.time, 0);
}

-(void)testRunner {
    
    HMStopWatch* stopwatch = [HMStopWatch new];
    
    [stopwatch startWithRunner:^(HMStopWatch *stopwatch) {
        sleep(1);
    }];
    
    double second = 1 * 1000000;
    double ms = 5 * 1000;
    XCTAssertEqualWithAccuracy(stopwatch.time,
                               second,
                               ms);
    
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
