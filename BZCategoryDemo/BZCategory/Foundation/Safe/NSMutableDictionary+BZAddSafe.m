//
//  NSMutableDictionary+BZAddSafe.m
//  BZCategoryDemo
//
//  Created by Eric on 2018/5/17.
//  Copyright © 2018年 Eric. All rights reserved.
//

#import "NSMutableDictionary+BZAddSafe.h"
#import <objc/runtime.h>
#import "NSObject+BZAddImpChange.h"

@implementation NSMutableDictionary (BZAddSafe)

#ifdef DEBUG

#else

+ (void)load{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self swizzlingSysMethod:@"bz_removeObjectForKey:" sysClassString:@"NSMutableDictionary" toCustMethod:@"removeObjectForKey:" targetClassString:@"__NSDictionaryM"];
        [self swizzlingSysMethod:@"bz_setObject:forKey:" sysClassString:@"NSMutableDictionary" toCustMethod:@"setObject:forKey:" targetClassString:@"__NSDictionaryM"];
    });
    
}

#endif

- (void)bz_removeObjectForKey:(id)key {
    if (!key) {
        return;
    }
    [self bz_removeObjectForKey:key];
}

- (void)bz_setObject:(id)obj forKey:(id <NSCopying>)key {
    if (!obj) {
        return;
    }
    if (!key) {
        return;
    }
    [self bz_setObject:obj forKey:key];
}

@end
