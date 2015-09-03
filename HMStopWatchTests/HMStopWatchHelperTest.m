//
//  HMStopWatchHelperTest.m
//  HMStopWatch
//
//  Created by MuronakaHiroaki on 2015/09/02.
//  Copyright © 2015年 hmu. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <sys/time.h>

#import "HMStopWatchHelper.h"

@interface HMStopWatchHelperTest : XCTestCase

@end

@implementation HMStopWatchHelperTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

-(void)testDifferenceZero {
    
    struct timeval beginTime;
    struct timeval endTime;
    
    bzero(&beginTime, sizeof(beginTime));
    bzero(&endTime, sizeof(endTime));
    
    XCTAssertEqual( hm_getDifferenceTimeVal(&beginTime, &endTime),
                   0);
}


-(void)testDiferenceGreater {
    struct timeval beginTime;
    struct timeval endTime;
    bzero(&beginTime, sizeof(beginTime));
    bzero(&endTime, sizeof(endTime));
    
    beginTime.tv_sec = 2;
    beginTime.tv_usec = 200000;
    
    endTime.tv_sec = 5;
    endTime.tv_usec = 300000;
    
    XCTAssertEqualWithAccuracy(hm_getDifferenceTimeVal(&beginTime, &endTime), 3 * 1000000 + 100000, 0.00000005);
}

-(void)testDiferenceGreater2 {
    struct timeval beginTime;
    struct timeval endTime;
    bzero(&beginTime, sizeof(beginTime));
    bzero(&endTime, sizeof(endTime));
    
    beginTime.tv_sec = 2;
    beginTime.tv_usec = 200000;
    
    endTime.tv_sec = 5;
    endTime.tv_usec = 100000;
    
    XCTAssertEqualWithAccuracy(hm_getDifferenceTimeVal(&beginTime, &endTime), 2 * 1000000 + 900000, 0.00000005);
}

-(void)testDiferenceLess {
    struct timeval beginTime;
    struct timeval endTime;
    bzero(&beginTime, sizeof(beginTime));
    bzero(&endTime, sizeof(endTime));
    
    beginTime.tv_sec = 5;
    beginTime.tv_usec = 100000;
    
    endTime.tv_sec = 2;
    endTime.tv_usec = 200000;
    
    XCTAssertEqualWithAccuracy(hm_getDifferenceTimeVal(&beginTime, &endTime), -(2 * 1000000 + 900000), 0.00000005);
}

-(void)testSleep {
    struct timeval beginTime;
    struct timeval endTime;
    bzero(&beginTime, sizeof(beginTime));
    bzero(&endTime, sizeof(endTime));
    
    gettimeofday(&beginTime, NULL);
    sleep(1);
    gettimeofday(&endTime, NULL);
    
    double second = 1 * 1000000;
    double ms = 5 * 1000;
    XCTAssertEqualWithAccuracy(hm_getDifferenceTimeVal(&beginTime, &endTime),
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
