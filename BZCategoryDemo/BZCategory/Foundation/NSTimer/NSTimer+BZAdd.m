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

///回调
@property (copy,   nonatomic) ScheduledTimerBlock scheduledTimerBlock;
///超时时间
@property (assign, nonatomic) NSUInteger timeOut;
///剩余时间
@property (assign, nonatomic) NSUInteger timeLeft;

@end

@implementation NSTimer (BZAdd)

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

/**
 初始化定时器，自动执行
 
 @param ti 时间间隔
 @param timeOut 超时时间
 @param userInfo 附带信息
 @param callBack 回调
 @return 定时器
 */
+ (instancetype)bz_scheduledTimerWithTimeInterval:(NSTimeInterval)ti timeOut:(NSUInteger)timeOut userInfo:(_Nullable id)userInfo callBack:(ScheduledTimerBlock)callBack
{
    NSTimer *timer = [NSTimer timerWithTimeInterval:ti target:self selector:@selector(blcokInvoke:) userInfo:userInfo repeats:YES];
    
    timer.scheduledTimerBlock = callBack;
    timer.timeOut = timeOut;
    timer.timeLeft = timeOut;
    
    [[NSRunLoop mainRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
    
    return timer;
}

+ (void)blcokInvoke:(NSTimer *)timer {
    
    NSInteger timeLeft = timer.timeLeft - timer.timeInterval;
    if (timeLeft > 0) {
        timer.timeLeft = timeLeft;
    }else{
        timer.timeLeft = 0;
        [timer invalidate];
    }
    
    if (timer.scheduledTimerBlock) {
        timer.scheduledTimerBlock(timer,timer.timeLeft);
    }
}

@end
