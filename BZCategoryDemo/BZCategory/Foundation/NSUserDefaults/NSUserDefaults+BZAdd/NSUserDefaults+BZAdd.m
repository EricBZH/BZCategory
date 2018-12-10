//
//  NSUserDefaults+BZAdd.m
//  BZInheritDemo
//
//  Created by Eric on 2018/5/9.
//  Copyright © 2018年 Eric. All rights reserved.
//

#import "NSUserDefaults+BZAdd.h"

@implementation NSUserDefaults (BZAdd)

/**
 存自定义对象到Userdefault
 
 @param value 自定义对象
 @param defaultName key
 */
- (void)bz_setObject:(id<NSCoding>)value forKey:(NSString *)defaultName
{
    NSData *customObjectData = [NSKeyedArchiver archivedDataWithRootObject:value];

    [self setObject:customObjectData forKey:defaultName];
}

/**
 获取自定义对象
 
 @param defaultName key
 @return 自定义对象
 */
- (id)bz_objectForKey:(NSString *)defaultName
{
    NSData *customObjectData = [self objectForKey:defaultName];

    id object = [NSKeyedUnarchiver unarchiveObjectWithData:customObjectData];
    
    return object;
}

@end
