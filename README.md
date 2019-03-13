## 简介
> **IGPopView** 一个简单的弹窗，可自定义父视图，遮罩颜色。
> **IGMaskPopView** 基于IGPopView，带遮罩的弹框，可自定义弹出方向，弹出边界

## 预览
![Mask动画](https://github.com/gongsunqingyang/IGMaskPopView/blob/master/Preview/Untitled.gif)![Pop弹框](https://github.com/gongsunqingyang/IGMaskPopView/blob/master/Preview/Untitled1.gif)![PopMask动画弹框](https://github.com/gongsunqingyang/IGMaskPopView/blob/master/Preview/Untitled2.gif)![Example](https://github.com/gongsunqingyang/IGMaskPopView/blob/master/Preview/Untitled3.gif)

## 使用

> **IGPopView**

- 基本使用
```objective-c
IGPopView *popView = [IGPopView new];
popView.contentView = self.view;
[popView show];
```
- 代理方法 IGPopViewDelegate

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
