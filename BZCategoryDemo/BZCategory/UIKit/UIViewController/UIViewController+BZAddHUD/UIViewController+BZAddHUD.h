//
//  UIViewController+BZAddHUD.h
//  XLinkCommonProject
//
//  Created by Eric on 2018/12/6.
//  Copyright © 2018 Eric. All rights reserved.
//

/**
 *  控制器分类，负责HUD
 *
 *  @author BZH
 */

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (BZAddHUD)

/**
 弹出菊花，不自动消失
 */
- (void)bz_showHUD;

/**
 弹出带文本菊花，不自动消失
 
 @param message 消息文本
 */
- (void)bz_showHUDWithMessage:(NSString * _Nullable)message;

/**
 隐藏菊花
 */
- (void)bz_hideHud;

@end

NS_ASSUME_NONNULL_END
