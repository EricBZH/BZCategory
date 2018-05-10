//
//  NSUserDefaults+BZAdd.h
//  BZInheritDemo
//
//  Created by Eric on 2018/5/9.
//  Copyright © 2018年 Eric. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSUserDefaults (BZAdd)
/**
 *注意：
 *使用以下方法的自定义对象，必须实现decode和encode方法，否则会导致崩溃。
 *具体实现方法可以参考BZModel.m，或直接继承BZModel。
 */

/**
 存自定义对象到Userdefault

 @param value 自定义对象
 @param defaultName key
 */
- (void)bz_SetCustomObject:(id)value forKey:(NSString *)defaultName;

/**
 获取自定义对象

 @param defaultName key
 @return 自定义对象
 */
- (id)bz_ObjectForKey:(NSString *)defaultName;

@end
