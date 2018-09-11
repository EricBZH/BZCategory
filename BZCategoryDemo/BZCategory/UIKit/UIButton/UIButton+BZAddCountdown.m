//
//  UIButton+BZAddCountdown.m
//  BZCategoryDemo
//
//  Created by Eric on 2018/9/7.
//  Copyright © 2018年 Eric. All rights reserved.
//

#import "UIButton+BZAddCountdown.h"

#define NormalTitle @"please enter verfycode"
#define WatingTitle @"time left"

@implementation UIButton (BZAddCountdown)

/**
 按钮添加倒计时
 
 @param countdownTime 倒计时时间
 @param callBack 回调
 */
- (void)bz_addCountdownTime:(NSInteger)countdownTime callBack:(BZAddCountdownCallBack)callBack
{
    __block NSInteger timeOut = countdownTime; //倒计时时间
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    dispatch_source_set_timer(_timer, dispatch_walltime(NULL, 0), 1.0 * NSEC_PER_SEC, 0); //每秒执行
    
    dispatch_source_set_event_handler(_timer, ^{
        if (timeOut <= 0) { //倒计时结束，关闭
            dispatch_source_cancel(_timer);
            
            [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                if (callBack) {
                    callBack(timeOut,self);
                }else{
                    [self updateTitle:NormalTitle];
                }
                
                self.enabled = YES;
            }];
        } else {
            [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                if (callBack) {
                    callBack(timeOut,self);
                }else{
                    NSString *countTitle = [NSString stringWithFormat:@"%@%ld",WatingTitle,(long)timeOut];
                    [self updateTitle:countTitle];
                }
                
                self.enabled = NO;
            }];
            
            timeOut--;
        }
    });
    
    dispatch_resume(_timer);
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
