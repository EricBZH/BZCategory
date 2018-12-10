//
//  UITextField+BZAdd.h
//  testPronjec
//
//  Created by Eric on 2018/8/17.
//  Copyright © 2018年 Eric. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 按钮点击回调

 @param btn 点击的按钮
 */
typedef void(^UITextFieldBZAddCallBack)(UIButton *btn);

@interface UITextField (BZAdd)

#pragma mark - TextField LeftView Add

/**
 给TextField光标添加左边距

 @param panding 边距
 */
- (void)bz_addLeftPanding:(CGFloat)panding;

#pragma mark - TextField RightView Add

#pragma mark - 给TextField右视图添加按钮

#pragma mark - Selector

/**
 给TextField右视图添加按钮

 @param btn 按钮
 @param selector 点击触发方法(默认响应UIControlEventTouchUpInside)
 @param target 响应者
 */
- (void)bz_addRightViewWithButton:(UIButton *)btn andSelector:(SEL)selector andTarget:(id)target;

/**
 给TextField右视图添加按钮

 @param btn 按钮
 @param zoom 按钮图片缩放比例 0~1
 @param selector 点击触发方法(默认响应UIControlEventTouchUpInside)
 @param target 响应者
 */
- (void)bz_addRightViewWithButton:(UIButton *)btn andZoom:(CGFloat)zoom andSelector:(SEL)selector andTarget:(id)target;

/**
 给TextField右视图添加按钮，按钮图片使用传入图片名称

 @param imageName 图片名称
 @param selector 点击触发方法(默认响应UIControlEventTouchUpInside)
 @param target 响应者
 */
- (void)bz_addRightViewWithImageName:(NSString *)imageName andSelector:(SEL)selector andTarget:(id)target;

/**
 给TextField右视图添加按钮，按钮图片使用传入图片名称

 @param imageName 图片名称
 @param zoom 按钮图片缩放比例 0~1
 @param selector 点击触发方法(默认响应UIControlEventTouchUpInside)
 @param target 响应者
 */
- (void)bz_addRightViewWithImageName:(NSString *)imageName andZoom:(CGFloat)zoom andSelector:(SEL)selector andTarget:(id)target;

/**
 给TextField右视图添加按钮

 @param normalImageName 正常状态图片名称
 @param selectedImageName 选中状态图片名称
 @param selector 点击触发方法(默认响应UIControlEventTouchUpInside)
 @param target 响应者
 */
- (void)bz_addRightViewWithNormalImageName:(NSString *)normalImageName andSelectedImageName:(NSString *)selectedImageName andSelector:(SEL)selector andTarget:(id)target;

/**
 给TextField右视图添加按钮

 @param normalImageName 正常状态图片名称
 @param selectedImageName 选中状态图片名称
 @param zoom 按钮图片缩放比例 0~1
 @param selector 点击触发方法(默认响应UIControlEventTouchUpInside)
 @param target 响应者
 */
- (void)bz_addRightViewWithNormalImageName:(NSString *)normalImageName andSelectedImageName:(NSString *)selectedImageName andZoom:(CGFloat)zoom andSelector:(SEL)selector andTarget:(id)target;

#pragma mark - Block

/**
 给TextField右视图添加按钮

 @param btn 按钮
 @param callBack 按钮点击回调
 */
- (void)bz_addRightViewWithButton:(UIButton *)btn callBack:(UITextFieldBZAddCallBack)callBack;

/**
 给TextField右视图添加按钮

 @param btn 按钮
 @param zoom 按钮图片缩放比例 0~1
 @param callBack 按钮点击回调
 */
- (void)bz_addRightViewWithButton:(UIButton *)btn andZoom:(CGFloat)zoom callBack:(UITextFieldBZAddCallBack)callBack;

/**
 给TextField右视图添加按钮，按钮图片使用传入图片名称

 @param imageName 图片名称
 @param callBack 按钮点击回调
 */
- (void)bz_addRightViewWithImageName:(NSString *)imageName callBack:(UITextFieldBZAddCallBack)callBack;

/**
 给TextField右视图添加按钮，按钮图片使用传入图片名称

 @param imageName 图片名称
 @param zoom 按钮图片缩放比例 0~1
 @param callBack 按钮点击回调
 */
- (void)bz_addRightViewWithImageName:(NSString *)imageName andZoom:(CGFloat)zoom callBack:(UITextFieldBZAddCallBack)callBack;

/**
 给TextField右视图添加按钮

 @param normalImageName 正常状态图片名称
 @param selectedImageName 选中状态图片名称
 @param callBack 按钮点击回调
 */
- (void)bz_addRightViewWithNormalImageName:(NSString *)normalImageName andSelectedImageName:(NSString *)selectedImageName callBack:(UITextFieldBZAddCallBack)callBack;

/**
 给TextField右视图添加按钮

 @param normalImageName 正常状态图片名称
 @param selectedImageName 选中状态图片名称
 @param zoom 按钮图片缩放比例 0~1
 @param callBack 按钮点击回调
 */
- (void)bz_addRightViewWithNormalImageName:(NSString *)normalImageName andSelectedImageName:(NSString *)selectedImageName andZoom:(CGFloat)zoom callBack:(UITextFieldBZAddCallBack)callBack;

@end