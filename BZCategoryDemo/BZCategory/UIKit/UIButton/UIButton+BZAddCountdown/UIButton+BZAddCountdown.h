//
//  UIButton+BZAddCountdown.h
//  BZCategoryDemo
//
//  Created by Eric on 2018/9/7.
//  Copyright © 2018年 Eric. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 倒计时剩余时间回调

 @param timeLeft 剩余时间
 @param btn 按钮
 */
typedef void(^BZAddCountdownCallBack)(NSInteger timeLeft, UIButton *btn);

@interface UIButton (BZAddCountdown)

/**
 按钮添加倒计时

 @param countdownTime 倒计时时间
 @param callBack 回调
 */
- (void)bz_addCountdownTime:(NSInteger)countdownTime callBack:(BZAddCountdownCallBack)callBack;

@end
