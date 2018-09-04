//
//  NSObject+BZAddImpChange.h
//  BZCategoryDemo
//
//  Created by Eric on 2018/5/17.
//  Copyright © 2018年 Eric. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (BZAddImpChange)

/**
 交换两个函数实现指针  参数均为NSString类型
 
 @param systemMethodString 系统方法名
 @param systemClassString 系统实现方法类名
 @param custMethodString 自定义方法名
 @param targetClassString 目标实现类名
 */
+ (void)bz_swizzlingSysMethod:(NSString *)systemMethodString sysClassString:(NSString *)systemClassString toCustMethod:(NSString *)custMethodString targetClassString:(NSString *)targetClassString;

@end
