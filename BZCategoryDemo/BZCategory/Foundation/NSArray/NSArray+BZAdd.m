//
//  NSArray+BZAdd.m
//  BZCategoryDemo
//
//  Created by Eric on 2018/8/16.
//  Copyright © 2018年 Eric. All rights reserved.
//

#import "NSArray+BZAdd.h"

@implementation NSArray (BZAdd)

/**
 将模型数组转换成字典
 
 @param generateKeyBlock 通过传入模型返回指定的key
 @return 模型字典
 */
- (NSDictionary *)bz_LinkItemsWithGenerateKeyBlock:(GenerateKeyBlock)generateKeyBlock
{
    NSMutableDictionary *mDict = [NSMutableDictionary dictionary];

    [self enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        id key = generateKeyBlock(obj);
        [mDict setObject:obj forKey:key];
    }];

    return mDict;
}

@end
