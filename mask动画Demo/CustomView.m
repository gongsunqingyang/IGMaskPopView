//
//  CustomView.m
//  mask动画Demo
//
//  Created by yanglin on 2019/3/15.
//  Copyright © 2019 瓦普时代. All rights reserved.
//

#import "CustomView.h"

@interface CustomView ()
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UIButton *btn;
@end

@implementation CustomView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    UIImageView *imageView = [UIImageView new];
    imageView.image = [UIImage imageNamed:@"2"];
    [self addSubview:imageView];
    _imageView = imageView;
    
    UIButton *btn = [UIButton new];
    [btn setTitle:@"Close" forState:UIControlStateNormal];
    btn.backgroundColor = [UIColor orangeColor];
    [btn addTarget:self action:@selector(clickCloseBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:btn];
    _btn = btn;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.imageView.frame = CGRectInset(self.bounds, 100, 100);
    self.btn.frame = CGRectMake(100, 100, 100, 44);
}

- (void)clickCloseBtn:(UIButton *)sender {
    if (self.closeBlock) {
        self.closeBlock();
    }
}

@end
