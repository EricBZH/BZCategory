//
//  UITextField+BZAdd.m
//  testPronjec
//
//  Created by Eric on 2018/8/17.
//  Copyright © 2018年 Eric. All rights reserved.
//

#import "UITextField+BZAdd.h"
#import <objc/runtime.h>

#define DefaultZoom 1.0f

@interface BZAdd

@property (copy,   nonatomic) UITextFieldBZAddCallBack callBack;

@end

@implementation UITextField (BZAdd)

#pragma mark - 给TextField添加左边距

/**
 给TextField光标添加左边距
 
 @param panding 边距
 */
- (void)bz_addLeftPanding:(CGFloat)panding
{
    UIView *pandingView = [[UIView alloc] init];
    pandingView.frame = CGRectMake(0, 0, panding, self.frame.size.height);
    
    self.leftView = pandingView;
    
    self.leftViewMode = UITextFieldViewModeAlways;
}

#pragma mark - 给TextField右视图添加按钮

#pragma mark - Selector

/**
 给TextField右视图添加按钮
 
 @param btn 按钮
 @param selector 点击触发方法(默认响应UIControlEventTouchUpInside)
 @param target 响应者
 */
- (void)bz_addRightViewWithButton:(UIButton *)btn andSelector:(SEL)selector andTarget:(id)target
{
    [self addRightViewWithButton:btn andZoom:DefaultZoom];
    
    [btn addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
}

/**
 给TextField右视图添加按钮
 
 @param btn 按钮
 @param zoom 按钮图片缩放比例 0~1
 @param selector 点击触发方法(默认响应UIControlEventTouchUpInside)
 @param target 响应者
 */
- (void)bz_addRightViewWithButton:(UIButton *)btn andZoom:(CGFloat)zoom andSelector:(SEL)selector andTarget:(id)target
{
    [self addRightViewWithButton:btn andZoom:zoom];
    
    [btn addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
}

/**
 给TextField右视图添加按钮，按钮图片使用传入图片名称
 
 @param imageName 图片名称
 @param selector 点击触发方法(默认响应UIControlEventTouchUpInside)
 @param target 响应者
 */
- (void)bz_addRightViewWithImageName:(NSString *)imageName andSelector:(SEL)selector andTarget:(id)target
{
    UIButton *btn = [[UIButton alloc] init];
    [btn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    
    [self addRightViewWithButton:btn andZoom:DefaultZoom];
    
    [btn addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
}

/**
 给TextField右视图添加按钮，按钮图片使用传入图片名称
 
 @param imageName 图片名称
 @param zoom 按钮图片缩放比例 0~1
 @param selector 点击触发方法(默认响应UIControlEventTouchUpInside)
 @param target 响应者
 */
- (void)bz_addRightViewWithImageName:(NSString *)imageName andZoom:(CGFloat)zoom andSelector:(SEL)selector andTarget:(id)target
{
    UIButton *btn = [[UIButton alloc] init];
    [btn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    
    [self addRightViewWithButton:btn andZoom:zoom];
    
    [btn addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
}

/**
 给TextField右视图添加按钮
 
 @param normalImageName 正常状态图片名称
 @param selectedImageName 选中状态图片名称
 @param selector 点击触发方法(默认响应UIControlEventTouchUpInside)
 @param target 响应者
 */
- (void)bz_addRightViewWithNormalImageName:(NSString *)normalImageName andSelectedImageName:(NSString *)selectedImageName andSelector:(SEL)selector andTarget:(id)target
{
    UIButton *btn = [[UIButton alloc] init];
    [btn setImage:[UIImage imageNamed:normalImageName] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:normalImageName] forState:UIControlStateSelected];
    
    [self addRightViewWithButton:btn andZoom:DefaultZoom];
    
    [btn addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
}

/**
 给TextField右视图添加按钮
 
 @param normalImageName 正常状态图片名称
 @param selectedImageName 选中状态图片名称
 @param zoom 按钮图片缩放比例 0~1
 @param selector 点击触发方法(默认响应UIControlEventTouchUpInside)
 @param target 响应者
 */
- (void)bz_addRightViewWithNormalImageName:(NSString *)normalImageName andSelectedImageName:(NSString *)selectedImageName andZoom:(CGFloat)zoom andSelector:(SEL)selector andTarget:(id)target
{
    UIButton *btn = [[UIButton alloc] init];
    [btn setImage:[UIImage imageNamed:normalImageName] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:normalImageName] forState:UIControlStateSelected];
    
    [self addRightViewWithButton:btn andZoom:zoom];
    
    [btn addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
}

#pragma mark - Block

/**
 给TextField右视图添加按钮
 
 @param btn 按钮
 @param callBack 按钮点击回调
 */
- (void)bz_addRightViewWithButton:(UIButton *)btn callBack:(UITextFieldBZAddCallBack)callBack
{
    [self bz_addRightViewWithButton:btn andZoom:DefaultZoom callBack:callBack];
}

/**
 给TextField右视图添加按钮
 
 @param btn 按钮
 @param zoom 按钮图片缩放比例 0~1
 @param callBack 按钮点击回调
 */
- (void)bz_addRightViewWithButton:(UIButton *)btn andZoom:(CGFloat)zoom callBack:(UITextFieldBZAddCallBack)callBack
{
    [self addRightViewWithButton:btn andZoom:zoom];
    
    if (callBack) {
        self.callBack = callBack;
    }
    
    [btn addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
}

/**
 给TextField右视图添加按钮，按钮图片使用传入图片名称
 
 @param imageName 图片名称
 @param callBack 按钮点击回调
 */
- (void)bz_addRightViewWithImageName:(NSString *)imageName callBack:(UITextFieldBZAddCallBack)callBack
{
    [self bz_addRightViewWithImageName:imageName andZoom:DefaultZoom callBack:callBack];
}

/**
 给TextField右视图添加按钮，按钮图片使用传入图片名称
 
 @param imageName 图片名称
 @param zoom 按钮图片缩放比例 0~1
 @param callBack 按钮点击回调
 */
- (void)bz_addRightViewWithImageName:(NSString *)imageName andZoom:(CGFloat)zoom callBack:(UITextFieldBZAddCallBack)callBack
{
    UIButton *btn = [[UIButton alloc] init];
    [btn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];

    [self bz_addRightViewWithButton:btn andZoom:zoom callBack:callBack];
}

/**
 给TextField右视图添加按钮
 
 @param normalImageName 正常状态图片名称
 @param selectedImageName 选中状态图片名称
 @param callBack 按钮点击回调
 */
- (void)bz_addRightViewWithNormalImageName:(NSString *)normalImageName andSelectedImageName:(NSString *)selectedImageName callBack:(UITextFieldBZAddCallBack)callBack
{
    UIButton *btn = [[UIButton alloc] init];
    [btn setImage:[UIImage imageNamed:normalImageName] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:selectedImageName] forState:UIControlStateSelected];
    
    [self bz_addRightViewWithButton:btn andZoom:DefaultZoom callBack:callBack];
}

/**
 给TextField右视图添加按钮
 
 @param normalImageName 正常状态图片名称
 @param selectedImageName 选中状态图片名称
 @param zoom 按钮图片缩放比例 0~1
 @param callBack 按钮点击回调
 */
- (void)bz_addRightViewWithNormalImageName:(NSString *)normalImageName andSelectedImageName:(NSString *)selectedImageName andZoom:(CGFloat)zoom callBack:(UITextFieldBZAddCallBack)callBack;
{
    UIButton *btn = [[UIButton alloc] init];
    [btn setImage:[UIImage imageNamed:normalImageName] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:selectedImageName] forState:UIControlStateSelected];
    
    [self bz_addRightViewWithButton:btn andZoom:zoom callBack:callBack];
}

#pragma mark - 私有方法

#pragma mark - Data

- (UITextFieldBZAddCallBack)callBack
{
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setCallBack:(UITextFieldBZAddCallBack)callBack
{
    objc_setAssociatedObject(self, @selector(callBack), callBack, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

#pragma mark - Action

- (void)btnClicked:(UIButton *)sender
{
    sender.selected = !sender.selected;
    
    if (self.callBack) {
        self.callBack(sender);
    }
}

#pragma mark - UI

- (void)addRightViewWithButton:(UIButton *)btn andZoom:(CGFloat)zoom
{
    CGRect zeroFrame = CGRectZero;
    CGRect btnFrame  = btn.frame;
    
    //如果没有指定按钮的frame
    //则给定textField的高度作为按钮的宽高
    if (CGRectEqualToRect(zeroFrame, btnFrame)) {
        CGFloat WH = self.frame.size.height;
        btnFrame = CGRectMake(0, 0, WH, WH);
        btn.frame = btnFrame;
    }
    
    CGFloat btnW = btn.frame.size.width;
    CGFloat btnH = btn.frame.size.height;
    
    CGFloat btnWHMin = MIN(btnW, btnH);
    CGFloat zomeWH = btnWHMin * zoom;
    
    btn.imageEdgeInsets = UIEdgeInsetsMake(zomeWH, zomeWH, zomeWH, zomeWH);
    
    self.rightView = btn;
    self.rightViewMode = UITextFieldViewModeAlways;
}

@end
