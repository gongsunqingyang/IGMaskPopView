//
//  IGMaskPopView.m
//  mask动画Demo
//
//  Created by yanglin on 2019/3/8.
//  Copyright © 2019 瓦普时代. All rights reserved.
//

#import "IGMaskPopView.h"

@interface IGMaskPopView () <IGPopViewDelegate>
@property (nonatomic, strong) UIView *maskView;

@property (nonatomic, assign) CGRect startRect;
@property (nonatomic, assign) CGRect endRect;
@property (nonatomic, assign) CGRect startMaskRect;
@property (nonatomic, assign) CGRect endMaskRect;

@property (nonatomic, assign) CGFloat animationDuration;
@property (nonatomic, assign) BOOL animating;
@property (nonatomic, assign) BOOL animationComplete;


@end

@implementation IGMaskPopView

- (void)setupUI {
    [super setupUI];
    
    self.popDelegate = self;
    [self addSubview:self.containerView];
}

- (void)configWithDirection:(IGMaskPopViewDirection)direction
          animationDuration:(CGFloat)animationDuration
              containerRect:(CGRect)containerRect {
    CGFloat startX, startY, endX, endY, startMaskX, startMaskY, endMaskX, endMaskY;
    CGFloat w = containerRect.size.width;
    CGFloat h = containerRect.size.height;
    endX = containerRect.origin.x;
    endY = containerRect.origin.y;
    endMaskX = 0.f;
    endMaskY = 0.f;
    
    switch (direction) {
        case IGMaskPopViewDirectionUp: {
            startX = containerRect.origin.x;
            startY = containerRect.origin.y + h;
            startMaskX = 0;
            startMaskY = -h;
        }
            break;
        case IGMaskPopViewDirectionLeft: {
            startX = containerRect.origin.x + w;
            startY = containerRect.origin.y;
            startMaskX = -w;
            startMaskY = 0;
        }
            break;
        case IGMaskPopViewDirectionDown: {
            startX = containerRect.origin.x;
            startY = containerRect.origin.y - h;
            startMaskX = 0;
            startMaskY = h;
        }
            break;
        case IGMaskPopViewDirectionRight: {
            startX = containerRect.origin.x - w;
            startY = containerRect.origin.y;
            startMaskX = w;
            startMaskY = 0;
        }
            break;
    }
    
    _animationDuration = animationDuration;
    _startRect = CGRectMake(startX, startY, w, h);
    _endRect = containerRect;
    _startMaskRect = CGRectMake(startMaskX, startMaskY, w, h);
    _endMaskRect = CGRectMake(endMaskX, endMaskY, w, h);
}

#pragma mark - IGPopViewDelegate
- (void)popViewWillShow:(IGPopView *)popView {
    _animating = YES;
    _containerView.frame = _startRect;
    _maskView.frame = _startMaskRect;
    [UIView animateWithDuration:_animationDuration
                     animations:^{
                         _containerView.frame = _endRect;
                         _maskView.frame = _endMaskRect;
                     }
                     completion:^(BOOL finished) {
                         _animating = NO;
                     }];
}

- (BOOL)popViewShouldDismiss:(IGPopView *)popView {
    if (_animating) {
        return NO;
    }
    
    if (_animationComplete) {
        return YES;
    } else {
        _animating = YES;
        _animationComplete = NO;
        _containerView.frame = _endRect;
        _maskView.frame = _endMaskRect;
        [UIView animateWithDuration:_animationDuration
                         animations:^{
                             _containerView.frame = _startRect;
                             _maskView.frame = _startMaskRect;
                         }
                         completion:^(BOOL finished) {
                             _animating = NO;
                             _animationComplete = YES;
                             [super dismiss];
                         }];
        return NO;
    }
}

#pragma mark - Getter

- (UIView *)containerView {
    if (!_containerView) {
        _containerView = [UIView new];
        _containerView.backgroundColor = [UIColor whiteColor];
        _containerView.maskView = self.maskView;
    }
    return _containerView;
}

- (UIView *)maskView {
    if (!_maskView) {
        _maskView = [UIView new];
        _maskView.backgroundColor = [UIColor whiteColor];
    }
    return _maskView;
}

@end
