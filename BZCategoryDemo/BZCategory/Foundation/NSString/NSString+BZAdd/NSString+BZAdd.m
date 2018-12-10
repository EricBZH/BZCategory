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
 
 @param orignString 源字符串
 @param placeholder 占位字符串
 @return 如果源字符串为空，则返回占位字符串
 */
+ (NSString *)bz_orignString:(NSString * _Nullable)orignString
                 placeholder:(NSString *)placeholder
{
    if ([orignString isNotBlank] == NO) {
        return placeholder;
    }
    
    return orignString;
}

@end
