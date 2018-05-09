//
//  NSUserDefaults+BZAdd.m
//  BZInheritDemo
//
//  Created by Eric on 2018/5/9.
//  Copyright © 2018年 Eric. All rights reserved.
//

#import "NSUserDefaults+BZAdd.h"
#import "NSData+BZAdd.h"
#import <objc/runtime.h>

@implementation NSUserDefaults (BZAdd)

+ (void)load {
    // 通过class_getInstanceMethod()函数从当前对象中的method list获取method结构体，如果是类方法就使用class_getClassMethod()函数获取。
    Method fromMethod1 = class_getInstanceMethod([self class], @selector(setObject:forKey:));
    Method toMethod1 = class_getInstanceMethod([self class], @selector(bz_SetCustomObject:forKey:));
    /**
     *  我们在这里使用class_addMethod()函数对Method Swizzling做了一层验证，如果self没有实现被交换的方法，会导致失败。
     *  而且self没有交换的方法实现，但是父类有这个方法，这样就会调用父类的方法，结果就不是我们想要的结果了。
     *  所以我们在这里通过class_addMethod()的验证，如果self实现了这个方法，class_addMethod()函数将会返回NO，我们就可以对其进行交换了。
     */
    if (!class_addMethod([self class], @selector(bz_SetCustomObject:forKey:), method_getImplementation(toMethod1), method_getTypeEncoding(toMethod1))) {
        method_exchangeImplementations(fromMethod1, toMethod1);
    }

    // 通过class_getInstanceMethod()函数从当前对象中的method list获取method结构体，如果是类方法就使用class_getClassMethod()函数获取。
    Method fromMethod2 = class_getInstanceMethod([self class], @selector(objectForKey:));
    Method toMethod2 = class_getInstanceMethod([self class], @selector(bz_ObjectForKey:));
    /**
     *  我们在这里使用class_addMethod()函数对Method Swizzling做了一层验证，如果self没有实现被交换的方法，会导致失败。
     *  而且self没有交换的方法实现，但是父类有这个方法，这样就会调用父类的方法，结果就不是我们想要的结果了。
     *  所以我们在这里通过class_addMethod()的验证，如果self实现了这个方法，class_addMethod()函数将会返回NO，我们就可以对其进行交换了。
     */
    if (!class_addMethod([self class], @selector(bz_SetCustomObject:forKey:), method_getImplementation(toMethod2), method_getTypeEncoding(toMethod2))) {
        method_exchangeImplementations(fromMethod2, toMethod2);
    }
}

// 我们自己实现的方法，也就是和self的viewDidLoad方法进行交换的方法。
- (void)bz_SetCustomObject:(id)value forKey:(NSString *)defaultName
{
    //NSUserdefault可以存储的数据类型
    NSSet *userdefaultClasses = [NSSet setWithObjects:
    [NSData class],
    [NSDate class],
    [NSNumber class],
    [NSError class],
    [NSArray class],
    [NSDictionary class],
    [NSString class],
    [NSAttributedString class],
    [NSClassFromString(@"_NSInlineData") class],nil];
    
    Class c = [value class];
    BOOL isFoundationObject = [userdefaultClasses containsObject:c];
    
    if (isFoundationObject == NO) {
        NSData *customobjectData = [NSKeyedArchiver archivedDataWithRootObject:value];
        customobjectData.isCustomObject = @"YES";
        value = customobjectData;
    }
    [self bz_SetCustomObject:value forKey:defaultName];
    
}

- (id)bz_ObjectForKey:(NSString *)defaultName
{
    id object = [self bz_ObjectForKey:defaultName];
    
    if ([defaultName isEqualToString:@"key"] == YES) {
        
    }
    BOOL b1 = [object isKindOfClass:[NSData class]];
    NSData *tempData = (NSData*)object;
    if (b1 == YES) {
        BOOL b2 = [tempData.isCustomObject isEqualToString:@"YES"];
        if (b2 == YES) {
            object = [NSKeyedUnarchiver unarchiveObjectWithData:object];
        }
    }
    
    return object;
}

@end
