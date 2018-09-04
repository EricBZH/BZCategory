//
//  NSObject+BZAddImpChange.m
//  BZCategoryDemo
//
//  Created by Eric on 2018/5/17.
//  Copyright © 2018年 Eric. All rights reserved.
//

#import "NSObject+BZAddImpChange.h"
#import <objc/runtime.h>

@implementation NSObject (BZAddImpChange)

+ (void)bz_swizzlingSysMethod:(NSString *)systemMethodString sysClassString:(NSString *)systemClassString toCustMethod:(NSString *)custMethodString targetClassString:(NSString *)targetClassString{
    
    //系统方法IMP
    Method sysMethod = class_getInstanceMethod(NSClassFromString(systemClassString), NSSelectorFromString(systemMethodString));
    
    //自定义方法的IMP
    Method safeMethod = class_getInstanceMethod(NSClassFromString(targetClassString), NSSelectorFromString(custMethodString));
    
    //通过IMP相互交换，进而交换方法的实现
    method_exchangeImplementations(safeMethod,sysMethod);
}

@end
