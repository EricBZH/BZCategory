//
//  NSString+BZAddRegex.h
//  BZCategoryDemo
//
//  Created by Eric on 2018/6/26.
//  Copyright © 2018年 Eric. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (BZAddRegex)

#pragma mark - 判断类

/**
 邮箱验证
 */
- (BOOL)isValidEmail;

/**
 手机号验证
 */
- (BOOL)isValidPhoneNum;

/**
 车牌号验证
 */
- (BOOL)isValidCarNo;

/**
 网址验证
 */
- (BOOL)isValidUrl;

/**
 邮政编码验证
 */
- (BOOL)isValidPostalcode;

/**
 纯汉字验证
 */
- (BOOL)isValidChinese;

/**
 IP格式验证，xxx.xxx.xxx.xxx
 */
- (BOOL)isValidIP;

/**
 身份证验证
 */
- (BOOL)isValidIdCardNum;

/**
 工商税号验证
 */
- (BOOL)isValidTaxNo;

/**
 @brief     是否符合最小长度、最长长度，是否包含中文,首字母是否可以为数字
 @param     minLenth 账号最小长度
 @param     maxLenth 账号最大长度
 @param     containChinese 判断是否允许包含中文 默认NO 不判断
 @param     firstCannotBeDigtal 判断首字母不能为数字 默认NO 不判断
 @return    验证成功返回YES, 否则返回NO
 */
- (BOOL)isValidWithMinLenth:(NSInteger)minLenth
                   maxLenth:(NSInteger)maxLenth
             containChinese:(BOOL)containChinese
        firstCannotBeDigtal:(BOOL)firstCannotBeDigtal;

/**
 @brief     是否符合最小长度、最长长度，是否包含中文,数字，字母，其他字符，首字母是否可以为数字
 @param     minLenth 账号最小长度
 @param     maxLenth 账号最长长度
 @param     containChinese 判断是否允许包含中文 默认NO 不判断
 @param     containDigtal 判断是否包含数字 默认NO 不判断
 @param     containLetter 判断是否包含字母 默认NO 不判断
 @param     containOtherCharacter 判断是否包含其他字符
 @param     firstCannotBeDigtal 判断首字母不能为数字 默认NO 不判断
 @return    正则验证成功返回YES, 否则返回NO
 */
- (BOOL)isValidWithMinLenth:(NSInteger)minLenth
                   maxLenth:(NSInteger)maxLenth
             containChinese:(BOOL)containChinese
              containDigtal:(BOOL)containDigtal
              containLetter:(BOOL)containLetter
      containOtherCharacter:(NSString *)containOtherCharacter
        firstCannotBeDigtal:(BOOL)firstCannotBeDigtal;

#pragma mark - 替换类

/**
 去掉两端空格和换行符
 */
- (NSString *)stringByTrimmingBlank;

/**
 去掉html格式
 */
- (NSString *)removeHtmlFormat;

@end
