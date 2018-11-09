//
//  UIButton+BZAddCountdown.m
//  BZCategoryDemo
//
//  Created by Eric on 2018/9/7.
//  Copyright © 2018年 Eric. All rights reserved.
//

#import "UIButton+BZAddCountdown.h"
#import "NSTimer+BZAdd.h"

@implementation UIButton (BZAddCountdown)

/**
 按钮添加倒计时
 
 @param countdownTime 倒计时时间
 @param callBack 回调
 */
- (void)bz_addCountdownTime:(NSInteger)countdownTime callBack:(BZAddCountdownCallBack)callBack
{
    [NSTimer bz_scheduledTimerWithTimeInterval:1 timeOut:countdownTime userInfo:nil callBack:^(NSTimer * _Nonnull timer, NSUInteger timeLeft) {
        if (timeLeft > 0) {
            self.enabled = NO;
        }else{
            self.enabled = YES;
        }
        
        if (callBack) {
            callBack(timeLeft,self);
        }
    }];
}

@end
