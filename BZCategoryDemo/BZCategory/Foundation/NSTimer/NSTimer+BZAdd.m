//
//  NSTimer+BZAdd.m
//  XLinkCommonProject
//
//  Created by Eric on 2018/10/30.
//  Copyright © 2018 Eric. All rights reserved.
//

#import "NSTimer+BZAdd.h"
#import <objc/runtime.h>

@interface BZAdd

///倒计时回调
@property (copy,   nonatomic) ScheduledTimerCountDownBlock scheduledTimerCountDownBlock;
///回调
@property (copy,   nonatomic) ScheduledTimerBlock scheduledTimerBlock;
///超时时间
@property (assign, nonatomic) NSUInteger timeOut;
///剩余时间
@property (assign, nonatomic) NSUInteger timeLeft;

@end

@implementation NSTimer (BZAdd)

#pragma mark - OverWrite

- (ScheduledTimerCountDownBlock)scheduledTimerCountDownBlock
{
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setScheduledTimerCountDownBlock:(ScheduledTimerCountDownBlock)scheduledTimerCountDownBlock
{
    objc_setAssociatedObject(self, @selector(scheduledTimerCountDownBlock), scheduledTimerCountDownBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (ScheduledTimerBlock)scheduledTimerBlock
{
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setScheduledTimerBlock:(ScheduledTimerBlock)scheduledTimerBlock
{
    objc_setAssociatedObject(self, @selector(scheduledTimerBlock), scheduledTimerBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (NSUInteger)timeOut
{
    NSNumber *value = objc_getAssociatedObject(self, _cmd);
    return [value integerValue];
}

- (void)setTimeOut:(NSUInteger)timeOut
{
    objc_setAssociatedObject(self, @selector(timeOut), @(timeOut), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSUInteger)timeLeft
{
    NSNumber *value = objc_getAssociatedObject(self, _cmd);
    return [value integerValue];
}

- (void)setTimeLeft:(NSUInteger)timeLeft
{
    objc_setAssociatedObject(self, @selector(timeLeft), @(timeLeft), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

#pragma mark - Method

/**
 初始化定时器，自动执行
 
 @param ti 时间间隔
 @param repeats 是否重复
 @param userInfo 附带信息
 @param callBack 回调
 @return 定时器
 */
+ (instancetype)bz_scheduledTimerWithTimeInterval:(NSTimeInterval)ti
                                          repeats:(BOOL)repeats
                                         userInfo:(_Nullable id)userInfo
                                         callBack:(ScheduledTimerBlock)callBack
{
    NSTimer *timer = [NSTimer timerWithTimeInterval:ti target:self selector:@selector(blcokInvoke:) userInfo:userInfo repeats:repeats];
    
    timer.scheduledTimerBlock = callBack;
    
    [[NSRunLoop mainRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
    
    return timer;
}

/**
 初始化倒计时定时器，自动执行
 
 @param ti 时间间隔
 @param timeOut 超时时间
 @param userInfo 附带信息
 @param callBack 回调
 @return 定时器
 */
+ (instancetype)bz_scheduledTimerWithTimeInterval:(NSTimeInterval)ti
                                          timeOut:(NSUInteger)timeOut
                                         userInfo:(_Nullable id)userInfo
                                         callBack:(ScheduledTimerCountDownBlock)callBack
{
    NSTimer *timer = [NSTimer timerWithTimeInterval:ti target:self selector:@selector(blcokInvokeCountDown:) userInfo:userInfo repeats:YES];
    
    timer.scheduledTimerCountDownBlock = callBack;
    timer.timeOut = timeOut;
    timer.timeLeft = timeOut;
    
    [[NSRunLoop mainRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
    
    return timer;
}

#pragma mark - Action

+ (void)blcokInvoke:(NSTimer *)timer {
    if (timer.scheduledTimerBlock) {
        timer.scheduledTimerBlock(timer);
    }
}

+ (void)blcokInvokeCountDown:(NSTimer *)timer {
    
    NSInteger timeLeft = timer.timeLeft - timer.timeInterval;
    if (timeLeft > 0) {
        timer.timeLeft = timeLeft;
    }else{
        timer.timeLeft = 0;
        [timer invalidate];
    }
    
    if (timer.scheduledTimerCountDownBlock) {
        timer.scheduledTimerCountDownBlock(timer,timer.timeLeft);
    }
}

@end
