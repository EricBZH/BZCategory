//
//  NSArray+BZAdd.h
//  BZCategoryDemo
//
//  Created by Eric on 2018/8/16.
//  Copyright © 2018年 Eric. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 __covariant 可逆变成父类对象
 */
@interface NSArray <__covariant ObjectType>(BZAdd)

/**
 通过传入模型返回指定的key
 
 @param value 模型
 @return key
 */
typedef id<NSCopying>(^GenerateKeyBlock)(ObjectType value);

/**
 将模型数组转换成字典
 
 @param generateKeyBlock 通过传入模型返回指定的key
 @return 模型字典
 */
- (NSDictionary <id, ObjectType> *)bz_linkItemsWithGenerateKeyBlock:(GenerateKeyBlock)generateKeyBlock;

@end
