//
//  IGPopView.h
//  IGXEAssistant
//
//  Created by yanglin on 2018/7/3.
//  Copyright © 2018年 Softisland. All rights reserved.
//

#import <UIKit/UIKit.h>

@class IGPopView;

@protocol IGPopViewDelegate <NSObject>
@optional
- (void)popViewWillShow:(IGPopView *)popView;       
- (void)popViewWillDismiss:(IGPopView *)popView;
- (void)popViewDidShow:(IGPopView *)popView;
- (void)popViewDidDismiss:(IGPopView *)popView;
- (BOOL)popViewShouldShow:(IGPopView *)popView;
- (BOOL)popViewShouldDismiss:(IGPopView *)popView;
@end

@interface IGPopView : UIScrollView
@property (nonatomic, weak) UIView *contentView;            // 父视图
@property (nonatomic, weak) UIColor *coverColor;            // 遮盖颜色
@property (nonatomic, assign) BOOL dismissOnTouchOutside;   // 点击遮盖隐藏弹框（默认YES）
@property (nonatomic, assign, readonly) BOOL showing;       // 已打开
@property (nonatomic, weak) id model;
@property (nonatomic, weak) id <IGPopViewDelegate> popDelegate;

- (void)setupUI;
- (void)setupConstraints;
- (void)show;
- (void)dismiss;
@end
