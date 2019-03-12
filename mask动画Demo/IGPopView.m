//
//  IGPopView.m
//  IGXEAssistant
//
//  Created by yanglin on 2018/7/3.
//  Copyright © 2018年 Softisland. All rights reserved.
//

#import "IGPopView.h"

@interface IGPopView ()
@property (nonatomic, strong) UIButton *coverBtn;
@property (nonatomic, assign) BOOL showing;
@end


@implementation IGPopView

- (void)dealloc {
//    NSLog(@"IGPopView 销毁");
}
 
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
        [self setupConstraints];
    }
    return self;
}

- (void)setupUI {
    self.backgroundColor = [UIColor colorWithWhite:0 alpha:0.4];
    
    self.coverBtn = [UIButton new];
    [self.coverBtn addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.coverBtn];
}

- (void)setupConstraints {
    
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.contentSize = self.contentView.bounds.size;
    self.coverBtn.frame = self.contentView.bounds;
}

- (void)show {
    if (_popDelegate && [_popDelegate respondsToSelector:@selector(popViewShouldShow:)]) {
        if (![_popDelegate popViewShouldShow:self]) {
            return;
        }
    }
    
    if (self.showing) {
        return;
    }
    self.showing = YES;
    
    if (self.contentView) {
        [self.contentView addSubview:self];
        
        if (_popDelegate && [_popDelegate respondsToSelector:@selector(popViewWillShow:)]) {
            [_popDelegate popViewWillShow:self];
        }
        
        self.alpha = 0;
        [UIView animateWithDuration:0.2 animations:^{
            self.alpha = 1;
            if (_popDelegate && [_popDelegate respondsToSelector:@selector(popViewDidShow:)]) {
                [_popDelegate popViewDidShow:self];
            }
        }];
    }
}

- (void)dismiss {
    if (_popDelegate && [_popDelegate respondsToSelector:@selector(popViewShouldDismiss:)]) {
        if (![_popDelegate popViewShouldDismiss:self]) {
            return;
        }
    }
    
    if (self.showing == NO) {
        return;
    }
    self.showing = NO;
    
    if (_popDelegate && [_popDelegate respondsToSelector:@selector(popViewWillDismiss:)]) {
        [_popDelegate popViewWillDismiss:self];
    }
    
    self.alpha = 1;
    [UIView animateWithDuration:0.2 animations:^{
        self.alpha = 0;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
        
        if (_popDelegate && [_popDelegate respondsToSelector:@selector(popViewDidDismiss:)]) {
            [_popDelegate popViewDidDismiss:self];
        }
    }];
}

- (void)setContentView:(UIView *)contentView {
    _contentView = contentView;
    self.frame = contentView.frame;
}

- (void)setDismissOnTouchOutside:(BOOL)dismissOnTouchOutside {
    _dismissOnTouchOutside = dismissOnTouchOutside;
    self.coverBtn.userInteractionEnabled = dismissOnTouchOutside;
}

- (void)setCoverColor:(UIColor *)coverColor {
    _coverColor = coverColor;
    self.backgroundColor = coverColor;
}


@end
