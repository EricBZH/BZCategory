//
//  UIButton+BZAddCountdown.h
//  BZCategoryDemo
//
//  Created by Eric on 2018/9/7.
//  Copyright © 2018年 Eric. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (BZAddCountdown)

/**
 按钮添加倒计时

 @param countdownTime 倒计时时间
 @param normalTitle 正常状态显示文本
 @param waitTittle 等待倒计时结束显示文本
 */
- (void)bz_addCountdownTime:(NSInteger)countdownTime andNormalTitle:(NSString *)normalTitle andWaitTittle:(NSString *)waitTittle;

@end
