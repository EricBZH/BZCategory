//
//  NSArray+BZAddSafe.m
//  BZCategoryDemo
//
//  Created by Eric on 2018/5/17.
//  Copyright © 2018年 Eric. All rights reserved.
//

#import "NSArray+BZAddSafe.h"
#import <objc/runtime.h>
#import "NSObject+BZAddImpChange.h"

@implementation NSArray (BZAddSafe)

#ifdef DEBUG

#else

+ (void)load{
    
    static dispatch_once_t onceDispatch;
    dispatch_once(&onceDispatch, ^{
        [self swizzlingSysMethod:@"objectAtIndex:" sysClassString:@"__NSArray0" toCustMethod:@"bz_objectAtIndex1:" targetClassString:@"NSArray"];
        [self swizzlingSysMethod:@"objectAtIndex:" sysClassString:@"__NSArrayI" toCustMethod:@"bz_objectAtIndex2:" targetClassString:@"NSArray"];
        [self swizzlingSysMethod:@"objectAtIndex:" sysClassString:@"__NSSingleObjectArrayI" toCustMethod:@"bz_objectAtIndex3:" targetClassString:@"NSArray"];
        
        [self swizzlingSysMethod:@"initWithObjects:count:" sysClassString:@"__NSPlaceholderArray" toCustMethod:@"initWithObjects_bz:count:" targetClassString:@"NSArray"];
        
        [self swizzlingSysMethod:@"arrayByAddingObject:" sysClassString:@"__NSArrayI" toCustMethod:@"arrayByAddingObject_bz:" targetClassString:@"NSArray"];
    });
    
}

#endif


- (id)bz_objectAtIndex1:(NSUInteger)index{
    //判断数组是否越界
    if (index >= [self count]) {
        return nil;
    }
    
    return [self bz_objectAtIndex1:index];
}

- (id)bz_objectAtIndex2:(NSUInteger)index{
    //判断数组是否越界
    if (index >= [self count]) {
        return nil;
    }
    
    return [self bz_objectAtIndex2:index];
}

- (id)bz_objectAtIndex3:(NSUInteger)index{
    //判断数组是否越界
    if (index >= [self count]) {
        return nil;
    }
    
    return [self bz_objectAtIndex3:index];
}

- (NSArray *)arrayByAddingObject_bz:(id)anObject {
    if (!anObject) {
        return self;
    }
    return [self arrayByAddingObject_bz:anObject];
}

- (instancetype)initWithObjects_bz:(id *)objects count:(NSUInteger)count {
    NSUInteger newCount = 0;
    for (NSUInteger i = 0; i < count; i++) {
        if (!objects[i]) {
            break;
        }
        newCount++;
    }
    self = [self initWithObjects_bz:objects count:newCount];
    return self;
}

@end
