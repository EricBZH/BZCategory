//
//  NSDictionary+BZAddSafe.m
//  BZCategoryDemo
//
//  Created by Eric on 2018/5/17.
//  Copyright © 2018年 Eric. All rights reserved.
//

#import "NSDictionary+BZAddSafe.h"
#import <objc/runtime.h>
#import "NSObject+BZAddImpChange.h"

@implementation NSDictionary (BZAddSafe)

#ifdef DEBUG

#else

+ (void)load{
    
    [self bz_swizzlingSysMethod:@"initWithObjects:forKeys:count:" sysClassString:@"__NSPlaceholderDictionary" toCustMethod:@"initWithObjects_bz:forKeys:count:" targetClassString:@"NSDictionary"];
    
}

#endif

- (instancetype)initWithObjects_bz:(id *)objects forKeys:(id<NSCopying> *)keys count:(NSUInteger)count {
    NSUInteger rightCount = 0;
    for (NSUInteger i = 0; i < count; i++) {
        if (!(keys[i] && objects[i])) {
            break;
        }else{
            rightCount++;
        }
    }
    self = [self initWithObjects_bz:objects forKeys:keys count:rightCount];
    return self;
}

@end
