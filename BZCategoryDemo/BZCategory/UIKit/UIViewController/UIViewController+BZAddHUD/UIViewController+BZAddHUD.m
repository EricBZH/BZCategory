//
//  UIViewController+BZAddHUD.m
//  XLinkCommonProject
//
//  Created by Eric on 2018/12/6.
//  Copyright © 2018 Eric. All rights reserved.
//

#import "UIViewController+BZAddHUD.h"
#import <objc/runtime.h>
#import "MBProgressHUD.h"

@interface UIViewController ()

///hud
@property (strong, nonatomic) MBProgressHUD *hud;

@end

@implementation UIViewController (BZAddHUD)

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
 弹出菊花，不自动消失
 */
- (void)bz_showHUD
{
    [self bz_showHUDWithMessage:nil];
}

/**
 弹出带文本菊花，不自动消失
 
 @param message 消息文本
 */
- (void)bz_showHUDWithMessage:(NSString * _Nullable)message
{
    if ([NSThread currentThread].isMainThread) {
        [self configureShowHUDWithMessage:message];
    }else{
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            [self configureShowHUDWithMessage:message];
        }];
    }
}

/**
 隐藏菊花
 */
- (void)bz_hideHud
{
    if ([NSThread currentThread].isMainThread) {
        [self configureHideHud];
    }else{
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            [self configureHideHud];
        }];
    }
}

#pragma mark - Configure

- (void)configureShowHUDWithMessage:(NSString *)message
{
    UIView *view = nil;
    
    if (self.navigationController.view != nil) {
        view = self.navigationController.view;
    }else{
        view = self.view;
    }
    
    self.hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    self.hud.label.text = message;
}

- (void)configureHideHud
{
    [self.hud hideAnimated:YES];
}

@end
