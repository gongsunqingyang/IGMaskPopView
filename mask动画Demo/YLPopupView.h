//
//  YLPopupView.h
//  mask动画Demo
//
//  Created by yanglin on 2019/3/14.
//  Copyright © 2019 瓦普时代. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef void(^YLPopupCompletionBlock)();

@interface YLPopupView : UIView
@property (nonatomic, strong) UIView *customView;
@property (nonatomic, copy) YLPopupCompletionBlock showCompletionBlock;
@property (nonatomic, copy) YLPopupCompletionBlock hideCompletionBlock;
@property (nonatomic, assign) BOOL hideOnTouch;


+ (instancetype)showTo:(UIView *)view animated:(BOOL)animated;
+ (BOOL)hideForView:(UIView *)view animated:(BOOL)animated;
+ (instancetype)popupForView:(UIView *)view;
- (instancetype)initWithView:(UIView *)view;
- (void)showAnimated:(BOOL)animated;
- (void)hideAnimated:(BOOL)animated;
- (void)hideAnimated:(BOOL)animated afterDelay:(NSTimeInterval)delay;
- (BOOL)isShowing;
@end

NS_ASSUME_NONNULL_END
