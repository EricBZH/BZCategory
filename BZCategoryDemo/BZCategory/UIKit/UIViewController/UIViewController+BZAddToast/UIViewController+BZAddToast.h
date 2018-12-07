//
//  UIViewController+BZAddToast.h
//  XLinkCommonProject
//
//  Created by Eric on 2018/9/7.
//  Copyright © 2018年 Eric. All rights reserved.
//

/**
 *  控制器分类，负责toast
 *
 *  @author BZH
 */

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/**
 toast消失回调
 */
typedef void(^UIViewControllerToastFinishBlock)(void);

@interface UIViewController (BZAddToast)

/**
 底部弹出提示框，自动消失，默认2秒

 @param message 消息文本
 */
- (void)toastWithMessage:(NSString *)message;

/**
 底部弹出提示框，自动消失
 
 @param message 消息文本
 @param afterDelay 延时时间
 */
- (void)toastWithMessage:(NSString *)message
              afterDelay:(NSTimeInterval)afterDelay;

/**
 底部弹出提示框，自动消失，默认2秒
 
 @param message 消息文本
 @param callBack 消失回调
 */
- (void)toastWithMessage:(NSString *)message
                callBack:(UIViewControllerToastFinishBlock _Nullable)callBack;

/**
 底部弹出提示框，自动消失
 
 @param message 消息文本
 @param afterDelay 延时时间
 @param callBack 消失回调
 */
- (void)toastWithMessage:(NSString *)message
              afterDelay:(NSTimeInterval)afterDelay
                callBack:(UIViewControllerToastFinishBlock _Nullable)callBack;

@end

NS_ASSUME_NONNULL_END
