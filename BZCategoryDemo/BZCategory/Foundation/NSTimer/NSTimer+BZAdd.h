//
//  NSTimer+BZAdd.h
//  XLinkCommonProject
//
//  Created by Eric on 2018/10/30.
//  Copyright © 2018 Eric. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/**
 定时器倒计时回调Block
 
 @param timer 定时器
 @param timeLeft 剩余时间
 */
typedef void(^ScheduledTimerCountDownBlock)(NSTimer *timer, NSUInteger timeLeft);

/**
 定时器倒回调Block

 @param timer 定时器
 */
typedef void(^ScheduledTimerBlock)(NSTimer *timer);

@interface NSTimer (BZAdd)

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
                                         callBack:(ScheduledTimerBlock)callBack;

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
                                         callBack:(ScheduledTimerCountDownBlock)callBack;

@end

NS_ASSUME_NONNULL_END
