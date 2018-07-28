//
//  NSMutableArray+BZAddSafe.m
//  BZCategoryDemo
//
//  Created by Eric on 2018/5/17.
//  Copyright © 2018年 Eric. All rights reserved.
//

#import "NSMutableArray+BZAddSafe.h"
#import <objc/runtime.h>
#import "NSObject+BZAddImpChange.h"

@implementation NSMutableArray (BZAddSafe)

//#ifdef DEBUG
//
//#else

+ (void)load{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self swizzlingSysMethod:@"addObject:" sysClassString:@"__NSArrayM" toCustMethod:@"bz_addObject:" targetClassString:@"NSMutableArray"];
        
        [self swizzlingSysMethod:@"insertObject:atIndex:" sysClassString:@"__NSArrayM" toCustMethod:@"bz_insertObject:atIndex:" targetClassString:@"NSMutableArray"];
        
        [self swizzlingSysMethod:@"removeObjectAtIndex:" sysClassString:@"__NSArrayM" toCustMethod:@"bz_removeObjectAtIndex:" targetClassString:@"NSMutableArray"];
        
        [self swizzlingSysMethod:@"replaceObjectAtIndex:withObject:" sysClassString:@"__NSArrayM" toCustMethod:@"bz_safe_replaceObjectAtIndex:withObject:" targetClassString:@"NSMutableArray"];
        
        [self swizzlingSysMethod:@"removeObjectsAtIndexes:" sysClassString:@"NSMutableArray" toCustMethod:@"bz_removeObjectsAtIndexes:" targetClassString:@"NSMutableArray"];
        
        [self swizzlingSysMethod:@"removeObjectsInRange:" sysClassString:@"NSMutableArray" toCustMethod:@"bz_removeObjectsInRange:" targetClassString:@"NSMutableArray"];
        
        [self swizzlingSysMethod:@"objectAtIndex:" sysClassString:@"__NSArrayM" toCustMethod:@"bz_objectAtIndex:" targetClassString:@"NSMutableArray"];
        
    });
    
}

//#endif


- (void)bz_addObject:(id)anObject{
    if (!anObject) {
        return;
    }
    [self bz_addObject:anObject];
}

- (void)bz_insertObject:(id)anObject atIndex:(NSUInteger)index {
    if (index > [self count]) {
        return;
    }
    if (!anObject) {
        return;
    }
    [self bz_insertObject:anObject atIndex:index];
}

- (void)bz_removeObjectAtIndex:(NSUInteger)index {
    if (index >= [self count]) {
        return;
    }
    
    return [self bz_removeObjectAtIndex:index];
}

- (void)safe_replaceObjectAtIndex:(NSUInteger)index withObject:(id)anObject {
    if (index >= [self count]) {
        return;
    }
    if (!anObject) {
        return;
    }
    [self safe_replaceObjectAtIndex:index withObject:anObject];
}

- (void)bz_removeObjectsAtIndexes:(NSIndexSet *)indexes{
    NSMutableIndexSet * mutableSet = [NSMutableIndexSet indexSet];
    [indexes enumerateIndexesUsingBlock:^(NSUInteger idx, BOOL * _Nonnull stop) {
        if (idx < [self count ]) {
            [mutableSet addIndex:idx];
        }
    }];
    [self bz_removeObjectsAtIndexes:mutableSet];
}

- (void)bz_removeObjectsInRange:(NSRange)range{
    //获取最大索引
    if (range.location + range.length - 1 < [self count]) {
        [self bz_removeObjectsInRange:range];
        return;
    }
    if (range.location >= [self count]) {
        return;
    }
    NSInteger tempInteger = range.location + range.length - 1;
    while (tempInteger >= [self count]) {
        tempInteger -= 1;
    }
    NSRange tempRange = NSMakeRange(range.location, tempInteger + 1 -range.location);
    [self bz_removeObjectsInRange:tempRange];
}

- (id)bz_objectAtIndex:(NSUInteger)index{
    //判断数组是否越界
    if (index >= [self count]) {
        return nil;
    }
    return [self bz_objectAtIndex:index];
}

@end
