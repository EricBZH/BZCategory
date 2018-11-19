//
//  ViewController.m
//  BZCategoryDemo
//
//  Created by Eric on 2018/7/28.
//  Copyright © 2018年 Eric. All rights reserved.
//

#import "ViewController.h"
#import "BZCategory.h"
#import "TestModel.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
//    [self testSetCustomModel];
//
//    [self testSafe];
//
//    [self testArrayToDict];
//
//    [self testTimer];
//
//    [self testButtonCountDown];
//
    [self testString];
}

#pragma mark - 测试NSUserDefault存储自定义对象

/**
 测试NSUserDefault存储自定义对象
 */
- (void)testSetCustomModel
{
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    NSString *key = @"key";
    
    TestModel *m1 = [[TestModel alloc]init];
    m1.name = @"张三";
    
    //通过NSUserDefaults写入自定义类型对象到本地
    [userDefault bz_setObject:m1 forKey:key];
    
    //通过NSUserDefaults从本地取出自定义类型对象
    TestModel *m2 = [userDefault bz_objectForKey:key];
    NSLog(@"%@",m2.name);
}

#pragma mark - 测试安全数组、字典
/**
 测试安全数组、字典
 */
- (void)testSafe
{
    //testNil
    [self testNil];
    
    //testOutOfBounds
    [self testOutOfBounds];
}

/**
 测试空值
 */
- (void)testNil
{
    [self testNilDictionary];
    
    [self testNilMutableDictionary];
    
    [self testNilArray];
    
    [self testNilMutableArray];
}

/**
 测试越界
 */
- (void)testOutOfBounds
{
    [self testArrayOutOfBounds];
    
    [self testMutableArrayOutOfBounds];
}

/**
 测试字典设置空值
 */
- (void)testNilDictionary
{
    NSString *valueString = nil;
    
    //字典写入空值
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
 测试不可变数组越界
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
}

/**
 测试不可变数组空值
 */
- (void)testNilArray
{
    NSString *valueString = nil;
    NSArray *arrayNil = @[valueString];
}

/**
 测试可变数组越界
 */
- (void)testMutableArrayOutOfBounds
{
    NSInteger index = 5;
    
    NSMutableArray *mutableArray = [NSMutableArray array];
    
    //越界删除对象
    [mutableArray removeObjectAtIndex:index];
    //越界取出对象
    id object = [mutableArray objectAtIndex:index];
}

/**
 测试可变数组空值
 */
- (void)testNilMutableArray
{
    NSString *valueString = nil;
    
    NSMutableArray *mutabArrayNil = [NSMutableArray array];
    
    //可变数组放入空值
    [mutabArrayNil addObject:valueString];
}

#pragma mark - 测试数组模型转字典
/**
 测试数组模型转字典
 */
- (void)testArrayToDict
{
    TestModel *m1 = [[TestModel alloc] init];
    m1.name = @"张1";
    m1.index = 1;

    TestModel *m2 = [[TestModel alloc] init];
    m2.name = @"张2";
    m2.index = 2;

    TestModel *m3 = [[TestModel alloc] init];
    m3.name = @"张3";
    m3.index = 3;

    NSArray<TestModel*> *arr = @[m1,m2,m3];

    NSMutableArray<TestModel*> *mArr = [[NSMutableArray alloc] initWithArray:arr];

    NSDictionary <TestModel *,TestModel *>*arrDict = [arr bz_linkItemsWithGenerateKeyBlock:^id<NSCopying>(TestModel *value) {
        return value;
    }];

    NSDictionary <NSNumber *,TestModel *>*mArrDict = [mArr bz_linkItemsWithGenerateKeyBlock:^id<NSCopying>(TestModel *value) {
        return value.name;
    }];

    NSLog(@"%@",arrDict);
    NSLog(@"%@",mArrDict);

}

#pragma mark - 测试定时器

/**
 测试定时器分类
 */
- (void)testTimer
{
    [NSTimer bz_scheduledTimerWithTimeInterval:1 repeats:YES userInfo:nil callBack:^(NSTimer * _Nonnull timer) {
        NSLog(@"test timer...");
    }];
    
    [NSTimer bz_scheduledTimerWithTimeInterval:1 timeOut:60 userInfo:nil callBack:^(NSTimer * _Nonnull timer, NSUInteger timeLeft) {
        NSLog(@"%ld",(long)timeLeft);
    }];
}

#pragma mark - 测试UIButton

/**
 测试UIButton分类
 */
- (void)testButtonCountDown
{
    UIButton *btn = [[UIButton alloc] init];
    [btn bz_addCountdownTime:60 callBack:^(NSInteger timeLeft, UIButton *btn) {
        NSLog(@"%ld",(long)timeLeft);
    }];
}

#pragma mark - 测试字符串

- (void)testString
{
    NSString *x = [[NSString stringWithFormat:@""] bz_placeholder:@"aabbccdd"];
    NSLog(@"%@",x);
}

@end
