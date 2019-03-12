//
//  CustomPopView.m
//  mask动画Demo
//
//  Created by yanglin on 2019/3/11.
//  Copyright © 2019 瓦普时代. All rights reserved.
//

#import "CustomPopView.h"

@interface CustomPopView ()
@property (nonatomic, strong) UIView *containerView;
@property (nonatomic, strong) UIButton *closeBtn;
@end

@implementation CustomPopView

- (void)setupUI {
    [super setupUI];
    
    [self addSubview:self.containerView];
    [self.containerView addSubview:self.closeBtn];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    _containerView.frame = CGRectMake(100, 100, 200, 300);
    _closeBtn.frame = CGRectMake(0, 0, 80, 40);
}


#pragma mark - Getter
- (UIView *)containerView {
    if (!_containerView) {
        _containerView = [UIView new];
        _containerView.backgroundColor = [UIColor whiteColor];
    }
    return _containerView;
}

- (UIButton *)closeBtn {
    if (!_closeBtn) {
        _closeBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        [_closeBtn setTitle:@"Close" forState:0];
        [_closeBtn addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];
    }
    return _closeBtn;
}


@end
