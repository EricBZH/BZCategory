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

- (void)setIsCustomObject:(NSString*)isCustomObject
{
//    NSNumber *isCustomObj = [NSNumber numberWithBool:isCustomObject];
    return objc_setAssociatedObject(self, @selector(isCustomObject), isCustomObject, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (NSString *)isCustomObject
{
//    NSNumber *isCustomObj = objc_getAssociatedObject(self, _cmd);
    NSString *is = objc_getAssociatedObject(self, _cmd);//[isCustomObj boolValue];
    return is;
}

@end
