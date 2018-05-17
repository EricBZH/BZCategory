//
//  NSUserDefaults+BZAdd.m
//  BZInheritDemo
//
//  Created by Eric on 2018/5/9.
//  Copyright © 2018年 Eric. All rights reserved.
//

#import "NSUserDefaults+BZAdd.h"
#import <objc/runtime.h>

@implementation NSUserDefaults (BZAdd)

- (void)bz_SetCustomObject:(id)value forKey:(NSString *)defaultName
{
    NSData *customObjectData = [NSKeyedArchiver archivedDataWithRootObject:value];

    [self setObject:customObjectData forKey:defaultName];
}

- (id)bz_ObjectForKey:(NSString *)defaultName
{
    NSData *customObjectData = [self objectForKey:defaultName];

    id object = [NSKeyedUnarchiver unarchiveObjectWithData:customObjectData];
    
    return object;
}

@end
