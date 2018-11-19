//
//  NSString+BZAdd.m
//  BZCategoryDemo
//
//  Created by Eric on 2018/11/19.
//  Copyright © 2018 Eric. All rights reserved.
//

#import "NSString+BZAdd.h"
#import "YYCategories.h"

@implementation NSString (BZAdd)

/**
 添加占位字符串
 
 @param placeholder 占位字符串
 @return 如果字符串为空，则返回占位字符串
 */
- (NSString *)bz_placeholder:(NSString *)placeholder
{
    if ([self isNotBlank] == NO) {
        return placeholder;
    }else {
        return self;
    }
}

@end
