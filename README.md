# IGMaskPopView
----------

## Introduction
> **IGMaskPopView** A popover with mask, can be customized mask boundary, popup direction. Based on IGPopView, the design concept refers to MBProgressHUD. It can customize the parent view and child view.

## 预览
![Mask动画](https://github.com/gongsunqingyang/IGMaskPopView/blob/master/Preview/Untitled.gif)
![Pop弹框](https://github.com/gongsunqingyang/IGMaskPopView/blob/master/Preview/Untitled1.gif)
![PopMask动画弹框](https://github.com/gongsunqingyang/IGMaskPopView/blob/master/Preview/Untitled2.gif)
![Example](https://github.com/gongsunqingyang/IGMaskPopView/blob/master/Preview/Untitled3.gif)

## Preview

> **IGPopView**

- usage
```objective-c
IGPopView *popView = [IGPopView new];
popView.contentView = self.view;
[popView show];
```
- Proxy *IGPopViewDelegate*

```objective-c
- (void)popViewWillShow:(IGPopView *)popView;       
- (void)popViewWillDismiss:(IGPopView *)popView;
- (void)popViewDidShow:(IGPopView *)popView;
- (void)popViewDidDismiss:(IGPopView *)popView;
- (BOOL)popViewShouldShow:(IGPopView *)popView;
- (BOOL)popViewShouldDismiss:(IGPopView *)popView;
```

> **IGMaskPopView**

- usage
```objective-c
- (void)configWithDirection:(IGMaskPopViewDirection)direction animationDuration:(CGFloat)animationDuration containerRect:(CGRect)containerRect;
```

----------
----------

# IGMaskPopView
----------

## 简介
> **IGMaskPopView** 一个带蒙版的弹窗，可自定义蒙版边界，弹出方向。基于IGPopView，设计思路参考了MBProgressHUD，可自定义父视图，子视图。

## 预览
![Mask动画](https://github.com/gongsunqingyang/IGMaskPopView/blob/master/Preview/Untitled.gif)
![Pop弹框](https://github.com/gongsunqingyang/IGMaskPopView/blob/master/Preview/Untitled1.gif)
![PopMask动画弹框](https://github.com/gongsunqingyang/IGMaskPopView/blob/master/Preview/Untitled2.gif)
![Example](https://github.com/gongsunqingyang/IGMaskPopView/blob/master/Preview/Untitled3.gif)

## 使用

> **IGPopView**

- 基本使用
```objective-c
IGPopView *popView = [IGPopView new];
popView.contentView = self.view;
[popView show];
```
- 代理方法 *IGPopViewDelegate*

```objective-c
- (void)popViewWillShow:(IGPopView *)popView;       
- (void)popViewWillDismiss:(IGPopView *)popView;
- (void)popViewDidShow:(IGPopView *)popView;
- (void)popViewDidDismiss:(IGPopView *)popView;
- (BOOL)popViewShouldShow:(IGPopView *)popView;
- (BOOL)popViewShouldDismiss:(IGPopView *)popView;
```

> **IGMaskPopView**

- 基本使用
```objective-c
- (void)configWithDirection:(IGMaskPopViewDirection)direction animationDuration:(CGFloat)animationDuration containerRect:(CGRect)containerRect;
```
