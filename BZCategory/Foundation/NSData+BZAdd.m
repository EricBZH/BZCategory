//
//  NSData+BZAdd.m
//  BZInheritDemo
//
//  Created by Eric on 2018/5/9.
//  Copyright © 2018年 Eric. All rights reserved.
//

#import "NSData+BZAdd.h"
#import <objc/runtime.h>

@implementation NSData (BZAdd)


- (void)setIsCustomObject:(BOOL)isCustomObject
{
    NSNumber *isCustomObj = [NSNumber numberWithBool:isCustomObject];
    objc_setAssociatedObject(self, @selector(isCustomObject), isCustomObj, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)isCustomObject
{
    NSNumber *isCustomObj = objc_getAssociatedObject(self, @selector(isCustomObject));
    return [isCustomObj boolValue];
}

@end
