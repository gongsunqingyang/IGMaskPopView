//
//  YLPopupView.m
//  mask动画Demo
//
//  Created by yanglin on 2019/3/14.
//  Copyright © 2019 瓦普时代. All rights reserved.
//

#import "YLPopupView.h"


static const CGFloat kYLPopupViewAnimationDuration = .2f;


@interface YLPopupView ()
@property (nonatomic, assign, getter=isShowing) BOOL showing;

@end


@implementation YLPopupView

#pragma mark - Class methods
+ (instancetype)showTo:(UIView *)view animated:(BOOL)animated {
    YLPopupView *popup = [[YLPopupView alloc] initWithView:view];
    [view addSubview:popup];
    [popup showAnimated:animated];
    return popup;
}

+ (BOOL)hideForView:(UIView *)view animated:(BOOL)animated {
    YLPopupView *popup = [self popupForView:view];
    if (popup) {
        [popup hideAnimated:animated];
        return YES;
    }
    return NO;
}

+ (instancetype)popupForView:(UIView *)view {
    NSEnumerator *subviewsEnum = [view.subviews reverseObjectEnumerator];
    for (UIView *subview in subviewsEnum) {
        if ([subview isKindOfClass:self]) {
            return (YLPopupView *)subview;
        }
    }
    return nil;
}

#pragma mark - Lifecycle
- (instancetype)initWithView:(UIView *)view {
    NSAssert(view, @"父视图不能为空");
    return [self initWithFrame:view.bounds];
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self commonInit];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        [self commonInit];
    }
    return self;
}

- (void)commonInit {
    self.hideOnTouch = YES;
    [self setupUI];
}

#pragma mark - UI
- (void)setupUI {    
    self.backgroundColor = [UIColor colorWithWhite:0 alpha:0.4];
    self.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
}

#pragma mark - Show & Hide
- (void)showAnimated:(BOOL)animated {
    self.showing = YES;
    if (animated) {
        self.alpha = 0.f;
        [UIView animateWithDuration:kYLPopupViewAnimationDuration
                         animations:^{
                             self.alpha = 1.f;
                         }
                         completion:^(BOOL finished) {
                             NSLog(@"show finished");
                             if (self.showCompletionBlock) {
                                 self.showCompletionBlock();
                             }
                         }];
    } else {
        self.alpha = 1.f;
        if (self.showCompletionBlock) {
            self.showCompletionBlock();
        }
    }
}

- (void)hideAnimated:(BOOL)animated {
    if (animated) {
        self.alpha = 1.f;
        [UIView animateWithDuration:kYLPopupViewAnimationDuration
                         animations:^{
                             self.alpha = 0.f;
                         }
                         completion:^(BOOL finished) {
                             NSLog(@"hide finished");
                             [self removeFromSuperview];
                             self.showing = NO;
                             if (self.hideCompletionBlock) {
                                 self.hideCompletionBlock();
                             }
                         }];
    } else {
        NSLog(@"hide finished");
        self.alpha = 0.f;
        self.showing = NO;
        if (self.hideCompletionBlock) {
            self.hideCompletionBlock();
        }
    }
}

- (void)hideAnimated:(BOOL)animated afterDelay:(NSTimeInterval)delay {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delay * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self hideAnimated:animated];
    });
}

- (void)hideWithAnimated {
    [self hideAnimated:YES];
}

- (void)hideWithoutAnimated {
    [self hideAnimated:NO];
}

#pragma mark - Setter
- (void)setCustomView:(UIView *)customView {
    if (_customView != customView) {
        _customView = customView;
        customView.frame = self.bounds;
        [self addSubview:customView];
    }
}

- (void)setHideOnTouch:(BOOL)hideOnTouch {
    if (_hideOnTouch != hideOnTouch) {
        _hideOnTouch = hideOnTouch;
        if (hideOnTouch) {
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideWithAnimated)];
            [self addGestureRecognizer:tap];
            
        } else {
            UIGestureRecognizer *gesture = [self.gestureRecognizers firstObject];
            [self removeGestureRecognizer:gesture];
        }
    }
}

@end
