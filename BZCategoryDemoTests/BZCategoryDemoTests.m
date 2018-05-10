//
//  BZCategoryDemoTests.m
//  BZCategoryDemoTests
//
//  Created by Eric on 2018/5/5.
//  Copyright © 2018年 Eric. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "BZModel.h"

@interface BZCategoryDemoTests : XCTestCase

@end

@implementation BZCategoryDemoTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

- (void)testModel
{
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    NSString *key = @"key";

    BZModel *m1 = [[BZModel alloc]init];
    m1.name = @"张三";
    
    [userDefault setObject:m1 forKey:key];
    
    BZModel *m2 = [userDefault objectForKey:key];
    NSLog(@"%@",m2.name);
}

@end
