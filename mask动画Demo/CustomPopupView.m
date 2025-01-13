//
//  CustomPopupView.m
//  mask动画Demo
//
//  Created by yanglin on 2019/3/15.
//  Copyright © 2019 瓦普时代. All rights reserved.
//

#import "CustomPopupView.h"

@interface CustomPopupView ()
@property (nonatomic, strong) UIImageView *imageView;

@end

@implementation CustomPopupView

#pragma mark - Lifecycle
//+ (instancetype)showTo:(UIView *)view animated:(BOOL)animated {
//    CustomPopupView *popup = [super showTo:view animated:animated];
//    return popup;
//}

//- (instancetype)initWithView:(UIView *)view {
//    self = [super initWithView:view];
//    if (self) {
//        [self commonInit];
//    }
//    return self;
//}
//
//- (void)commonInit {
//    [self setupUI];
//}

- (void)showAnimated:(BOOL)animated {
    [super showAnimated:animated];
    [self setupUI2];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.imageView.frame = CGRectInset(self.bounds, 5, 5);
}

#pragma mark - UI
- (void)setupUI2 {
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectInset(self.bounds, 5, 5)];
    imageView.image = [UIImage imageNamed:@"2"];
    self.customView = imageView;
}



@end
