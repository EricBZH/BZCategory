//
//  BZCategoryDemoTests.m
//  BZCategoryDemoTests
//
//  Created by Eric on 2018/5/16.
//  Copyright © 2018年 Eric. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "BZCategory.h"

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

/**
 测试NSUserDefault存储自定义对象
 */
- (void)testSetCustomModel
{
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    NSString *key = @"key";
    
    BZModel *m1 = [[BZModel alloc]init];
    m1.name = @"张三";
    
    [userDefault bz_SetCustomObject:m1 forKey:key];
    
    BZModel *m2 = [userDefault bz_ObjectForKey:key];
    NSLog(@"%@",m2.name);
}


/**
 测试字典设置空值
 */
- (void)testNilDictionary
{
    NSString *valueString = nil;
    
    NSDictionary *dict = @{
                           @"key":valueString
                           };
}

/**
 测试可变字典设置空值
 */
- (void)testNilMutableDictionary
{
    NSString *valueString = nil;
    
    NSMutableDictionary *dict1 = [NSMutableDictionary dictionary];
    [dict1 setObject:valueString forKey:@"key"];
}

/**
 测试数组越界
 */
- (void)testArrayOutOfBounds
{
    NSInteger index = 5;
    
    NSArray *array1 = @[];//没有元素
    
    id obj1 = [array1 objectAtIndex:index];
    
    NSArray *array2 = @[@"只有一个元素"];
    
    id obj2 = [array2 objectAtIndex:index];
    
    NSArray *array3 = @[@"有多个元素",@"有多个元素",@"有多个元素"];
    
    id obj3 = [array3 objectAtIndex:index];
    
    NSString *valueString = nil;
    NSArray *array4 = @[valueString];
}

/**
 测试可变数组越界
 */
- (void)testMutableArrayOutOfBounds
{
    NSInteger index = 5;
    
    NSMutableArray *array1 = [NSMutableArray array];
    
    [array1 removeObjectAtIndex:index];

    NSString *valueString = nil;
    [array1 addObject:valueString];
}



@end
