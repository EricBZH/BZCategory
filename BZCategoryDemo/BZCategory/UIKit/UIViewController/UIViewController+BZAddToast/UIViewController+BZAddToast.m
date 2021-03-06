//
//  UIViewController+BZAddToast.m
//  XLinkCommonProject
//
//  Created by Eric on 2018/9/7.
//  Copyright © 2018年 Eric. All rights reserved.
//

#import "UIViewController+BZAddToast.h"
#import <objc/runtime.h>

#define HideHudAfterDelay 2

@implementation UIViewController (BZAddToast)

- (MBProgressHUD *)hud
{
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setHud:(MBProgressHUD *)hud
{
    objc_setAssociatedObject(self, @selector(hud), hud, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

#pragma mark - Method

/**
 底部弹出提示框，自动消失
 
 @param message 消息文本
 */
- (void)bz_toastWithMessage:(NSString *)message
{
    [self bz_toastWithMessage:message callBack:nil];
}

/**
 底部弹出提示框，自动消失
 
 @param message 消息文本
 @param afterDelay 延时时间
 */
- (void)bz_toastWithMessage:(NSString *)message
              afterDelay:(NSTimeInterval)afterDelay
{
    [self bz_toastWithMessage:message afterDelay:afterDelay callBack:nil];
}

/**
 底部弹出提示框，自动消失
 
 @param message 消息文本
 @param callBack 消失回调
 */
- (void)bz_toastWithMessage:(NSString *)message
                callBack:(UIViewControllerToastFinishBlock _Nullable)callBack
{
    [self bz_toastWithMessage:message afterDelay:HideHudAfterDelay callBack:callBack];
}

/**
 底部弹出提示框，自动消失
 
 @param message 消息文本
 @param afterDelay 延时时间
 @param callBack 消失回调
 */
- (void)bz_toastWithMessage:(NSString *)message
              afterDelay:(NSTimeInterval)afterDelay
                callBack:(UIViewControllerToastFinishBlock _Nullable)callBack
{
    if ([NSThread currentThread].isMainThread) {
        [self configureToastWithMessage:message afterDelay:afterDelay callBack:callBack];
    }else{
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            [self configureToastWithMessage:message afterDelay:afterDelay callBack:callBack];
        }];
    }
}

#pragma mark - Configure

- (void)configureToastWithMessage:(NSString *)message
                       afterDelay:(NSTimeInterval)afterDelay
                         callBack:(UIViewControllerToastFinishBlock)callBack
{
    UIView *view = nil;
    
    if (self.navigationController.view != nil) {
        view = self.navigationController.view;
    }else{
        view = self.view;
    }
    
    self.hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    
    self.hud.mode = MBProgressHUDModeText;
    self.hud.label.text = message;
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(afterDelay * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.hud hideAnimated:YES];
        
        if (callBack) {
            callBack();
        }
    });
    
}

@end
