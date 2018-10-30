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
 定时器回调Block
 
 @param timer 定时器
 @param timeLeft 剩余时间
 */
typedef void(^ScheduledTimerBlock)(NSTimer *timer, NSUInteger timeLeft);

@interface NSTimer (BZAdd)

/**
 初始化定时器，自动执行

 @param ti 时间间隔
 @param timeOut 超时时间
 @param userInfo 附带信息
 @param callBack 回调
 @return 定时器
 */
+ (instancetype)bz_scheduledTimerWithTimeInterval:(NSTimeInterval)ti
                                          timeOut:(NSUInteger)timeOut
                                         userInfo:(_Nullable id)userInfo
                                         callBack:(ScheduledTimerBlock)callBack;
@end

NS_ASSUME_NONNULL_END
