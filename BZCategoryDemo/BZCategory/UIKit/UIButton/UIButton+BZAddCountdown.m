//
//  UIButton+BZAddCountdown.m
//  BZCategoryDemo
//
//  Created by Eric on 2018/9/7.
//  Copyright © 2018年 Eric. All rights reserved.
//

#import "UIButton+BZAddCountdown.h"

@implementation UIButton (BZAddCountdown)

/**
 按钮添加倒计时
 
 @param countdownTime 倒计时时间
 @param normalTitle 正常状态显示文本
 @param waitTittle 等待倒计时结束显示文本
 */
- (void)bz_addCountdownTime:(NSInteger)countdownTime andNormalTitle:(NSString *)normalTitle andWaitTittle:(NSString *)waitTittle
{
    __block NSInteger timeOut = countdownTime; //倒计时时间
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    dispatch_source_set_timer(_timer, dispatch_walltime(NULL, 0), 1.0 * NSEC_PER_SEC, 0); //每秒执行
    
    dispatch_source_set_event_handler(_timer, ^{
        if (timeOut <= 0) { //倒计时结束，关闭
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示 根据自己需求设置
                [self updateTitle:normalTitle];
                self.enabled = YES;
            });
        } else {
            NSInteger seconds = timeOut;
            NSString *strTime = [NSString stringWithFormat:@"%ld", (long)seconds];
            NSString *titleString = [NSString stringWithFormat:@"%@%@", strTime, waitTittle];
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示 根据自己需求设置
                [self updateTitle:titleString];
                self.enabled = NO;
            });
            timeOut--;
        }
    });
    
}

/**
 设置按钮title
 */
- (void)updateTitle:(NSString *)title
{
    self.titleLabel.text = title;
    [self setTitle:title forState:UIControlStateNormal];
}

@end
